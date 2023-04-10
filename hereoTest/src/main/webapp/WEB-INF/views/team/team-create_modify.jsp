<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/hereoTest/resources/css/team/team_common.css" />
<link rel="stylesheet" href="/hereoTest/resources/css/team/team.css" />
<script src="/hereoTest/resources/js/common/jquery.validate.min.js"></script>


	<section class="teamcreate-main">
		<div class="container-create-input">
			<h3 class="title-teamcreate">팀 개설 지원서</h3>
			<fieldset class="">
				<form action="<c:url value='/team/create'></c:url>" method="POST" class="form-horizontal" enctype="multipart/form-data">
					<div class="form-group">
						<div class="team-selector">
							<label for="team_name">팀 명</label><br>
							<span name="tm_name">${team.tm_name }</span>
							<!-- <input type="text" class="col-lg-6" name="tm_name" id="team_name" placeholder="최소 3자~최대 8자" required>
							<button class="btn btn-dark btn-duplicateCheck" type="button">팀명 중복 체크</button>
							<br>
							<label for="team_name" id="team_name-error" class="error"></label> -->
						</div>
					</div>
					<div class="form-group">
						<label for="team-local">지역</label>
							<select name="tm_re_num" id="team-local" value="${team.tm_re_num }">
								<option value="1">서울</option>
								<option value="2">경기</option>
								<option value="3">인천</option>
								<option value="4">대전</option>
								<option value="5">충남</option>
								<option value="6">충북</option>
								<option value="7">광주</option>
								<option value="8">전남</option>
								<option value="9">전북</option>
								<option value="10">강원</option>
								<option value="11">부산</option>
								<option value="12">울산</option>
								<option value="13">대구</option>
								<option value="14">경남</option>
								<option value="15">경북</option>
								<option value="16">제주</option>
							</select>
					</div>
					<div class="form-group">
						<label for="team-gender">팀 성별 구성</label>
							<select name="tm_teamgender" id="team-gender" value="${team.tm_teamgender}">
								<option value="1">남녀 혼성</option>
								<option value="2">남성만</option>
								<option value="3">여성만</option>
							</select>
					</div>
					<div class="form-group">
						<label for="team-match">연습경기 신청 허용 여부</label>
							<select name="tm_openformatch" id="team-match" value="${team.tm_openformatch }">
								<option value="true">허용</option>
								<option value="false">불가</option>
							</select>
					</div>
					
					<div class="form-group">
						<label for="team-since">팀 창단일</label>
						<input type="date" name="tm_startday" id="team-since" class="form-control  col-lg-8" placeholder="팀 창단일을 입력해주세요." value="${team.tm_startday }">
					</div>
					
						<div class="form-group">
							<label for="teamLogo">팀 로고 이미지 파일</label><br>
							<c:if test="${not empty team.tm_team_img }"><img src="<c:url value='/files${team.tm_team_img}'></c:url>"></c:if>
							<input type="file" name="imgFile" id="teamLogo" accept="">
								
						</div>
						
						<div class="form-group">
							<label for="tm_slogan">팀 슬로건</label><br>
							<input type="text" class="col-lg-12" name="tm_slogan" id = "tm_slogan" placeholder="최대 25자 이내로 입력해주십시오." value="${team.tm_slogan }">
						</div>
						<div class="form-group">
						
							<!-- <label for="tm_backnum">팀장 백넘버</label><br>
							<input type="text" class="" name="tm_backnum" id = "tm_backnum" placeholder="0~99의 숫자 입력"> -->
						</div>
						<div class="form-group">
							<label for="tm_team_introduce">팀 소개</label><br>
							<textarea placeholder="팀 소개를 입력해주십시오.">${team.tm_team_introduce }</textarea>
							
						</div>
						
						
						
						
						<button type="submit" class="btn btn-dark col-lg-12">팀 신청</button>
					



				</form>
			</fieldset>
		</div>

	</section>

	
	<script
      src="https://kit.fontawesome.com/bedfa56d7f.js"
      crossorigin="anonymous"
			
    ></script>
    <script>
    	let teamNameDupCheck = false;
    	$('.btn-duplicateCheck').click(function(e){
    		e.preventDefault();
    		let tmpName = $('[name=tm_name]')
    		if(!$(tmpName).valid()){
    			alert('사용 불가능한 팀명입니다.');
    			return;
    		}
    		let tmpObj = {
    				tm_name : tmpName.val()
    		}
    		ajax("POST", tmpObj, '<c:url value="/team/create_dupCheck"></c:url>', function(data){
    			teamNameDupCheck = data.res;
    			if(data.res){
    				alert('사용가능한 팀명입니다.');
    				$('.btn-duplicateCheck').removeClass('btn-dark').text('중복 체크 완료')
    			}else{
    				alert('이미 존재하는 팀명입니다.');
    			}
    		})
    		
    	})
    	$('[name=tm_name]').change(function(){
    		teamNameDupCheck=false;
			$('.btn-duplicateCheck').addClass('btn-dark').text('팀명 중복 체크')

    	})
    	
    	
    $(function(){
			
    	$("form").validate({
	        rules: {
	            tm_name: {
	                required : true,
	               /*  minlength : 3, 
					maxlength : 8, */
					regex : /^[ㄱ-ㅎ가-힣a-zA-Z0-9]{3,8}$/ 
					
            }, tm_backnum:{
            	required : true,
            	regex:/^[0-9]{1,2}$/
            }
    	},
       
        messages : {
        	tm_name: {
                required : "필수로 입력하세요",
                regex : "3~8 글자, 한글, 영문 숫자만 가능합니다."
            }, tm_backnum:{
            	required : "필수로 입력하세요.",
            	regex : "두자리 숫자만 가능합니다."
            }
            
            
       	},//
					submitHandler : function (form){
						if(!teamNameDupCheck){
			    			alert('팀명 중복 체크를 해주세요.');
			    			return false;
			    		}
						if(!confirm('정말 해당 정보로 팀을 신청합니까?')){
							return false;
						}
						return true;
					} 
    	});
		})
$.validator.addMethod(
    "regex",
    function(value, element, regexp) {
        var re = new RegExp(regexp);
        return this.optional(element) || re.test(value);
    },
    "Please check your input."
);	
 	function ajax(method, obj, url, successFunc, errorFunc){
		$.ajax({
			async:false,
			type: method,
			data: JSON.stringify(obj),
			url: url, 
			dataType: "json",
			contentType:"application/json; charset=UTF-8",
			success: successFunc,
			error: errorFunc
			
		});
	}
    </script>