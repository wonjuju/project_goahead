<%@page import="com.smhrd.module.returnMotor"%>
<%@page import="com.smhrd.module.module"%>
<%@page import="com.smhrd.domain.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>GO AHEAD - 킥보드에 안전을 더하다</title>
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
	<!-- map java script -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=17b3f4afc77e1401ad704210c028726b"></script>
	<script type="text/javascript" src="appkit-landing-v2.3/assets/js/usemap.js"></script> 	
</head>

 <% Member member = (Member)session.getAttribute("member"); %>

<script>
	
<% int alcohol = returnMotor.alcoholYES; %>
<% int press = module.press; %>

var press = <%=press%>;
var alcohol = <%=alcohol%>;

$(document).ready(function() {
	console.log(alcohol);
	$('#start-btn').click(function() {
		if(press == 0) {
			console.log('헬멧펑션');
			alert('🚨헬멧 미착용🚨\n     운행이 불가합니다');
			
		} else {
			
			if(alcohol == 0) {
				alert('　　🚨혈중 알코올 농도 초과🚨\n운행이 불가합니다')
				
			} else {
				kickStart();
				motorStart();
			}
		}
	})
	
	
	$('#stop-btn').click(function() {
		kickStop();
		motorStop();
	})

})

	function kickStart() {

		$.ajax({
			url : "use.do",
			type : "get",
			dataType : "json",
			data : {
				"kick_num" : $('#kick_num_input').val(),
				"hel_num" : $('#het_num_input').val()
			},
			success : useList, 
			error: function () {
				alert('error');
			}
		})
	}

	function motorStart() {
		$.ajax({
			url : "moduleController",
			type : "get",
			data : {"motor" : 1},
			success : console.log("success"),
			error : function(){
				alert('error');
			}
		})
	}

	function motorStop() {
		$.ajax({
			url : "moduleController",
			type : "get",
			data : {"motor" : 2},
			success : console.log("success"),
			error : function(){
				alert('error');
			}
		})
	}
	

		function useList(data) {
			
			console.log("성공")
			console.log(data)

			document.querySelector(".background").className = "background show";
			
			var list = "<table style ='position: relative; left: 35%; text-align: center; height:200px;'>";
			list += "<tr>"
				list += "<td>이용시작 시간</td>"
			list += "</tr>"		
			list += "<tr>"
				list += "<td>"+data.start_time+"</td>"
			list += "</tr>"
			list += "<tr>"
				list += "<td>헬멧번호</td>"
			list += "</tr>"		
			list += "<tr>"
				list += "<td>"+data.hel_number+"</td>"
			list += "</tr>"
			list += "<tr>"
				list += "<td>아이디</td>"
			list += "</tr>"		
			list += "<tr>"
				list += "<td>"+data.mem_id+"</td>"
			list += "</tr>"
			list +="</table>"
		
			$('#useListTable').html(list)
		}

		function kickStop() {
			   
			   $.ajax({
			      url : "stop.do",
			      type : "get",
			      data : {
			         "mem_id" : $('#mem_id').val()
			      },
			      dataType : "json",
			      success : stop, 
			      error: function () {
			         alert('error');
			      }
			      
			   })
			   
			}
		
		
		function stop () { 
			console.log('종료완료');
		  	document.querySelector(".background").className = "background";
		}
	
	




</script>

 <body> 

  <!-- 유저!!!!!!!!!!!!!!!!!!!!!!!!!! header 상단바 부분 --> 
    <header id="header" class="header lo-header" >  
        <div class="container" >       
            <h1 class="logo">
                <a class="scrollto" onclick='location.href="viewMain.do"'>
                    <span class="logo-icon-wrapper"><img class="logo-icon" src="appkit-landing-v2.3/assets/images/kick_icon_F.png" alt="iccon" style=" width: 40px; height: 40px;"></span>
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
                </div><!--//navabr-collapse-->     
            </nav><!--//main-nav-->                     
        </div><!--//container-->
    </header><!--//header-->

<!-- ------------------------------------------------------------------------------------------------------------------ -->

                      

<div id="map"></div>
<div class="start-section">

	<div class ="start-tag">
	   		<input type="text" class="form-control start-input" id ="kick_num_input" placeholder="킥보드 번호를 입력하세요." name="kick_num">
	   		<input type="text" class="form-control start-input" id ="het_num_input" placeholder="헬멧 번호를 입력하세요." name="hel_num">
	   		<input type="hidden" id="mem_id" value=<%=member.getMem_id()%>>
	   		<button  type="button" class="btn btn-success" id ="start-btn">이용시작</button>           
	</div>
	 
	<div class="background">
	  <div class="window">
	    <div class="popup">
	    
	    <div>
	    <br><br>
	   	<p class="stop-ti ti-1">이용이 시작되었습니다.</p>
		<br>
		<p class="stop-ti ti-2">이용 정보</p>
	    </div>
		
		<div id ="useListTable">
		</div>
		
	     <button type="submit" class="btn btn-success" id ="stop-btn" >이용종료</button>  
	    </div>
	  </div>
	</div>
	 
</div>  

   

</body>
</html>