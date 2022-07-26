<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.smhrd.domain.UseVO"%>
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
</head>


<body>
<%
ArrayList<UseVO> list = (ArrayList)request.getAttribute("list");
%>

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
  						<% Member member = (Member)session.getAttribute("member"); %>
	                    <li class="nav-item"><a class="nav-link scrollto" onclick="location.href='usinglist.do?mem_id=<%=member.getMem_id()%>'">이용내역</a></li>
                        <li class="nav-item">
                              <div class="dropdown nav-link scrollt ">
                          <p class="head-kick">킥보드</p>
                          <div class="dropdown-content">
                     <a href="viewUse.do">이용시작</a>
                     <a href="viewBlackbox.do">블랙박스 확인</a>
                    </div></div></a></li>
                    	<li class="nav-item"><a class="nav-link scrollto" onclick="location.href='faq.do'">고객센터</a></li>     
                        <li class="nav-item"><a class="nav-link scrollto" onclick="location.href='logout.do'">로그아웃</a></li>                        
                    </ul><!--//nav-->
                </div><!--//navabr-collapse-->     
            </nav><!--//main-nav-->                     
        </div><!--//container-->
    </header><!--//header-->
    


<div class="container memlist">
  <h2>GO AHEAD 고객정보조회</h2>
  <table class="table">
    <thead class="thead-dark">
      <tr>
        <th>아이디</th>
       	<th>이용번호</th>
        <th>킥보드 번호</th>
        <th>헬멧 번호</th>
        <th>이용시작시간</th>
        <th>이용종료시간</th>
        <th>이용시간</th>
      </tr>
    </thead>
    <tbody>


	<%
	
	//String a_date = "2022-03-19";
    //String b_date = "2022-02-10";
    
    //SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd");
    
    //Date a_parseDate = format.parse(a_date);
    //Date b_parseDate = format.parse(b_date);
    
    // 밀리세컨드 단위로 차이 결과 도출
   
   
    SimpleDateFormat format = new SimpleDateFormat("YYYYMMddHHmm");
    
	for(UseVO vo : list){
		
		String a_date = vo.getStart_time();
	    String b_date = vo.getEnd_time();			   
	    
	    Date a_parseDate = format.parse(a_date);
	    Date b_parseDate = format.parse(b_date);
	    
	    long resultTime = b_parseDate.getTime() - a_parseDate.getTime();
	    
	    int a=(int)(resultTime / 1000); 
	    int b=(int)(resultTime / (60*1000));
	    int c=(int)(resultTime / (60*60*1000));
	    
		%>
	
	 <tr>
	  <td><%=vo.getMem_id() %></td>
	  <td><%=vo.getUse_number() %></td>
	  <td><%=vo.getKick_number() %></td>
	  <td><%=vo.getHel_number() %></td>
	  <td><%=vo.getStart_time() %></td>
	  <td><%=vo.getEnd_time()%></td>
	  <td><%=vo.getUsing_time()+"분"%></td>
	  
      </tr>
	
	<%} %>
      
     
    </tbody>
  </table>    
  

		

	</div>

  
    
    <!-- Javascript -->          
    <script type="text/javascript" src="appkit-landing-v2.3/assets/plugins/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="appkit-landing-v2.3/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="appkit-landing-v2.3/assets/plugins/jquery-scrollTo/jquery.scrollTo.min.js"></script>     
    <script type="text/javascript" src="appkit-landing-v2.3/assets/js/main.js"></script> 
	<script src="appkit-landing-v2.3/assets/js/main.js"></script>
      
       
</body>
</html>