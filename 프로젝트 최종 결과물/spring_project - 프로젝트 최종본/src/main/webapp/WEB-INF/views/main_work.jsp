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

.requestCount {
	width: 90px;
	height: 20px;
	border: 0;
}

.table_SR {
	display: flex;
	flex-direction: column;
	border-collapse: collapse;
	width: 90%;
}

.row_SR, .row_SR1 {
	display: flex;
}

.row_SR:first-child, .row_sr1:first-child {
	border-top: 2px solid #ddd;
}

.cell_SR {
	padding: 8px;
	text-align: center;
	border-right: 1px solid #ddd;
}

.cell_SR:nth-child(1) {
	width: 40%;
}

.cell_SR:nth-child(2) {
	width: 50%;
	display: flex;
	justify-content: space-around;
}

.cell_SR:nth-child(3) {
	width: 10%;
}

.row_SR {
	background-color: #888888;
}

.cell_SR:last-child {
	border-right: none;
}

.add_Stock_bar, .order2 {
	/* margin-top: 10px; */
	width: 100px;
	height: 30px;
	border-radius: 5px;
	cursor: pointer;
	margin-bottom: 20px;
	color: #fff;
	border: 0;
	background: #3498DB;
}

.dashboard-main {
	
}

.itemList {
	display: flex;
	flex-wrap: wrap;
	flex-direction: row;
	justify-content: center;
	align-items: center;
	flex-wrap: wrap;
	height: 60%;
	width: 95%;
}

.item {
	width: 90%;
	height: 100%;
	display: flex;
	flex-direction: column;
	justify-content: start;
	overflow-y: auto;
	font-size: 12px;
}

.itemName {
	width: 95px;
	text-overflow: ellipsis;
}

.modal-overlay {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	z-index: 1000;
	display: flex;
	justify-content: center;
	align-items: center;
}

.request_result {
	display: none;
	position: fixed;
	overflow-y: auto;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	max-width: 300px;
	width: 30%;
	background-color: white;
	padding: 20px;
	border-radius: 5px;
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.5);
	z-index: 1001;
}

.add_img {
	position: fixed;
	overflow-y: auto;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	max-width: 1700px;
	background-color: white;
	border-radius: 5px;
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0 .5);
	z-index: 1002;
	align-items: center;
	flex-direction: column;
	background-color: #eee;
	width: 35%;
	height: 70%;
	display: none;
}

.Stock_page {
	line-height: 100px;
	width: 210px;
	margin: auto;
	font-size: 30px;
}

.searchbox {
	border: 1px solid #ddd;
	background-color: #fff;
	border-radius: 3px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	font-size: 16px;
	height: 22px;
	width: 300px;
	display: flex;
	margin: auto;
	padding: 5px;
	margin-top: 20px;
}

.search {
	padding-right: 20px;
}

.searchbox input, .ordering_searchbox input {
	border: 1px solid #ccc;
	border-radius: 3px;
}

.glasses, .orderingGlasses {
	padding: 1px;
	height: 20px;
}

.itemInfor1 input, .itemInfor2 input {
	margin-top: 7px;
}

.itemInfor1, .orderingItemInfor1 {
	display: flex;
	height: 35px;
	line-height: 33px;
	justify-content: space-evenly;
}

.itemInfor1 div:first-child, .orderingItemInfor1 div:first-child {
	text-align: center;
	width: 15%;
	border: 1px solid #eee;
	background-color: #aaa;
}

.itemInfor1 div, .orderingItemInfor1 div {
	text-align: center;
	width: 30%;
	border: 1px solid #eee;
	background-color: #aaa;
}

.itemInfor2, .orderingItemInfor2 {
	display: flex;
	line-height: 25px;
	margin-top: 3px;
}

.itemInfor2 div:first-child, .orderingItemInfor2 div:first-child {
	background-color: #fff;
	text-align: center;
	border: 1px solid #888888;
	width: 15%;
	height: 33px;
	line-height: 33px;
}

.itemInfor2 div, .orderingItemInfor2 div {
	background-color: #fff;
	text-align: center;
	border: 1px solid #888888;
	width: 30%;
	height: 33px;
	line-height: 33px;
}

.itemInfor1 input, .itemInfor2 input {
	margin-top: 7px;
}

.button_ac, .ordering_bct {
	/* border: 1px solid red; */
	width: 300px;
	margin: auto;
	display: flex;
	justify-content: space-around;
}

#add_text, #cancel {
	/* margin-top: 10px; */
	width: 100px;
	height: 30px;
	border-radius: 5px;
	cursor: pointer;
	margin-bottom: 20px;
	color: #fff;
	border: 0;
	background: #3498DB;
}

.x-button {
	width: 30px;
	height: 30px;
	background-color: transparent;
	border-radius: 10px;
	position: absolute;
	cursor: pointer;
	top: 9px;
	right: 7px;
}

.x-button::before, .x-button::after {
	content: '';
	position: absolute;
	top: 50%;
	left: 50%;
	width: 2px;
	height: 24px;
	background-color: black;
}

.x-button::before {
	transform: translate(-50%, -50%) rotate(45deg);
}

.x-button::after {
	transform: translate(-50%, -50%) rotate(-45deg);
}

.x-button:hover {
	background-color: red;
}

