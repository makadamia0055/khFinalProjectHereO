<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	<style>	
	.stadium-add{
	position: absolute;  left: 20%;  margin-left: 30px;
	padding: 20px 0 20px 0; box-sizing: border-box; 
	border-radius: 10px;  margin-top: 150px;
	}
	form {
		max-width: 800px;
		margin: 0 auto;
		padding: 15px;
		border: 1px solid #333;
		border-radius: 10px;
		background-color: #f8f8f8;
	}
	h2 {
		text-align: center;
	}
	label {
		display: block;
		margin-bottom: 10px;
		font-weight: bold;
	}
	input[name="sd-name"],input[name="rd-zipcode"],
	input[name="rd-address"],input[name="rd_detail-address"],
	input[name="sd-intro"],
	textarea {
		width: 100%;
		padding: 5px;
		border-radius: 5px;
		border: 1px solid #ccc;
		box-sizing: border-box;
		font-size: 14px;
		margin-bottom: 10px;
		resize: none;
	}
	input[type="tel"],[name="btn-post"]{
		padding: 5px;
		border-radius: 5px;
		border: 1px solid #ccc;
		box-sizing: border-box;
		font-size: 14px;
		margin-bottom: 10px;
		resize: none;
	}
	#stadium-image{
		margin-bottom: 10px;
	}
	.stadium-insert-btn{
		width: 100%; border-radius: 10px;
	}
    .fileup {
        display: flex;
        flex-wrap: wrap;
        justify-content: space-around;
    }
    .fileup > div {
        margin: 10px;
    }
    .file-box {
        display: flex;
        justify-content: center;
        align-items: center;
        width: 100px;
        height: 100px;
        color: #c3c3c3;
        border: 2px dashed #c3c3c3;
        border-radius: 5px;
        cursor: pointer;
	    }
	    [name=files]{
	    display:none;}
	    .file-box:hover {
	        border-color: #000;
	        color: #000;
	    }
	    .preview{
	    display:none;}
	</style>

	<div class="stadium-add">
		<h2>구장 등록</h2>
		<form action="<c:url value='/reservation/stadium/insert'></c:url>" method="post" enctype="multipart/form-data">
			<div class="form-group">
				<label for="stadium-name">구장명</label>
			    <input type="text" class="form-control" id="stadium-name" name="sd_name" maxlength="20">
			    <div id="stadium-name-error" class="error-message" style="display:none;">구장명을 입력하세요.</div>
			</div>
			<div class="form-group">
				<label for="stadium-address">구장 주소</label>
				<input type="hidden" id="sample6_postcode" name="rd_zipcode" placeholder="우편번호">
				<input type="button" onclick="sample6_execDaumPostcode()" name="btn-post" value="우편번호 찾기">
				<input type="hidden" id="sido" name="re_sido" placeholder="시">
				<input type="hidden" id="sigungo" name="rs_gu" placeholder="시군구">
				<input type="text" id="sample6_address" name="rd_address" placeholder="주소"><br>
				<span id="guide" style="color:#999;display:none"></span>
				<input type="text" id="sample6_detailAddress" name="rd_detail_address" placeholder="상세주소"><br>
				<input type="hidden" id="sample6_extraAddress" placeholder="참고항목">
			</div>
			<div class="form-group">
				<label for="stadium-phone">구장 연락처</label>
				<input type="text" name="sd_contact1" maxlength="3" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" >-
				<input type="text" name="sd_contact2" maxlength="4" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" >-
				<input type="text" name="sd_contact3" maxlength="4" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" >
				
			</div>
			<div class="form-group">
				<label for="stadium-description" >시설 사용 규칙</label>
			</div>
				<textarea id="stadium-description" name="sd_intro" maxlength="1000" placeholder="구장 소개를 입력하세요."></textarea><br>
			<div id="image">
			<label>첨부파일</label>
			<div class="fileup form-group mt-3">				
			    <div>
			        <label>
			            <div class="file-box">추가</div>
			            <input type="file" class="form-control" name="files" accept="image/*" onchange="readURL(this);">
			            <img class="preview" height="100" width="100">
			        </label>
			    </div>
			    <div>
			        <label>
			            <div class="file-box">추가</div>
			            <input type="file" class="form-control" name="files" accept="image/*" onchange="readURL(this);">
			            <img class="preview" height="100" width="100">
			        </label>
			    </div>
			    <div>
			        <label>
			            <div class="file-box">추가</div>
			            <input type="file" class="form-control" name="files" accept="image/*" onchange="readURL(this);">
			            <img class="preview" height="100" width="100">
			        </label>
			    </div>
			    <div>
			        <label>
			            <div class="file-box">추가</div>
			            <input type="file" class="form-control" name="files" accept="image/*" onchange="readURL(this);">
			            <img class="preview" height="100" width="100">
			        </label>
			    </div>
			</div>
		</div>
			<button class="btn btn-outline-success stadium-insert-btn">구장 등록 요청</button>
		</form>
	</div>
<script type="text/javascript">
	 $('.fileup input[type="file"]').change(function() {
	    if ($('.fileup input[type="file"]:not(:empty)').length >= 4) {
	      $('.fileup label').hide();
	    }
	  });

$('form').submit(function(){
	let sd_name = $('[name=sd_name]').val();
	if(sd_name.trim().length == 0){
		alert('구장명을 입력하세요.');
		$('[name=sd_name]').focus();
		return false;
	}
	let sd_contact1 = $('[name=sd_contact1]').val();
	let sd_contact2 = $('[name=sd_contact2]').val();
	let sd_contact3 = $('[name=sd_contact3]').val();
	let sd_contact = sd_contact1 + sd_contact2 + sd_contact3;
	if(sd_contact.trim().length == 0){
		alert('번호를 입력하세요.');
		$('[name=sd_contact1]').focus();
		return false;
	} 
	let sd_intro = $('[name=sd_intro]').val();
	if(sd_intro.trim().length  == 0){
		alert('내용을 입력하세요.');
		return false;
	}
});

function readURL(input){
	
	if(!input.files || !input.files[0]){
		input.nextElementSibling.src ='';
		input.previousElementSibling.style.display = 'block';
		return;
	}
	let reader = new FileReader();
	reader.onload = function(e){
		input.previousElementSibling.style.display = 'none';
		input.nextElementSibling.src = e.target.result;
		input.nextElementSibling.style.display = 'block';
	}
	reader.readAsDataURL(input.files[0]);
}
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample6_postcode").value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
	</script>
<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode({
			oncomplete: function(data) {
				// 시/군/구 정보를 sido input에 넣어줍니다.
				document.getElementById("sido").value = data.sido;
				//시군구 정보 넣어주기
				let data_sigungo = data.sigungu;
				if(data_sigungo == null){
					data_sigungo = data.bname;
				}
				$('#sigungo').val(data_sigungo)
                document.getElementById("sample6_postcode").value = data.zonecode;
				// 도로명주소 정보를 roadAddress input에 넣어줍니다.
				document.getElementById("sample6_address").value = data.roadAddress;

				// 지번주소 정보를 jibunAddress input에 넣어줍니다.
				document.getElementById("sample6_detailAddress").value = data.jibunAddress;
			}
		}).open();
	}
</script>