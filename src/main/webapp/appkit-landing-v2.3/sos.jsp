<%@page import="com.smhrd.domain.AccVO"%>
<%@page import="com.smhrd.domain.UseVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<% AccVO vo = (AccVO)session.getAttribute("acc_vo"); %>
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
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
    

</head>
<body>
	
<!-- 어드민!!!!!! header 상단바 부분 --> 
    <header id="header" class="header lo-header" >  
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
                        <li class="nav-item"><a class="nav-link scrollto" onclick="location.href='memberlist.do'">회원정보관리</a></li>
                        <li class="nav-item"><a class="nav-link scrollto" onclick="location.href='viewUlocation.do'">고객위치확인</a></li>
                        <li class="nav-item"><a class="nav-link scrollto" onclick="location.href='viewHlocation.do'">헬멧위치확인</a></li>
                        <li class="nav-item"><a class="nav-link scrollto" onclick="location.href='faq.do'">고객센터</a></li>            
                        <li class="nav-item"><a class="nav-link scrollto" onclick="location.href='logout.do'">로그아웃</a></li>            
                    </ul><!--//nav-->
                </div><!--//navabr-collapse-->     
            </nav><!--//main-nav-->                     
        </div><!--//container-->
    </header><!--//header-->
    
    
    <div id="map" style=" width :100%;height:800px; "></div>
    
    <div>
		<div class="input-group search title left-box">
	  		
	  		<h4 style="margin-top: 30px; margin-left: 25px; font-weight: bold; font-size: 30px;">🚨SOS🚨</h4>
	  		<br><br>
	  		<table style='margin-left: 25px; height: 600px'>
	  			

	  			<tr>
					<th>고객이름  </th>	  		
					<td><%= vo.getMem_name() %></td>	  		
	  			</tr>
	  			
	  			<tr>
					<th>아이디　  </th>	  		
					<td><%= vo.getMem_id() %></td>	  		
	  			</tr>
	  		
				<tr>
					<th>고객연락처 </th>	  		
					<td><%= vo.getMem_phone() %></td>	  		
	  			</tr>	
	  			
	  			<tr>
					<th>혈액형　  </th>	  		
					<td><%= vo.getMem_blood() %></td>	  		
	  			</tr>
	  			
	  			<tr>
					<th>비상연락망  </th>	  		
					<td><%= vo.getMem_subphone() %></td>	  		
	  			</tr>
						  		
	  			<tr>
					<th>이용번호  </th>	  		
					<td><%= vo.getUse_number() %></td>	  		
	  			</tr>

	  		</table>
			  	
			</div>
	  		
		</div>
		

	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cf65f305eeffb142807ebc9a6025b896"></script>
	<script>
	
	
	var lat = 33.450701;
	var long = 126.570667;
	
	<%
	
	AccVO accvo = (AccVO)session.getAttribute("acc_helmet");
	
	%>
	lat = <%=accvo.getAcc_loc_lat()%>;
	long = <%=accvo.getAcc_loc_long()%>;
	
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(lat, long), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 마커가 표시될 위치입니다 
// 위치좌표변경해주기~
var markerPosition  = new kakao.maps.LatLng(lat, long); 

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
// marker.setMap(null);    
</script>
</body>
</html>