.x-button:hover::before, .x-button:hover::after {
	background-color: white;
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
										<th>4월 판매량</th>
										<th>퍼포먼스</th>
										<th>메인 스트림</th>
										<th>엔트리</th>
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

					<div class="card" style="width: 29%; margin: 0; margin-right: 20px">
						<div class="line-card" style="width: 95%">
							<a href="process" style="color: inherit; text-decoration: none;">
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
					</div>


					<div class="card" style="width: 60%; margin: 0">
						<div class="card-header"
							style="display: flex; justify-content: space-between;">
							재고현황

							<div class="add">
								<%
								if (!"ADMIN".equals(role)) {
								%>
								<input type="button" class="add_Stock_bar" value="재고요청">
								<%
								}
								%>
							</div>
						</div>
						<div class="line-card">
							<a href="ot" style="color: inherit; text-decoration: none;">
								<div class="card-header2"></div>
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

				<div class="modal-overlay" id="modal-overlay2" style="display: none">
					<div class="add_img" style="display: inline-flex">
						<div class="Stock_page">품목선택 페이지</div>
						<span id="closeModalBtn" class="x-button"></span> <br>
						<div class="itemList">
							<div class="item">
								<div class="itemInfor1">
									<div>
										<input type="checkbox" class="pics">
									</div>
									<div>품목</div>
									<div>창고 수량</div>
									<div>신청 개수</div>
								</div>
								<c:if test="${not empty itemSelectPage }">
									<c:forEach var="l2" items="${itemSelectPage }">
										<div class="itemInfor2">
											<div class="pic">
												<input type="checkbox" class="pic1">
											</div>
											<div class="itemMesId" style="display: none">
												${l2.mesId}</div>
											<div class="itemMesName" style="display: none">
												${l2.mesName}</div>
											<div class="itemName">${l2.mesGrade}</div>
											<div class="itemIndex2">${l2.GCount}</div>
											<div class="itemMesPrice" style="display: none">
												${l2.mesPrice}</div>
											<div class="itemMGLoc" style="display: none">${l2.GLoc}</div>
											<div class="itemBCount" style="display: none">
												${l2.BCount}</div>
											<div class="itemBLoc" style="display: none">${l2.BLoc}</div>
											<div>
												<input type="number" class='requestCount'>
											</div>
										</div>
									</c:forEach>
								</c:if>
							</div>
						</div>
						<br> <br>
						<div class="button_ac">
							<button type="button" id="add_text">요청</button>
						</div>
					</div>

					<form method="post" class="si" action="sidy"
						id="adminSendStockRequestForm">
						<input type="hidden" name="mesGrade" value=""> <input
							type="hidden" name="userInfo" value="${sessionScope.name }">
						<input type="hidden" name="orderQuantity" value="">
					</form>
					<script>
							let chkBtn = document.querySelectorAll(".pic1");
							
							let mesGrade = document.querySelector("[name=mesGrade]");
							let orderQuantity = document.querySelector("[name=orderQuantity]");
							let workerName = document.querySelector("#workerName");
							
							let formSendBtn = document.querySelector("#add_text");
							
							let adminSendStockRequestForm = document.querySelector("#adminSendStockRequestForm");
	
							let mesGradeZip = "";
							let mesCountZip = "";
	
							formSendBtn.addEventListener("click", () => {
							    console.log("----" + workerName.textContent);
							    document.querySelector("[name=userInfo]").value = workerName.textContent.replace(/\s+/g, "");

	
							    for(let i=0; i<chkBtn.length; i++) {
							        if(chkBtn[i].checked) {
							            mesGradeZip += chkBtn[i].parentNode.parentNode.querySelector(".itemName").textContent + ","; // 등급
							            mesCountZip += chkBtn[i].parentNode.parentNode.querySelector(".requestCount").value + ","; // 개수
							        }
							    }
							    mesGrade.value = mesGradeZip;
							    orderQuantity.value = mesCountZip;
							    
							    
							    adminSendStockRequestForm.submit();
							});
					</script>
				</div>
				<button id="countChange" style="display: none"></button>
			</section>
		</div>
		<footer>ⓒ2024 J.company System</footer>
		<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.4/raphael-min.js"></script>
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/justgage/1.2.2/justgage.js"></script>

		<script>
		let performanceGageCount = 0;
		let mainStreamGageCount = 0;
		let entryGageCount = 0;
		
		let perCount = 0;
		let mainCount = 0;
		let entCount = 0;
		
		
		let itv = setInterval(function() {
			getPassStatusAjax();document.querySelector("#countChange").click();
		}, 10000);
		
		
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
		<script src="js/main_work.js"></script>
		<script>
		
	</script>
		<script src="js/chatAIPopup.js">
	</script>
		<script>
		let noneBody = document.querySelector("#AI_chatApp");
		let gogoBtn = document.querySelector("#AI_AppOpen");
		let closeBtn = document.querySelector("#AI_closeButton");
		let closeModalBtn = document.querySelector("#closeModalBtn");
		let add_img = document.querySelector(".add_img");
		
		closeModalBtn.addEventListener("click", () => {
			modalOverlay2.style.display = "none";
		})
		
	
		gogoBtn.addEventListener("click", () => {
			noneBody.style.display = "block";
		})
		
		closeBtn.addEventListener("click", () => {
			noneBody.style.display = "none";
		})
		
		let add_Stock_bar = document.querySelector(".add_Stock_bar");
		let modalOverlay = document.getElementById('modal-overlay');
		let modalOverlay2 = document.getElementById('modal-overlay2');
		let requestModal = document.getElementById('request_result');
		let cancel_rr = document.querySelector(".cancel_rr");
		let lastbtn = 0;
		
		add_Stock_bar.onclick = function () {
            lastbtn = this;
            modalOverlay2.style.display = 'flex';
        }
	</script>
</body>

</html>