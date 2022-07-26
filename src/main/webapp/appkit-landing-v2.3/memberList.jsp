<%@page import="com.smhrd.domain.Member"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.smhrd.dao.MemberDAO"%>
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
	
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
 
	<!-- alert function -->
	<script type="text/javascript" src="appkit-landing-v2.3/assets/js/sos.js"></script> 	
  	
</head>

<body>

<script type="text/javascript">

$(document).ready(function(){
	sos();
})

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

<%
ArrayList<Member> list = (ArrayList)request.getAttribute("list");
%>

<!-- 어드민!!!!!! header 상단바 부분 --> 
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
                        <li class="nav-item"><a class="nav-link scrollto" onclick="location.href='memberlist.do'">회원정보관리</a></li>
                        <li class="nav-item"><a class="nav-link scrollto" onclick="location.href='viewUlocation.do'">고객위치확인</a></li>
                        <li class="nav-item"><a class="nav-link scrollto" onclick="location.href='viewHlocation.do'">헬멧위치확인</a></li>
                        <li class="nav-item"><a class="nav-link scrollto" onclick="location.href='faq.do'">고객센터</a></li> 
                        <li class="nav-item"><a class="nav-link scrollto" onclick="location.href='viewBlackbox.do'">실시간블랙박스</a></li>                                   
                        <li class="nav-item"><a class="nav-link scrollto" onclick="location.href='logout.do'">로그아웃</a></li>            
                    </ul><!--//nav-->
                </div><!--//navabr-collapse-->     
            </nav><!--//main-nav-->                     
        </div><!--//container-->
    </header><!--//header-->


<div class="container memlist">
  <h2>GO AHEAD 회원정보관리</h2>
  <table class="table">
    <thead class="thead-dark">
      <tr>
       	<th>ID</th>
        <th>NAME</th>
        <th>GENDER</th>
        <th>B_TYPE</th>
        <th>PHONE</th>
        <th>SUBPHONE</th>
        <th>DRIVENUM</th>
      </tr>
    </thead>
    <tbody>


	<%
	for(Member vo : list){
		%>
	 <tr>
	  <td><%=vo.getMem_id() %></td>
	 <td><%=vo.getMem_name() %></td>
	 <td><%=vo.getMem_gender() %></td>
	 <td><%=vo.getMem_blood() %></td>
	 <td><%=vo.getMem_phone() %></td>
	 <td><%=vo.getMem_subphone() %></td>
	 <td><%=vo.getDrivenum() %></td>

      </tr>
	
	<%} %>
      
     
    </tbody>
  </table>    
  

		<a href="viewMain.do" class="button next scrolly">되돌아가기</a>

	</div>

  
    
    <!-- Javascript -->          
    <script type="text/javascript" src="appkit-landing-v2.3/assets/plugins/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="appkit-landing-v2.3/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="appkit-landing-v2.3/assets/plugins/jquery-scrollTo/jquery.scrollTo.min.js"></script>     
    <script type="text/javascript" src="appkit-landing-v2.3/assets/js/main.js"></script> 
	<script src="appkit-landing-v2.3/assets/js/main.js"></script>
      
       
</body>
</html>