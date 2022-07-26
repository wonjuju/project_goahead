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
    <link id="theme-style" rel="stylesheet" href="appkit-landing-v2.3/assets/css/styles.css">
    <link id="theme-style" rel="stylesheet" href="appkit-landing-v2.3/assets/css/other.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  	<script src="http://code.jquery.com/jquery-latest.js"></script>
</head> 

<body class="login_body">
<%
	Member vo = (Member)session.getAttribute("member");
%>
	
	<script>
		$(document).ready(function() {
			$('#login-btn').click(function() {
				
			})
		})
		
		function motorZero() {
			$.ajax({
				url : "moduleController",
				type : "get",
				data : {"motor" : 0},
				success : console.log("motorZero success"),
				error: function() {
					alert('error');
				}
			})
		}
	
	</script>
	
	
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
    
<section class="gradient-custom">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-12 col-md-8 col-lg-6 col-xl-5">
        <div class="card bg-dark text-white login_content" >
          <div class="card-body p-5 text-center">

            <div class="mb-md-5 mt-md-4 pb-5">

              <h2 class="fw-bold mb-2 text-uppercase">로그인</h2>
              <p class="text-white-50 mb-5">아이디 비밀번호를 입력하세요!</p>

                <form action="login.do" method="post">
              <div class="form-outline form-white mb-4">
                <input type="text" name="mem_id" id="typeEmailX" class="form-control form-control-lg" />
                
                <label class="form-label" for="typeEmailX">아이디</label>
              </div>

              <div class="form-outline form-white mb-4">
                <input type="password" name="mem_pw" id="typePasswordX" class="form-control form-control-lg" />
                <label class="form-label" for="typePasswordX">비밀번호</label>
              </div>
			

              <button id="login-btn" class="btn btn-outline-light btn-lg px-5 btncolor" type="submit">로그인</button>
			</form>
			
              <div class="d-flex justify-content-center text-center mt-4 pt-1">
                <a href="#!" class="text-white"><i class="fab fa-facebook-f fa-lg"></i></a>
                <a href="#!" class="text-white"><i class="fab fa-twitter fa-lg mx-4 px-2"></i></a>
                <a href="#!" class="text-white"><i class="fab fa-google fa-lg"></i></a>
              </div>

            </div>

            <div>
              <p class="mb-0">Go Ahead 계정이 없으신가요?<a href="viewJoin.do" class="text-white-50 fw-bold goJoin"><br>회원가입 하러가기</a>
              </p>
            </div>

          </div>
        </div>
      </div>
    </div>
  </div>
</section>
   
    

     
    <!-- Javascript -->          
    <script type="text/javascript" src="appkit-landing-v2.3/assets/plugins/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="appkit-landing-v2.3/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="appkit-landing-v2.3/assets/plugins/jquery-scrollTo/jquery.scrollTo.min.js"></script>     
    <script type="text/javascript" src="appkit-landing-v2.3/assets/js/main.js"></script> 
       
</body>
</html>