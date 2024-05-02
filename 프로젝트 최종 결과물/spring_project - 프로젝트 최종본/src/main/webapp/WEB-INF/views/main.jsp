<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%-- 재고, 게시판
<%@ page import="com.pc.emp.dto.Main_DTO"%>
<%@ page import="com.project.board.dto.BoardDTO"%>
--%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Project 1</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/main.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/chatAIPopup.css">
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
			<a href="/staff/main"> <image
					src="${pageContext.request.contextPath}/images/logo.png"
					class="logo"></image>
			</a>
		</div>
		<h1 id="mainTitle1">
			<%
			if ("ADMIN".equals(role)) {
			%>
			<a href="/mes_project/main"><%=displayTitle%></a>
			<%
			} else {
			%>
			<a href="/mes_project/main_work"><%=displayTitle%></a>
			<%
			}
			%>


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
		<%@ include file="chatAIPopup.jsp"%>
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
					<li id="adminTitle"><a href="/staff/staffmgmt/home"
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
							<li><a href="process">공정도</a></li>
							<li><a href="facility">설비 설정</a></li>
						</ul>
					</div>
					<div class="menu-bar-content">
						<ul>
							<li><a href="ot">재고 현황</a></li>
							<li><a href="SS">재고 신청</a></li>
							<li><a href="fs">완제품 관리</a></li>
							<li><a href="rodi">재고 불량 신고</a></li>
						</ul>
					</div>
					<%
					if ("ADMIN".equals(role)) {
					%>
					<div class="menu-bar-content" id="adminNav">
						<ul>
							<li><a href="/mes_project/staffmgmt/home">직원목록</a></li>
							<li><a href="/mes_project/role/home">권한관리</a></li>
							<li><a href="/mes_project/absent/home">휴가신청</a></li>
						</ul>
					</div>
					<%
					}
					%>
					<div class="menu-bar-content">
						<ul>
							<li><a href="boardTable.do?boardType=자유게시판">자유게시판</a></li>
							<li><a href="boardTable.do?boardType=건의게시판">건의사항</a></li>
							<li><a href="boardTable.do?boardType=QaA게시판">Q&A</a></li>
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
						<a href="fs" style="color: inherit; text-decoration: none;">
							<div class="card-header">월간 등급별 판매량</div>
							<div class="card-content">

								<canvas id="productionChart"></canvas>

								<input type="hidden" class="entryMonth"
									value="${totalEntryMonthSals}"> <input type="hidden"
									class="mainMonth" value="${totalMainMonthSals}"> <input
									type="hidden" class="perForMonth"
									value="${totalPerforMonthSals}">
							</div>
							<div class="money">실수익 : 단위(억)</div>

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
									<tr>
										<th>4월 판매량</th>
										<th>${totalEntryMonthSals }</th>
										<th>${totalMainMonthSals }</th>
										<th>${totalPerforMonthSals }</th>
									</tr>
									<tr>
										<th>4월 실수익</th>
										<th>${temsi }</th>
										<th>${tmmsi }</th>
										<th>${tpmsi }</th>
									</tr>
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
									<c:forEach var="b_list" items="${b_list }">
										<div class="row">
											<div class="cell">${b_list.b_sequence }</div>
											<div class="cell">${b_list.b_title }</div>
											<div class="cell">${b_list.b_date }</div>
											<div class="cell">X</div>
										</div>
									</c:forEach>
									<%-- 
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
									--%>
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
							<a href="monitor" style="color: inherit; text-decoration: none;">
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
						<div class="line-card" id="jjh_main" style="width: 71%;">
							<a href="ot" style="color: inherit; text-decoration: none;">
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
											<c:if test="${not empty listPaging }">
												<c:forEach var="lp" items="${listPaging}">
													<tr>
														<th>${lp.mesGrade}</th>
														<th>${lp.GCount}</th>
														<th>${lp.GLoc }</th>
														<th>${lp.BCount}</th>
														<th>${lp.BLoc }</th>
													</tr>
												</c:forEach>
											</c:if>
										</tbody>
									</table>
								</div>
							</a>
						</div>
					</div>
				</div>
				<button id="countChange" style="display: none"></button>
			</section>
		</div>
		<footer>ⓒ2024 J.company System</footer>
	</div>

	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.3.0/raphael.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/justgage/1.3.2/justgage.min.js"></script>

	<script>
		let performanceGageCount = 0;
		let mainStreamGageCount = 0;
		let entryGageCount = 0;
		
		let perCount = 0;
		let mainCount = 0;
		let entCount = 0;
		
		
		let itv = setInterval(function() {
			getPassStatusAjax();document.querySelector("#countChange").click();
		}, 5000);
		
		
		function getPassStatusAjax() {
			let xhr = new XMLHttpRequest();
			xhr.open("post", "itv_process", true);
			xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			
			xhr.send();
			xhr.onload = function() {
				let JSON_data = xhr.responseText;
				
				let data = JSON.parse(JSON_data);
				
				for(let i=0; i<data.length; i++) {
					console.log(data[i]);
					console.log("완품 등급" + data[i].g_sequence);
					console.log("완품 개수" + data[i].product);
					console.log("통과 개수" + data[i].pass);
					console.log("불량 개수" + data[i].fail);
					
					if(data[i].g_sequence == 1) {
						performanceGageCount = data[i].pass;
						perCount = data[i].product;
					} else if(data[i].g_sequence == 2) {
						mainStreamGageCount = data[i].pass;
						mainCount = data[i].product;
					} else if(data[i].g_sequence == 3) {
						entryGageCount = data[i].pass;
						entCount = data[i].product;
					} 
				}
			}
		}
	</script>
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
		})
	</script>
</body>

</html>