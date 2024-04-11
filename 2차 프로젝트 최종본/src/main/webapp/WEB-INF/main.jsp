<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="com.pc.emp.dto.Main_DTO"%>
<%@ page import="board.free.BoardDTO"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Project 1</title>
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/chatAIPopup.css">
<style>
@font-face {
	font-family: "SOYOMapleBoldTTF";
	src:
		url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2310@1.0/SOYOMapleBoldTTF.woff2")
		format("woff2");
	font-weight: 400;
	font-style: normal;
}
</style>




</head>
<body onload="showClock()">
	<%
	// 세션에서 권한 정보 가져오기
	session = request.getSession(false);
	String role = null;
	if (session != null) {
		role = (String) session.getAttribute("role");
	}
	String displayGrade = "잘못된 접근";
	String displayTitle = "잘못된 접근";
	if ("ADMIN".equals(role)) {
		displayGrade = "관리자";
		displayTitle = "관리자 페이지";
	} else if ("WORKER".equals(role)) {
		displayGrade = "작업자";
		displayTitle = "작업자 페이지";
	}
	%>
	<div id="workerTitle">
		<div id="workerLogo">
			<a href="#"> <image
					src="${pageContext.request.contextPath}/images/logo.png"
					class="logo"></image>
			</a>
		</div>
		<h1 id="mainTitle1">
			<a href="main"><%=displayTitle%></a>
		</h1>
		<div id="myPage">
			<div id="myPageLogo">
				<image src="${pageContext.request.contextPath}/images/bee_happy.png"
					class="workerPic">
			</div>
			<div class=userBox>
				<span id="workerName"><span class="workerGrade"><%=displayGrade%></span>
					${sessionScope.name} </span>
				<div class="accountBox">
					<a class="mybutton">마이페이지</a> <a class="logout"
						href="${pageContext.request.contextPath}/logout">로그아웃</a>
				</div>
			</div>
		</div>
	</div>

	<div id="AI_chatApp">
		<%@ include file="../chatAIPopup.jsp" %>
	</div>
	<button type="button" id="AI_AppOpen">채팅봇</button>


	<div class="wrap">
		<div class="header-nav-container">
			<header>
				<!-- 모바일 헤더 코드 -->
				<div class="header-content">
					<div class="hamburger-menu">
						<span></span> <span></span> <span></span>
					</div>
					<h1 id="headerTitle" style="display: none;">
						<a href="main.html">J.company</a>
					</h1>
				</div>
				<ul>
					<li><a href="work-order.html" class="hover" title="작업지시서">작업</a></li>
					<li><a href="facilityMonitoring.html" class="hover"
						title="품질검사">설비</a></li>
					<li><a href="stock_status.html" class="hover" title="건의사항">재고관리</a></li>
					<%
					if ("ADMIN".equals(role)) {
					%>
					<li id="adminTitle"><a href="Employee_managemen.html"
						class="hover" title="직원관리">직원관리</a></li>
					<%
					}
					%>
					<li><a href="boardTable.html" class="hover" title="직원 게시판">게시판</a></li>
				</ul>
			</header>
			<nav>
				<div class="menu-bar">
					<div class="menu-bar-content">
						<ul>
							<li><a href="workOrder">작업 지침서</a></li>
							<li><a href="workSafety">안전 지침서</a></li>
							<li><a href="workQuality">품질검사</a></li>
							<li><a href="workReport">작업보고</a></li>
						</ul>
					</div>
					<div class="menu-bar-content">
						<ul>
