<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<c:url value='/resources/css/league/league-insert.css?version=202305151634'></c:url>" />
<link href="<c:url value='/resources/css/common/bootstrap.min.css'></c:url>" rel="stylesheet">
<link href="<c:url value='/resources/css/common/style.css'></c:url>" rel="stylesheet">
<script  type="text/javascript" src="<c:url value='/resources/js/common/jquery.js'></c:url>"></script>
<script  type="text/javascript" src="<c:url value='/resources/js/common/bootstrap.bundle.min.js'></c:url>"></script>
<script  type="text/javascript" src="<c:url value='/resources/js/common/popper.min.js'></c:url>"></script>
<script  type="text/javascript" src="<c:url value='/resources/js/common/jquery.validate.min.js'></c:url>"></script>
<style>
label.error{color:red;}
</style>
<body>
  <div class="main-container">
      <h2>리그생성 신청</h2>
      <form class="form-horizontal" action="<c:url value='/league/leagueInsert'></c:url>" method="post" enctype="multipart/form-data">
          <div class="form-group">
              <label for="leagueLogo">리그로고</label>
              <div class="col-sm-10">
                <input type="file" class="league-logo" name="le_logo">
              </div>
            </div>
            <c:if test="${!empty loginUser}">
            	<input type="text" name="lg_me_id" hidden value="${loginUser.me_id}">
            </c:if>
        <div class="form-group">
	        <div class="league-selector">
				<label for="league_name">리그이름</label><br>
				<input type="text" class="form-control league-name col-lg-6" name="lg_name" id="lg_name" placeholder="리그이름 5~20자" required>
				<label for="leagueName" id="leagueName-error" class="error"></label>
			</div>
			<div class="leagueNameCheck">
				<button class="btn btn-dark btn-duplicateCheck" type="button">리그이름 중복 체크</button>
			</div>
        </div>
        
        <div class="form-group">        
          <div class="col-sm-offset-2 col-sm-10">
            <button type="submit" class="btn btn-outline-success">리그신청하기</button>
          </div>
        </div>
      </form>
    </div>

    <script>
    let leagueNameDupCheck = false;
    $('.btn-duplicateCheck').click(function(){
    	let lg_name = $('[name=lg_name]').val();
    	if(lg_name.trim().length == 0){
    		alert('리그이름을 입력하세요.');
    		return;
    	}
    	let url = '<c:url value ="/check/lgName"></c:url>'
    	let method = 'post';
    	let obj = {
    		lg_name : lg_name
    	}
    	$.ajax({
            async:false,
            type:method,
            data: JSON.stringify(obj),
            url:url,
            dataType:"json",
            contentType:"application/json; charset=UTF-8",
            success : function(data){
                if(data.res){
                	alert('사용 가능한 리그이름입니다.');
                	leagueNameDupCheck = true;
                }else{
                	alert('이미 사용중인 리그이름입니다.');
                }
            }
        });
    });
    $('[name=lg_name]').change(function(){
    	leagueNameDupCheck = false;
    });
    
	$('form').validate({
		rules:{
			lg_name : {
				required : true,
				regex : /^[가-힣a-zA-Z0-9]{2,20}$/
			}
		},
		messages:{
			lg_name : {
				required : '필수 항목입니다.',
				regex : "리그이름은 2~20자, 영문, 한글, 숫자만 가능합니다." 
			}
		},
		submitHandler: function(form){
			if(!leagueNameDupCheck){
				alert('리그이름 중복체크를 하세요.');
				return false;
			}
			return true;
		}
	});
$.validator.addMethod(
	"regex",
	function(value, element, regexp) {
		var re = new RegExp(regexp);
		return this.optional(element) || re.test(value);
	},
	"Please check your input."
);

</script>