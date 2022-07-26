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
    <!-- ajax/jquery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  	<script src="http://code.jquery.com/jquery-latest.js"></script>
    <!-- alert function -->
 	<script type="text/javascript" src="appkit-landing-v2.3/assets/js/sos.js"></script>
  
	<!-- map java script -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cf65f305eeffb142807ebc9a6025b896"></script>
	<script type="text/javascript" src="appkit-landing-v2.3/assets/js/map.js"></script> 	
	    

    
    <script type="text/javascript">
    $(document).ready(function() {
    	mapload();
    	sos();
    	
    	$('#inputbtn').click(function() {
			hLocationView();
			
		})
	})
    
	function hLocationView() {
	
		$.ajax({
			url : "Hlocation.do",
			type : "get",
			dataType : "json",
			data : {"hel_number" : $('#inputbox').val()},
			
			success : hLoList,
			error: function () {
				alert('error');
			}
		})
	}
	
	var lat = '33.450701';
	var long = '126.570667';
	
	function hLoList(data) {
		
		console.log(lat)
		console.log(long)
		
		alert( data.hel_number +'번 헬멧 위치 확인');
		lat = data.hel_loc_lat;
		long = data.hel_loc_long;

		mapload();
		
		var list = "<table class='ulocation-list'>";
	
			list += "<tr>"
				list += "<th>헬멋번호: </th>"
				list += "<td>"+data.hel_number+"</td>"
			list += "</tr>"
			
			list += "<tr>"
				list += "<th>헬멧 분실여부:</th>"
				list += "<td>"+data.hel_lost+"</td>"
			list += "</tr>"			

			list += "<tr>"
				list += "<th>헬멋 파손여부:</th>"
				list += "<td>"+data.hel_damage+"</td>"
			list += "</tr>"
				
			list += "<tr>"
				list += "<th>헬멋 점검날짜:</th>"
				list += "<td>"+data.hel_check+"</td>"
			list += "</tr>"

			list +="</table>"
		
		$('#list').html(list);
			
	}
			


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
                        <li class="nav-item"><a class="nav-link scrollto" onclick="location.href='viewBlackbox.do'">실시간블랙박스</a></li>                       
                        <li class="nav-item"><a class="nav-link scrollto" onclick="location.href='faq.do'">고객센터</a></li>            
                        <li class="nav-item"><a class="nav-link scrollto" onclick="location.href='logout.do'">로그아웃</a></li>            
                    </ul><!--//nav-->
                </div><!--//navabr-collapse-->     
            </nav><!--//main-nav-->                     
        </div><!--//container-->
    </header><!--//header-->
    
    
    <div id="map"></div>
    
    <div>
		<div class="input-group mb-3 search left-box">
	  		<h4 class="lo-title">헬멧위치확인</h4>
	  		<div class="input-group mb-3 lo-input">
				<input id="inputbox" type="text" class="form-control" placeholder="헬멧번호를 입력하세요">
				<div class="input-group-append">
				    <button id = "inputbtn" class="btn btn-primary disabled lo-btn" type="submit">Go</button>
				</div>
			</div>
			<div id="list"></div>
    	</div>
	</div>	


	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cf65f305eeffb142807ebc9a6025b896"></script>
	
</body>
</html>



