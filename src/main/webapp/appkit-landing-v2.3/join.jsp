<%@page import="com.smhrd.domain.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Bootstrap 4 theme for developers and startups</title>
    <!-- Meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Bootstrap 4 landing page template for developers and startups">
    <meta name="author" content="Xiaoying Riley at 3rd Wave Media">    
    <link rel="shortcut icon" href="favicon.ico">  
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <!-- FontAwesome JS -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
    <!-- Global CSS -->
    <link rel="stylesheet" href="appkit-landing-v2.3/assets/plugins/bootstrap/css/bootstrap.min.css">   
    <!-- Theme CSS -->  
    <link id="theme-style" rel="stylesheet" href="appkit-landing-v2.3/assets/css/other.css">
    <link id="theme-style" rel="stylesheet" href="appkit-landing-v2.3/assets/css/styles.css">
     <!-- Bootstrap CSS -->
  	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>

<body>

    <!-- header 상단바 부분 --> 
  <header id="header" class="header ad-header" >  
        <div class="container" >       
            <h1 class="logo">
                <a class="scrollto" onclick='location.href="viewMain.do"'>
                    <span class="logo-icon-wrapper"><img class="logo-icon" src="appkit-landing-v2.3/assets/images/kick_icon_F.png" alt="iccon"></span>
                    <span class="text" ><span class="highlight">GO</span>AHEAD</span></a>
            </h1><!--//logo-->

            <nav class="main-nav navbar-expand-md float-right navbar-inverse" role="navigation">
                
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button><!--//nav-toggle-->
                
                <div id="navbar-collapse">
                    
                    <ul class="nav navbar-nav header-ul">
                       <li class="nav-item"><a class="nav-link scrollto" onclick="location.href='viewJoin.do'">회원가입</a></li>
                        <li class="nav-item"><a class="nav-link scrollto" onclick="location.href='viewLogin.do'">로그인</a></li>
                        <li class="nav-item"><a class="nav-link scrollto" onclick="location.href='faq.do'">고객센터</a></li>            
                    </ul><!--//nav-->
                </div><!--//navabr-collapse-->     
            </nav><!--//main-nav-->                     
        </div><!--//container-->
    </header><!--//header-->
    
    
    
    
    
    
    
    
    
   <div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <h4 class="mb-3 join_title">회원가입</h4>
        <!-- 회원가입 컨트롤러 -->
        <form class="validation-form" action="join.do" method="post" novalidate>
          
            <div class="mb-3">
              <label for="name">이름</label>
              <input type="text" class="form-control" id="name" name ="mem_name" required>
              <div class="invalid-feedback">
                이름을 입력해주세요.
              </div>
            </div>
            
            
            <div class="mb-3">
              <label for="id">아이디</label>
              <input type="text" class="form-control" id="id" name ="mem_id" placeholder="" value="" required>
              <div class="invalid-feedback">
                아이디를 입력해주세요.
              </div>
            </div>

          <div class="mb-3">
            <label for="pw">비밀번호</label>
            <input type="password" class="form-control" id="pw" name ="mem_pw" placeholder="" required>
            <div class="invalid-feedback">
             	비밀번호를 입력해주세요.
            </div>
          </div>
		
		   <div class="row">
            <div class="col-md-6 mb-3">
              <label for="gender">성별</label>
              <select class="form-control" name="mem_gender">
					<option>여성</option>
					<option>남성</option>
				</select>
              </div>
              
              <div class="col-md-6 mb-3">
              	<label for="blood">혈액형</label>
              	<select class="form-control" name="mem_blood">
					<option>A</option>
					<option>B</option>
					<option>AB</option>
					<option>O</option>
				</select>
            </div>
           </div>
           
           <div class="mb-3">
              <label for="birth">생년월일</label>
              <input type="date" class="form-control" id="birth" name ="mem_birth" placeholder="" value="" required>
              <div class="invalid-feedback">
                생년월일을 입력해주세요.
              </div>
            </div>
           
          
	        <div class="mb-3">
            	<label for="phone">연락처</label>
            	<input type="text" class="form-control" id="phone" name ="mem_phone" placeholder="" required>
            	<div class="invalid-feedback">
             	연락처를 입력해주세요.
            	</div>
          	</div>
	        

			 <div class="mb-3">
	            <label for="sos">SOS 연락처</label>
	            <input type="text" class="form-control" placeholder="" name = "mem_subphone" required>
	            <div class="invalid-feedback">
             	SOS 연락처를 입력해주세요.
            	</div>
	          </div>
	          
	          <div class="mb-3">
	            <label for="sos">면허번호</label>
	            <input type="text" class="form-control" placeholder="" name = "drivenum" required>
	            <div class="invalid-feedback">
             	면허번호를 입력해주세요.
            	</div>
	          </div>

          <hr class="mb-4">
          
          <div class="mb-4"></div>
          <button class="btn btn-primary btn-lg btn-block btncolor" type="submit">가입 완료</button>
          
	        </form>
          </div>
      </div>
    </div>
    
  <script>
    window.addEventListener('load', () => {
      const forms = document.getElementsByClassName('validation-form');

      Array.prototype.filter.call(forms, (form) => {
        form.addEventListener('submit', function (event) {
          if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
          }

          form.classList.add('was-validated');
        }, false);
      });
    }, false);
  </script>
    
    <!-- Javascript -->          
    <script type="text/javascript" src="appkit-landing-v2.3/assets/plugins/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="appkit-landing-v2.3/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="appkit-landing-v2.3/assets/plugins/jquery-scrollTo/jquery.scrollTo.min.js"></script>     
    <script type="text/javascript" src="appkit-landing-v2.3/assets/js/main.js"></script> 
       
</body>
</html>