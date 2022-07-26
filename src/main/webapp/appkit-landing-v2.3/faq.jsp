
<%@page import="com.smhrd.domain.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bootstrap FAQ example with tabs and accordions</title>
	<link rel='stylesheet prefetch'	href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css'>
	<link rel="stylesheet" href="appkit-landing-v2.3/assets/css/faq.css">
	<!-- 헤드바 css -->
	<link id="theme-style" rel="stylesheet" href="appkit-landing-v2.3/assets/css/styles.css">
	<link id="theme-style" rel="stylesheet" href="appkit-landing-v2.3/assets/css/other.css">
	<!-- ajax jquery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	
</head>

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

 <body class="faq-body">

    <!-- header 상단바 부분 --> 
    <header id="header" class="header lo-header faq-header">  
        <div class="container">       
            <h1 class="logo">
                <a class="scrollto" onclick='location.href="viewMain.do"'>
                    <span class="logo-icon-wrapper"><img class="logo-icon" src="appkit-landing-v2.3/assets/images/kick_icon_F.png" alt="iccon"></span>
                    <span class="text"><span class="highlight">GO</span>AHEAD</span></a>
            </h1><!--//logo-->

            <nav class="main-nav navbar-expand-md float-right navbar-inverse" role="navigation">
                
                <div id="navbar-collapse">
                    <% Member member = (Member)session.getAttribute("member"); %>
                    <%if (member == null) {%>
                    <!-- 로그인 전 -->
                    <ul class="nav navbar-nav faqnav">
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
                    <!-- admin 로그인 -->
					<!-- alert function -->
					 <script type="text/javascript" src="appkit-landing-v2.3/assets/js/sos.js"></script>              
					        
                   <ul class="nav navbar-nav faqnav header-ul">
                        <li class="nav-item"><a class="nav-link scrollto" onclick="location.href='memberlist.do'">회원정보관리</a></li>
                        <li class="nav-item"><a class="nav-link scrollto" onclick="location.href='viewUlocation.do'">고객위치확인</a></li>
                        <li class="nav-item"><a class="nav-link scrollto" onclick="location.href='viewHlocation.do'">헬멧위치확인</a></li>
                        <li class="nav-item"><a class="nav-link scrollto" onclick="location.href='viewBlackbox.do'">실시간블랙박스</a></li>                   
                        <li class="nav-item"><a class="nav-link scrollto" onclick="location.href='faq.do'">고객센터</a></li>            
                        <li class="nav-item"><a class="nav-link scrollto" onclick="location.href='logout.do'">로그아웃</a></li>            
                    </ul><!--//nav-->
                    
                    <%} else {%>
                    
                    <!-- user 로그인 -->
                     <ul class="nav navbar-nav faqnav">
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

    
	<!--FAQ 시작 -->
	<div class="container faq-section">
		<div class="col-md-4">
			<ul class="list-group help-group ">
				<div class="faq-list list-group nav nav-tabs">
					<a href="#tab1" class="list-group-item active" role="tab"data-toggle="tab">이용안내</a>
					<a href="#tab2"	class="list-group-item active" role="tab" data-toggle="tab">안전수칙</a>
					<a href="#tab3" class="list-group-item active" role="tab" data-toggle="tab">고객센터</a>
					<a href="#tab4" class="list-group-item active" role="tab" data-toggle="tab">SOS</a>
					<a href="#tab5" class="list-group-item active" role="tab" data-toggle="tab">블랙박스</a>
				</div>
			</ul>
		</div>
		<div class="col-md-8">
			<div class="tab-content panels-faq">
				<div class="tab-pane active" id="tab1">
					<div class="panel-group" id="help-accordion-1">
						<div class="panel panel-default panel-help">
							<a href="#a1" data-toggle="collapse"
								data-parent="#help-accordion-1">
								<div class="panel-heading">
									<h2>1. GOAHED는 어떻게 탑승하나요?</h2>
								</div>
							</a>
							<div id="a1" class="collapse in">
								<div class="panel-body">
									<p>[대여 방법]</p>
									<p>회원가입시 면허증 등록 > 로그인 후 결제 > 지도에서 킥보드 선택> 헬멧착용 및 음주여부 측정 > 이용시작  </p>
								</div>
							</div>
						</div>
						<div class="panel panel-default panel-help">
							<a href="#a2" data-toggle="collapse"
								data-parent="#help-accordion-1">
								<div class="panel-heading">
									<h2>2. GOAHED는 누구나 탈 수 있나요?</h2>
								</div>
							</a>
							<div id="a2" class="collapse">
								<div class="panel-body">
									<p>전동킥보드는 도로교통법 상 원동기 면허 이상(소형, 보통 운전면허 포함)의 먼허증을 소지하고
										계신분들은 누구나 이용 가능합니다.</p>
								</div>
							</div>
						</div>
						<div class="panel panel-default panel-help">
							<a href="#a3" data-toggle="collapse"
								data-parent="#help-accordion-1">
								<div class="panel-heading">
									<h2>3. 탑승 가능한 시간은 언제인가요?</h2>
								</div>
							</a>
							<div id="a3" class="collapse">
								<div class="panel-body">
									<p>GOAHED는 24시간 이용 가능합니다.</p>
								</div>
							</div>
						</div>
						<div class="panel panel-default panel-help">
							<a href="#a4" data-toggle="collapse"
								data-parent="#help-accordion-1">
								<div class="panel-heading">
									<h2>4. 지도에는 킥보드가 안 뜨는데 앞에 있어요! 타도 되나요?</h2>
								</div>
							</a>
							<div id="a4" class="collapse">
								<div class="panel-body">
									<p>배터리가 부족한 킥보드는 지도에 표시 되지 않으며 이용불가능합니다.</p>
									<p>앱 내 지도에 표시 된 킥보드만 탑승 부탁드립니다!</p>
								</div>
							</div>
						</div>		
						</div>
					</div>
				<!-- 안전 수칙 -->
				<div class="tab-pane" id="tab2">
					 <div class="panel-group" id="help-accordion-2">
						<div class="panel panel-default panel-help">
							<a href="#b1" data-toggle="collapse"
								data-parent="#help-accordion-2">
								<div class="panel-heading">
									<h2>1. 전동킥보드는 어디서 탑승해야 하나요?</h2>
								</div>
							</a>
							<div id="b1" class="collapse in">
								<div class="panel-body">
									<p>전동킥보드는 현행법상 원동기장치자전거로, 차도 가장자리, 이면도로, 그리고 자전거 도로에서 탑승해주세요!</p>
								</div>
							</div>
						</div>
						<div class="panel panel-default panel-help">
							<a href="#b2" data-toggle="collapse"
								data-parent="#help-accordion-2">
								<div class="panel-heading">
									<h2>2. 1대의 킥보드에 2명이 탑승가능한가요?</h2>
								</div>
							</a>
							<div id="b2" class="collapse">
								<div class="panel-body">
									<p>킥보드 주행시 반드시 1명만 탑승하세요.</p>
									<p>2인 이상 탑승 시 탑승자와 동승자 모두 대형사고로 이어질 수 있습니다.</p>
									<p>킥보드의 탑승 가능한 최대 무게는 100kg입니다.</p>
								</div>
							</div>
						</div>
						<div class="panel panel-default panel-help">
							<a href="#b3" data-toggle="collapse"
								data-parent="#help-accordion-2">
								<div class="panel-heading">
									<h2>3. 헬멧을 꼭 써야하나요? </h2>
								</div>
							</a>
							<div id="b3" class="collapse">
								<div class="panel-body">
									<p>GOAHED는 헬멧 미착용시 작동하지 않습니다.</p>
									<p>GOAHED 탑승시 헬멧을 착용해주세요!</p>
								</div>
							</div>
						</div>
							<div class="panel panel-default panel-help">
							<a href="#b4" data-toggle="collapse"
								data-parent="#help-accordion-2">
								<div class="panel-heading">
									<h2>4. 음주시 이용 불가능하나요??</h2>
								</div>
							</a>
							<div id="b4" class="collapse">
								<div class="panel-body">
									<p>GOAHED는 이용 전 음주여부를 측정합니다.</p>
									<p>기준 알코올 수치 초과시 이용 불가합니다.</p>
								</div>
							</div>
						</div>
					</div>
				</div>
	
				<!-- 고객센터 시작 -->
				<div class="tab-pane" id="tab3">
					<div class="panel-group" id="help-accordion-3">
						<div class="panel panel-default panel-help">
							<a href="#c1" data-toggle="collapse"
								data-parent="#help-accordion-3">
								<div class="panel-heading">
									<h2>1. 고객센터 운영시간 </h2>
								</div>
							</a>
							<div id="c1" class="collapse in">
								<div class="panel-body">
									<p>고객센터 응대 시간은 평일 오전 10:00 ~ 오후 6:00까지 입니다.</p>
									<br />
									<p>*주말, 공휴일 제외</p>
								</div>
							</div>
						</div>
						
				</div>
			</div>
			<!-- sos -->
				<div class="tab-pane" id="tab4">
					<div class="panel-group" id="help-accordion-4">
						<div class="panel panel-default panel-help">
							<a href="#d1" data-toggle="collapse"
								data-parent="#help-accordion-4">
								<div class="panel-heading">
									<h2>1. SOS 운영시간 </h2>
								</div>
							</a>
							<div id="d1" class="collapse in">
								<div class="panel-body">
									<p>SOS 운영 시간은 24시간 입니다.</p>
								</div>
							</div>
						</div>
							<div class="panel panel-default panel-help">
							<a href="#d2" data-toggle="collapse"
								data-parent="#help-accordion-4">
								<div class="panel-heading">
									<h2>2. SOS 발생시 어떻게 작동하나요? </h2>
								</div>
							</a>
							<div id="d2" class="collapse">
								<div class="panel-body">
									<p>GOAHED는 낙상감지가 되면 관리자 창에 sos 페이지로 이동하여 사고를 파악합니다</p>
									<p>이후 119 신고 및 보호자에게 연락이 취해져 고객의 안전을 신속히 대처합니다.</p>
								</div>
							</div>
						</div>
				</div>
			</div>
			<!-- 블랙박스 -->
			<div class="tab-pane" id="tab5">
					<div class="panel-group" id="help-accordion-5">
						<div class="panel panel-default panel-help">
							<a href="#e1" data-toggle="collapse"
								data-parent="#help-accordion-5">
								<div class="panel-heading">
									<h2>1. 블랙박스 작동시간 </h2>
								</div>
							</a>
							<div id="e1" class="collapse in">
								<div class="panel-body">
									<p>GOAHED 블랙박스는 킥보드 이용중 모든 시간이 저장됩니다.</p>
								</div>
							</div>
						</div>
							<div class="panel panel-default panel-help">
							<a href="#e2" data-toggle="collapse"
								data-parent="#help-accordion-5">
								<div class="panel-heading">
									<h2>2. 블랙박스 제공은 어떻게 되나요? </h2>
								</div>
							</a>
							<div id="e2" class="collapse">
								<div class="panel-body">
									<p>GOAHED 블랙박스는 사고시 회사측에서 확인 후 제공가능합니다.</p>
									<p>자세한 문의사항은 고객센터로 연락바랍니다.</p>
								</div>
							</div>
						</div>
				</div>
			</div>
						
				<!-- java script 영역 -->		
				<script src='https://code.jquery.com/jquery-2.2.4.min.js'></script>
				<script
					src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js'></script>
				<script src="appkit-landing-v2.3/assets/js/faq.js"></script>
				<script src="appkit-landing-v2.3/assets/js/other.js"></script>
				<script src="appkit-landing-v2.3/assets/js/main.js"></script>
</body>
</html>
