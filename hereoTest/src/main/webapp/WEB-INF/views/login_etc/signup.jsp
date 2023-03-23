<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>회원가입</title>
    <script src="<c:url value='/resources/js/common/jquery.js'></c:url>"></script>  
    <script src="<c:url value='/resources/js/common/jquery.validate.min.js'></c:url>"></script>
    <script src="<c:url value='/resources/js/common/additional-methods.min.js'></c:url>"></script>
    <link href="<c:url value='/resources/css/common/style.css'></c:url>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/login_etc/signup.css'></c:url>" rel="stylesheet" />
    <link rel="stylesheet" href="<c:url value='/resources/css/common/images/bootstrap.min.css'></c:url>" />
     <script src="<c:url value='/resources/js/common/bootstrap.bundle.min.js'></c:url>"></script>
    <script src="<c:url value='/resources/js/common/popper.min.js'></c:url>"></script>
  </head>
  <body>
    <header class="topBar">
      <div class="topBar__containerBox">
        <!-- 최상단 로그인 메뉴바 -->
        <div class="topBar__containerBox1">
          <ul class="topBar__list">
            <li>
              <a
                href="#" 
                onclick="window.open('<%=request.getContextPath()%>/login','login','width=450, height=500, scrollbars=no, resizable=no, toolbars=no, menubar=no')"
                >로그인</a
              >
            </li>
            <li><a href="#" style="color: black">고객센터</a></li>
          </ul>
        </div>
        <!-- 메인 메뉴바 -->
        <nav class="signUp-topMenu">
          <ul class="menu-containerBox2__bigBox">
            <li class="signUp-topMenu__goMainPage">
              <a href="<c:url value='/'></c:url>" target="_top" id="home"
                >Here <i class="fa-solid fa-baseball"></i
              ></a>
            </li>
          </ul>
        </nav>
      </div>
    </header>
    <main class="signup">
      <div class="container">
      
      <!-- 회원가입 form  -->
      
        <form action="/action_page.php" class="signup_form">
          <div class="signup-container">
            <p class="signUp-dsscription">😎 히어로의 회원가입 페이지입니다.</p>
            <label for="id">아이디 :</label><br />
           <!-- 아이디 중복체크 -->
            <input
              type="text"
              class="signup-id signUp-form"
              id="id"
              name="id"
              required
            />
            <button class="idCheck-btn">중복 확인</button>
            <span class="valid-letter"></span>
          </div>
          <div class="signup-container">
            <label for="pw">비밀번호 :</label><br />
            <input
              type="password"
              class="signUp-form"
              id="pw"
              name="pw"
              required
            />
            <span class="valid-letter"></span>
          </div>
          <div class="signup-container">
            <label for="pw2">비밀번호 확인 :</label><br />
            <input
              type="password"
              class="signUp-form"
              id="pw2"
              name="pw2"
              required
            />
            <span class="valid-letter"></span>
          </div>
          <div class="signup-container">
            <label for="name">이름 :</label><br />
            <input
              type="text"
              class="signUp-form"
              id="name"
              name="name"
              required
            />
            <span class="valid-letter"></span>
          </div>
          <div class="signup-container">
            <label for="nik_name">닉네임 :</label><br />
            <input
              type="text"
              class="signUp-form"
              id="nik_name"
              name="nik_name"
              placeholder="커뮤니티 게시판에서 사용할 닉네임을 작성해주세요"
              required
            />
            <span class="valid-letter"></span>
          </div>
          <div class="signup-container">
            <label for="email">이메일 :</label><br />
            <input
              type="email"
              class="signUp-form"
              id="email"
              name="email"
              required
            />
            <span class="valid-letter"></span>
          </div>
          <div class="signup-container">
            <label for="gender">성별 :</label><br />
            <div class="signup-gender">
	            남
	            <input
	              type="radio"
	              class="signUp-form gender-type"
	              name="gender"
	              value= "남"
	            />여
	             <input
	              type="radio"
	              class="signUp-form gender-type"
	              name="gender"
	              value= "여"
	            />
	        </div>    
            <span class="valid-letter"></span>
          </div>
          <div class="signup-container">
            <label for="phone">전화번호 :</label><br />
            <input
              type="text"
              class="signUp-form"
              id="phone"
              name="phone"
              required
            />
            <span class="valid-letter"></span>
          </div>

          <button type="submit" class="signup-btn">회원가입</button>
        </form>
      </div>
    </main>
    <script
      src="https://kit.fontawesome.com/bedfa56d7f.js"
      crossorigin="anonymous"
    ></script>
  	<script>
  	
  	$(".signup_form").validate({
  		rules: {
  			id : {
  				required : true,
  				regex : /^[a-zA-Z]{1}[a-zA-Z0-9]{7,12}$/ 				
  			},
  			pw : {
  				required : true,
  				regex : /^[a-zA-Z0-9!@#$]{8,20}$/				
  			},
  			pw2 : {
  				equalTo : pw
  			},
  			name : {
  				required : true,
  				regex : /^[가-힣]{2,35}$/
  			},
  			nik_name : {
  				required : true,
  				regex : /^[a-zA-Z0-9가-힣]{2,13}$/
  			},
  		 	email : {
  		 		required : true,
  		 		email : true
  		 	},
  			phone : {
  				required : true,
  				regex : /^010[0-9]{7,8}$/
  			},
  			gender : {
  				required : true
  			}
  		},
  		messages : {
  			id : {
  				required : "필수 항목입니다.",
  				regex : "아이디는 첫글자가 영문자로 시작해야하며, 영문과 숫자를 조합하여 8~13자까지 가능합니다." 				
  			},
  			pw : {
  				required : "필수 항목입니다.",
  				regex : "비밀번호는 영문, 숫자, 특수문자(!,@,#,$)를 조합하여 8~20자까지 가능합니다."			
  			},
  			pw2 : {
  				equalTo : "위의 비밀번호와 일치하지 않습니다."
  			},
  			name : {
  				required : "필수 항목입니다.",
  				regex : "이름은 한글로만 작성가능합니다."
  			},
  			nik_name : {
  				required : "필수 항목입니다.",
  				regex : "닉네임은 한글, 영문, 숫자를 조합하여 2~13자까지 가능합니다."
  			},
  		 	email : {
  		 		required : "필수 항목입니다.",
  		 		email : "이메일 형식으로 작성해야 합니다."
  		 	},
  			phone : {
  				required : "필수 항목입니다.",
  				regex : "핸드폰 번호를 입력해주세요."
  			},
  			gender : {
  				required : "필수 항목입니다."
  			}
  		}
  	});
  	
  	
  	
  	</script>
  
  
  
  
  
  </body>
</html>