<!-- 							<li><a href="facilityMonitoring.html">설비 모니터링</a></li> -->
							<li><a href="monitor">공정도</a></li>
							<li><a href="grade">설비 설정</a></li>
						</ul>
					</div>
					<div class="menu-bar-content">
						<ul>
							<li><a href="ot">재고 현황</a></li>
							<li><a href="SS">재고 신청</a></li>
							<li><a href="fs">완제품 관리</a></li>
							<li><a href="rodi">재고 불량
									신고</a></li>
						</ul>
					</div>
					<%
					if ("ADMIN".equals(role)) {
					%>
					<div class="menu-bar-content" id="adminNav">
						<ul>
							<li><a href="emp">직원목록</a></li>
							<li><a href="account">권한관리</a></li>
							<li><a href="updateabsent">휴가신청</a></li>
						</ul>
					</div>
					<%
					}
					%>
					<div class="menu-bar-content">
						<ul>
							<li><a href="dot?boardType=자유게시판">자유게시판</a></li>
							<li><a href="dot?boardType=건의게시판">건의사항</a></li>
							<li><a href="dot?boardType=QaA게시판">Q&A</a></li>
						</ul>
					</div>
				</div>
			</nav>
		</div>
		<div class="aside-section-container">
			<aside>
				<!-- aside 영역내에 메뉴 추가 가능함 -->
			</aside>
			<section>
				<div class="dashboard-header">
					<div class="titleAndToggle" style="display: flex;">
						메인 페이지
						<div id="toggleDiv"></div>
					</div>
					<div id="divClock" class="clock"></div>
				</div>
				<div class="dashboard-main">
					<div class="card">
						<a href="fs"
							style="color: inherit; text-decoration: none;">
							<div class="card-header">월간 완제품 현황</div>
							<div class="card-content">
								<canvas id="productionChart" style = "min-width:600px !important;, min-height:300px !important;"></canvas>
							</div>
							<table class="table">
								<thead>
									<tr>
										<th>ID</th>
										<th>등급</th>
										<th>양품</th>
										<th>불량</th>
									</tr>
								</thead>
								<tbody>

									<%
									List jslist = (List) request.getAttribute("list3");

									for (int i = 0; i < jslist.size(); i++) {

										Main_DTO jsdto = (Main_DTO) jslist.get(i);
									%>


									<tr>
										<td><%=jsdto.get월간번호()%></td>
										<td><%=jsdto.get월간등급()%></td>
										<td><%=jsdto.get월간완제품()%></td>
										<td><%=jsdto.get월간불량품()%></td>
									</tr>

									<%
									}
									%>



								</tbody>
							</table>
						</a>
					</div>
					<div class="card">
							<a href="fs" style="color: inherit; text-decoration: none;">
						<div class="card-header">일일 양품 현황</div>
						<div class="card-content">
							<div id="performanceGage">
								<div class="gage-label">퍼포먼스</div>
							</div>
							<div id="mainStreamGage">
								<div class="gage-label">메인스트림</div>
							</div>
							<div id="entryGage">
								<div class="gage-label">엔트리</div>
							</div>
						</div>
						</a>
						
					</div>
					<div class="card">
						<a href="dot?boardType=건의게시판"
							style="text-decoration: none; color: inherit;">
							<div class="card-header">건의사항</div>
							<div class="card-content">
								<div class="list">
									<!-- row는 행임 제목 영역에 제목 -->
									<div class="row">
										<div class="cell">번호</div>
										<div class="cell">제목</div>
										<div class="cell">작성일</div>
										<div class="cell">답변</div>
									</div>
									<%
									List<BoardDTO> list = (List<BoardDTO>) request.getAttribute("list");
									System.out.println("list.size() : " + list.size());
									SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 M월 dd일");
									for (int i = 0; i < list.size(); i++) {
									    BoardDTO board = (BoardDTO) list.get(i);

									    int seq = board.getSeq();
									    String title = board.getTitle();
									    Date wDate = board.getWdate();
									    String formattedDate = sdf.format(wDate); 
									    formattedDate = formattedDate.replace("년 ", "년<br>");
									%>
									<div class="row">
									    <div class="cell"><%=seq%></div>
									    <div class="cell"><%=title%></div>
									    <div class="cell"><%=formattedDate%></div> <!-- 변환된 날짜 출력 -->
									    <div class="cell">X</div>
									</div>
									<%
									}
									%>
								</div>



							</div>
						</a>
					</div>
					<div class="card">
						<a href="updateabsent" id="vacationLink"
							style="color: inherit; text-decoration: none;">
							<div class="card-header">휴가 내역</div> <%
 if ("ADMIN".equals(role)) {
 %>
							<div class="card-content">
								<div>
									<table id="vacationTable">
										<thead>
											<tr>
												<th width="15%">직원번호</th>
												<th width="40%">기간</th>
												<th width="20%">사유</th>
												<th width="20%">상태</th>
											</tr>
										</thead>
										<tbody id="vacationTableBody">
											<%-- JavaScript를 통해 동적으로 채워질 부분 --%>
										</tbody>
									</table>
								</div>
							</div> <%
 }
 %>
						</a>
					</div>
					<div class="line-cards">
						<div class="line-card">
							<a href="monitor"
								style="color: inherit; text-decoration: none;">
								<div class="card-header2">
									<h3>생산 라인</h3>
								</div>
								<div class="card-content2">
									<div class="status" id="cpu-status">Pending</div>
									<div class="defect-rate" id="cpu-defect-rate">불량률: 0%</div>
									<div class="defect-count" id="cpu-defect-count">불량: 0</div>
									<div class="good-count" id="cpu-good-count">통과: 0</div>
									<div class="cycle-count" id="cpu-operations">사이클 횟수: 0</div>
								</div>
							</a>
						</div>
						<div class="line-card">
							<a href="ot"
								style="color: inherit; text-decoration: none;">
								<div class="card-header2">
									<h3>재고현황</h3>
								</div>
								<div class="card-content3">
									<table class="table2">
										<thead>
											<tr>
												<th>품목</th>
												<th>양품 수량</th>
												<th>양품 재고위치</th>
												<th>불량 수량</th>
												<th>불량 재고위치</th>
											</tr>
										</thead>
										<tbody>

											<%
											List list2 = (List) request.getAttribute("list2");

											for (int i = 0; i < 3; i++) {

												Main_DTO dto = (Main_DTO) list2.get(i);
											%>

											<tr>
												<td><%=dto.get품목()%></td>
												<td><%=dto.get양품수량()%></td>
												<td><%=dto.get양품재고위치()%></td>
												<td><%=dto.get불량수량()%></td>
												<td><%=dto.get불량재고위치()%></td>
											</tr>
											<%
											}
											%>
										</tbody>
									</table>
								</div>
							</a>
						</div>
					</div>
				</div>
			</section>
		</div>
		<footer>ⓒ2024 J.company System</footer>
	</div>

	<script>
		
	<%List jslist1 = (List) request.getAttribute("list4");
	  Main_DTO jsdto0 = (Main_DTO) jslist1.get(0);
	  Main_DTO jsdto1 = (Main_DTO) jslist1.get(1);
	  Main_DTO jsdto2 = (Main_DTO) jslist1.get(2);
	  
	  
	  %>
	  let a =`<%=jsdto0.get일일완제품()%>` ;
	  let b =`<%=jsdto1.get일일완제품()%>` ;
	  let c =`<%=jsdto2.get일일완제품()%>` ;
	  
	  
	  
	  
	</script>

	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.3.0/raphael.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/justgage/1.3.2/justgage.min.js"></script>
	<script src="js/main.js"></script>
	<script src="js/chatAIPopup.js">
	</script>
	<script>
		let noneBody = document.querySelector("#AI_chatApp");
		let gogoBtn = document.querySelector("#AI_AppOpen");
		let closeBtn = document.querySelector("#AI_closeButton");
	
		gogoBtn.addEventListener("click", () => {
			noneBody.style.display = "block";
		})
		
		closeBtn.addEventListener("click", () => {
			noneBody.style.display = "none";
// 			talkArea.innerHTML = "";
		})
	</script>
</body>

</html>