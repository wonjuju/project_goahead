<%@page import="com.smhrd.module.module"%>
<%@page import="com.smhrd.domain.Member"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

    <title>GO AHEAD - 킥보드에 안전을 더하다</title>
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
    <link id="theme-style" rel="stylesheet" href="appkit-landing-v2.3/assets/css/other.css">
	<!-- font -->
	 <link rel="stylesheet" href="appkit-landing-v2.3/assets/font/stylesheet.css">

	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	  <script src="http://code.jquery.com/jquery-latest.js"></script>


    
</head>

<!-- sos alert -->
<script type="text/javascript">

function sos() {

	$.ajax({

		url: "sosAlert",
		type: "get",
		dataType: "json",
		data: {
			"ex": 1
		},
		success: sosAlert,
		error: function() {
			alert('error');
		}

	})

}

function sosAlert(data) {

	console.log('성공');
	console.log(data);
	
	var shock = data[0];
	
	if (shock == 1) {
		
		console.log(data);
		alert('sos 발생!');
		location.href="acc.do";
		shock = 0;
		
	} else if (data[0] == 0) {
		
		 setTimeout(sos,5000); 
		
	}
}

</script>


<body class="main-body">
    <!-- header 상단바 부분 --> 
    <header id="header" class="header" >  
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
                    <% Member member = (Member)session.getAttribute("member"); %>
                    <%if (member == null) {%>
                    <!-- 로그인 전 -->
                    <ul class="nav navbar-nav">
                       <li class="nav-item"><a class="nav-link scrollto" onclick="location.href='viewJoin.do'">회원가입</a></li>
                        <li class="nav-item"><a class="nav-link scrollto" onclick="location.href='viewLogin.do'">로그인</a></li>
                        <li class="nav-item"><a class="nav-link scrollto" onclick="location.href='faq.do'">고객센터</a></li>            
                    </ul><!--//nav-->
                    
                    <%} else if (member.getMem_num() == 1) { %>
                    
                    <script type="text/javascript">
                    $(document).ready(function(){
                    	sos();
                    })

                    
                    </script>
                    <!-- sos function -->
                     <script type="text/javascript" src="appkit-landing-v2.3/assets/js/sos.js"></script>
                    
                    <!-- admin 로그인 -->
                    <ul class="nav navbar-nav">
                        <li class="nav-item"><a class="nav-link scrollto" onclick="location.href='memberlist.do'">회원정보관리</a></li>
                        <li class="nav-item"><a class="nav-link scrollto" onclick="location.href='viewUlocation.do'">고객위치확인</a></li>
                        <li class="nav-item"><a class="nav-link scrollto" onclick="location.href='viewHlocation.do'">헬멧위치확인</a></li>
                        <li class="nav-item"><a class="nav-link scrollto" onclick="location.href='viewBlackbox.do'">실시간블랙박스</a></li>
                        <li class="nav-item"><a class="nav-link scrollto" onclick="location.href='faq.do'">고객센터</a></li>            
                        <li class="nav-item"><a class="nav-link scrollto" onclick="location.href='logout.do'">로그아웃</a></li>            
                    </ul><!--//nav-->
                    
                    <%} else {
                    
                    %>
                    
                    <!-- user 로그인 -->
                    
                     <ul class="nav navbar-nav">
                        <li class="nav-item">
                              <div class="dropdown nav-link scrollt ">
                          <p class="head-kick">킥보드</p>
                          <div class="dropdown-content">
                     <a href="viewUse.do">이용시작</a>
                     <a href='usinglist.do?mem_id=<%=member.getMem_id()%>'>나의이용내역</a>
                    </div></div></li>
                    	<li class="nav-item"><a class="nav-link scrollto" onclick="location.href='faq.do'">고객센터</a></li>     
                        <li class="nav-item"><a class="nav-link scrollto" onclick="location.href='logout.do'">로그아웃</a></li>                        
                    </ul><!--//nav-->
                    <%} %>
                </div><!--//navabr-collapse-->     
            </nav><!--//main-nav-->                     
        </div><!--//container-->
    </header><!--//header-->
    
    <!-- header 상단바 아래 이미지+소개글 부분 -->
    <div id="hero" class="hero-section">
        
        <div id="hero-carousel" class="hero-carousel carousel carousel-fade slide" data-ride="carousel" data-interval="10000">
            
            <div class="figure-holder-wrapper">
              <div class="container">
                  <div class="row justify-content-end">
                      <div class="figure-holder">
                        </div><!--//figure-holder-->
                  </div><!--//row-->
              </div><!--//container-->
          </div><!--//figure-holder-wrapper-->
            
         <!-- Indicators -->
         <ol class="carousel-indicators">
            <li class="active" data-slide-to="0" data-target="#hero-carousel"></li>
            <li data-slide-to="1" data-target="#hero-carousel"></li>
            <li data-slide-to="2" data-target="#hero-carousel"></li>
         </ol>
         
         <!-- Wrapper for slides -->
         <div class="carousel-inner">
             
            <div class="carousel-item item-1 active">
               <div class="item-content container"  >
                   <div class="item-content-inner" style="text-shadow: 1px 1px black ">
           
                   	<br>
                	<br>
           			<br>
                    <h2>고어헤드</h2>
                    <br>
                    <h4>스마트한 안전헬멧을 착용함으로써, </h4>
                    <h4>안전한 킥보드 사용문화에 앞서 나가자 </h4>
                    <br>
                    <br>
                   
                         <%if (member == null) {%>
                        <a class="btn btn-primary btn-cta" href="viewLogin.do" target="_blank">시작하기</a>
                        <%} else {%>
                        <a class="btn btn-primary btn-cta" href="viewUse.do" target="_blank">시작하기</a>
                        <%} %>
                   </div><!--//item-content-inner-->
               </div><!--//item-content-->
            </div><!--//item-->
            
            <div class="carousel-item item-2" >
               <div class="item-content container">
                  <div class="item-content-inner" style="margin-left : 370px; text-shadow: 1px 1px black " >
                    <br>    
                	<br>
           			<br>
                    <h2>고어헤드 </h2>
                    <br>
                    <h4>스마트한 안전헬멧을 착용함으로써, </h4>
                   
                    <h4>안전한 킥보드 사용문화에 앞서 나가자 </h4>
                    <br>
                    <br>
                         <%if (member == null) {%>
                        <a class="btn btn-primary btn-cta" href="viewLogin.do" target="_blank">시작하기</a>
                        <%} else {%>
                        <a class="btn btn-primary btn-cta" href="viewUse.do" target="_blank">시작하기</a>
                        <%} %>	
                   </div><!--//item-content-inner-->
               </div>
            </div><!--//item-->
            
            <div class="carousel-item item-3">
               <div class="item-content container">
                  <div class="item-content-inner" style="margin-left : 900px; width: 1000px; text-shadow: 1px 1px black  "> 
                	<br>
           			<br>
                    <h2>고어헤드? </h2>
                    <br>
                    <h4>스마트한 안전헬멧을 착용함으로써, </h4>
                    <h4>안전한 킥보드 사용문화에 앞서 나가자 </h4>
                    <br>
                    <br>
                         <%if (member == null) {%>
                        <a class="btn btn-primary btn-cta" href="viewLogin.do" target="_blank">시작하기</a>
                        <%} else {%>
                        <a class="btn btn-primary btn-cta" href="viewUse.do" target="_blank">시작하기</a>
                        <%} %>                        
                   </div><!--//item-content-inner-->
               </div>
            </div><!--//item-->
         </div><!--//carousel-inner-->
      </div><!--//carousel-->
    </div><!--//hero-->
    
    
    
    <div id="about" class="about-section">
        <div class="container text-center">
            <h2 class="section-title">킥보드에 안전을 더하다</h2>
            <p class="intro">이동의 패러다임을 바꾸는 GO AHEAD
            <p>가고 싶은 곳으로 언제든 갈 수 있도록, 하고 싶었던 것을 언제든 할 수 있도록👌</p>
            <p>다양한 공유킥보드가 나왔지만 GO AHEAD는 더욱 안전을 위해👌</p>
            <p>교통혼잡, 대기오염, 주차공간 부족과 같은 문제 개선에 적극 기여하며</p>
			<p>사람과 도시를 연결하기 위하여 오늘도 노력합니다.</p>
			<p>우리는 이동을 통해 아낀 시간이 우리의 삶을 조금 더 나아지게 할 수 있다고 믿습니다.</p></p>
           
            <div class="items-wrapper row">
                <div class="item col-md-4 col-12">
                    <div class="item-inner">
                        <div class="figure-holder">
                            <img class="figure-image fimg-1 main-img-se" src="appkit-landing-v2.3/assets/images/lost.png" alt="image">
                        </div><!--//figure-holder-->
                        <h3 class="item-title">분실 방지</h3>
                        <div class="item-desc mb-3">
                            GPS를 이용하고 있기 때문에 <br>헬멧 분실시 고객센터 문의를 통해 <br>위치를 찾아 낼 수 있습니다!
                        </div><!--//item-desc-->
                      <!--  <a class="btn btn-primary" href="https://themes.3rdwavemedia.com/bootstrap-templates/startup/appkit-landing-free-bootstrap-theme-for-developers-and-startups/" target="_blank">Find out more</a>-->
                    </div><!--//item-inner-->
                </div><!--//item-->
                
                <div class="item col-md-4 col-12">
                    <div class="item-inner">
                        <div class="figure-holder">
                            <img class="figure-image fimg-2 main-img-se" src="appkit-landing-v2.3/assets/images/sos.png" alt="image">
                        </div><!--//figure-holder-->
                        <h3 class="item-title">SOS </h3>
                        <div class="item-desc mb-3">
                           헬멧을 통해 사고를 감지하기 때문에 <br> 일정 시간 내 반응이 없을 시 <br> 입력된 비상연락망과 119에 도움을 요청합니다!
                            </div><!--//item-desc-->
                        <!-- <a class="btn btn-primary" href="https://themes.3rdwavemedia.com/bootstrap-templates/startup/appkit-landing-free-bootstrap-theme-for-developers-and-startups/" target="_blank">Find out more</a> -->
                    </div><!--//item-inner-->
                </div><!--//item-->
                
                <div class="item col-md-4 col-12">
                    <div class="item-inner">
                        <div class="figure-holder">
                            <img class="figure-image fimg-3 main-img-se" src="appkit-landing-v2.3/assets/images/blackbox.jpg" alt="image">
                        </div><!--//figure-holder-->
                        <h3 class="item-title">블랙박스</h3>
                        <div class="item-desc mb-3">
                            사고 발생 시,<br> 관리자가 실시간 블랙박스 영상을 통해 사고 영상을 확인할 수 있습니다!
                            </div><!--//item-desc-->
                       <!-- <a class="btn btn-primary" href="https://themes.3rdwavemedia.com/bootstrap-templates/startup/appkit-landing-free-bootstrap-theme-for-developers-and-startups/" target="_blank">Find out more</a> -->
                    </div><!--//item-inner-->
                </div><!--//item-->
            </div><!--//items-wrapper-->
        </div><!--//container-->
    </div><!--//about-section-->
     
    <!-- Javascript -->          
    <script type="text/javascript" src="appkit-landing-v2.3/assets/plugins/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="appkit-landing-v2.3/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="appkit-landing-v2.3/assets/plugins/jquery-scrollTo/jquery.scrollTo.min.js"></script>     
    <script type="text/javascript" src="appkit-landing-v2.3/assets/js/main.js"></script> 
    <script>
    
    var $hauntedText = $('[data-haunted-text]');
    var maxDuration = 2000;
    var maxDelay = 500;
    var minDuration = maxDuration - maxDelay;

    setTimeout(function() {
      $hauntedText.find('.blast').each(function(i, el) {
        var $el = $(el);

        var duration = getRandomValue(minDuration, maxDuration);
        var delay = maxDuration - duration;
        var blur = getRandomValue(2, 10);

        // From
        $el.velocity({
          opacity: 0,
          blur: blur,
        }, {
          duration: 0,
        });

        // To
        $el.velocity({
          opacity: 1,
          blur: 0,
        }, {
          duration: duration,
          delay: delay,
          ease: [250, 0],
        });
      });
      
      $hauntedText.css({visibility: 'visible'});
    }, 500);

    var getRandomValue = function(min, max) {
      return Math.floor(Math.random() * (max - min + 1)) + min;
    }
    
    </script>
  
</body>
</html>