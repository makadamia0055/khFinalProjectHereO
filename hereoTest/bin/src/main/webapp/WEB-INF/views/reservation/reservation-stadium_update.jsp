<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<link rel="stylesheet" href="<c:url value='/resources/css/reservation/reservation-stadium_insert.css'></c:url>" />
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
	#stadium-image{
		margin-bottom: 10px;
	}
	#stadium-phone{
		width: calc(31%); 
	}
	#stadium-participator{
		width: calc(31%);
	}
	button[type="submit"]{
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
	    .file-box:hover {
	        border-color: #000;
	        color: #000;
	    }
	    .form-control {
	        display: none;
	    }
	    .preview {
	        margin-top: 10px;
	        display: none;
	    }
	</style>

	<div class="stadium-add">
		<h2>구장 등록</h2>
		<form action="<c:url value='/reservation/stadium-update'></c:url>" method="post" enctype="multipart/form-data">
			<div class="form-group">
				<label for="stadium-name">구장명</label>
			    <input type="text" class="form-control" id="stadium-name" name="sd_name" maxlength="20" value=""><br>
			    <div id="stadium-name-error" class="error-message" style="display:none;">구장명을 입력하세요.</div>
			</div>
			<div class="form-group">
				<label for="stadium-address">구장 주소</label>
				<input type="text" id="stadium-address-zipcode" name="rd-zipcode" placeholder="우편번호"><br>
				<input type="text" id="stadium-address-road" name="rd-address" placeholder="도로명주소"><br>
				<input type="text" id="stadium-address-detail" name="rd_detail-address" placeholder="상세주소"><br>
			</div>
			<div class="form-group">
				<label for="stadium-phone">구장 연락처</label>
				<input type="tel" name="sd_contact1" maxlength="3"> -
				<input type="tel" name="sd_contact2" maxlength="4"> -
				<input type="tel" name="sd_contact3" maxlength="4">
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
			<button type="submit" class="btn btn-outline-success">구장 등록 요청</button>
		</form>
	</div>
<script type="text/javascript">
$('form').submit(function(){
	let sd_name = $('[name=sd_name]').val();
	if(sd_title.trim().length == 0){
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
	}
	reader.readAsDataURL(input.files[0]);
}
</script>