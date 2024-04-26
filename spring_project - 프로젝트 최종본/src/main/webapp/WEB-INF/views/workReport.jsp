<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Work Report Page</title>

<style>
@font-face {
	font-family: "SOYOMapleBoldTTF";
	src:
		url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2310@1.0/SOYOMapleBoldTTF.woff2")
		format("woff2");
	font-weight: 400;
	font-style: normal;
}

input, select, textarea {
	font-family: "SOYOMapleBoldTTF";
}

body {
	display: flex;
	flex-direction: column;
	align-items: center;
	font-family: "SOYOMapleBoldTTF";
	margin: 0 auto;
	/* font-family: Arial, sans-serif; */
	background: #fff;
	color: #333;
	background-color: #ccc;
}

/* 햄버거 메뉴 아이콘 */
.hamburger-menu {
	display: none;
	cursor: pointer;
	flex-direction: column;
	justify-content: space-between;
	width: 25px;
	height: 20px;
}

.hamburger-menu span {
	display: block;
	height: 3px;
	width: 100%;
	background-color: #fff;
	transition: all 0.2s ease;
}

/* title */
#workerTitle {
	display: flex;
	width: 1000px;
	justify-content: space-between;
	padding: 5px;
}

#workerLogo {
	width: 200px;
	height: 80px;
	display: flex;
	align-items: center;
}

#workerTitle h1 {
	width: 200px;
	color: #000;
}

#mainTitle a {
	text-decoration: none;
	color: #333;
}

#myPage {
	width: 200px;
	height: 80px;
	display: flex;
	align-items: center;
}

#myPageLogo {
	width: 80px;
	height: 80px;
	margin-right: 3%;
}

#workerName a {
	text-decoration: none;
	color: #333;
}

#workerName a:hover {
	text-decoration: none;
	color: #888;
	transition: color 0.2s ease;
}

#workerTitle .workerPic {
	width: 80px;
	height: 80px;
	border-radius: 50%;
}

#workerTitle .logo {
	width: 200px;
	height: 70px;
}

/* title end */
.wrap {
	width: 1000px;
	/* height: 100vh; */
	display: flex;
	flex-direction: column;
	margin: auto;
}

/* header와 nav의 집합 */
.header-nav-container {
	position: relative;
	width: 100%;
	/* wrap과 동일한 너비 */
}

/* header 코드 */
header {
	width: 100%;
	background: #000;
	color: #fff;
	text-align: center;
	padding: 20px;
	box-sizing: border-box;
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
}

header h1 {
	font-size: 30px;
	margin: 0;
}

header ul {
	padding: 0;
	display: flex;
	justify-content: space-around;
	list-style: none;
	align-items: center;
}

header ul li {
	display: inline-block;
	margin: 0 15px;
}

header ul li a {
	font-size: 18px;
	text-decoration: none;
	color: #fff;
	transition: color 0.3s ease;
}

header ul li a:hover {
	color: #aaa;
}

/* header 코드 끝 */

/* title */
#workerTitle {
	display: flex;
	width: 1000px;
	justify-content: space-between;
	padding: 5px;
}

#workerTitle h1 {
	width: 200px;
	color: #000;
}

#workerLogo {
	width: 240px;
	height: 80px;
	display: flex;
	align-items: center;
}

#workerLogo img {
	width: 100%;
	height: 100%;
}

#mainTitle1 {
	text-align: center;
	display: block;
}

#mainTitle1 a {
	text-decoration: none;
	color: #333;
}

.userBox {
	width: 63%;
	height: 95%;
	display: flex;
	flex-direction: column;
	justify-content: space-evenly;
	align-items: center;
}

.accountBox {
	height: 40%;
	width: 100%;
	display: flex;
	align-items: center;
	justify-content: center;
}

.mybutton {
	box-sizing: border-box;
	text-decoration: none;
	color: #fff;
	width: 47%;
	background-color: #555;
	font-size: 12px;
	display: flex;
	justify-content: center;
	align-items: center;
	border: 0;
	border-radius: 5px;
	height: 100%;;
}

.mybutton:hover {
	background-color: #000;
}

#myPage {
	border: #ddd;
	border-radius: 8px;
	background-color: #fff;
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
	width: 240px;
	height: 80px;
	display: flex;
	justify-content: center;
	align-items: center;
}

.logout {
	box-sizing: border-box;
	text-decoration: none;
	color: #fff;
	width: 43%;
	background-color: #0F52BA;
	font-size: 12px;
	display: flex;
	margin-left: 5px;
	justify-content: center;
	align-items: center;
	border: 0;
	border-radius: 5px;
	height: 100%;;
}

.logout:hover {
	background-color: #00008B;
}

.workerGrade {
	margin-right: 3px;
}

#workerName {
	background: #fff;
	color: #333;
	border-radius: 5px;
	display: flex;
	justify-content: end;
	align-items: center;
	width: 93%;
	height: 40%;
}

#myPageLogo {
	border: 0;
	border-radius: 50%;
	width: 30%;
	height: 90%;
	margin-right: 3%;
}

#myPageLogo img {
	width: 100%;
	height: 100%;
}

#workerName a {
	text-decoration: none;
	color: #333;
}

#workerName a:hover {
	text-decoration: none;
	color: #888;
	transition: color 0.2s ease;
}

/* title end */
nav {
	width: 100%;
	position: absolute;
	top: 100%;
	/* header 높이에 맞게 조정 */
	left: 0;
	right: 0;
	background: #eee;
	max-height: 0;
	overflow: hidden;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
	transition: max-height 0.5s ease, visibility 0s 0.5s, opacity 0.5s
		linear;
	visibility: hidden;
	z-index: 100;
	/* opacity: 0; */
}

/* nav 숨김요소 */
nav.active {
	max-height: 500px;
	/* 활성화될 때 최대 높이 설정 */
	visibility: visible;
	opacity: 1;
	transition: max-height 0.5s ease, visibility 0s, opacity 0.5s linear;
}

/* nav 안의 menu-bar요소 */
.menu-bar {
	width: 100%;
	height: 220px;
	border-top: 0px;
	border-right: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
	display: flex;
}

.menu-bar-content {
	margin-left: 40px;
	width: 20%;
	display: inline-block;
	box-sizing: border-box;
}

.menu-bar-content ul li {
	padding: 10px;
}

.menu-bar-content ul li a {
	text-decoration: none;
	color: #444;
}

.menu-bar-content ul li a:hover {
	color: #aaa;
	transition: color 0.2s ease;
}

#menu-bar-content-sub {
	list-style: circle;
	font-size: 14px;
	padding-left: 20px;
}

#menu-bar-content-sub li {
	padding: 5px;
}

/* menu-bar요소 끝 */

/* aside, section */
.aside-section-container {
	width: 100%;
	display: flex;
	/* height: 100%; */
}

/* 좌측 메뉴바 */
aside {
	width: 20%;
	background: #5f5f5f;
}

.aside-section-container ul li {
	margin-top: 25%;
	list-style: none;
}

.aside-section-container ul li a:hover {
	color: black;
}

.aside-section-container ul li a {
	text-decoration: none;
	color: #fff;
}

/* 섹션 창을 조작하기바람 */
section {
	display: flex;
	justify-content: center;
	width: 80%;
	overflow: auto;
	background: #eee;
	z-index: 50;
	align-items: center;
	min-height: 800px;
}

.article-container {
	width: 100%;
	margin-top: -50%;
}

.work-report-main {
	width: 100%;
	text-align: center;
}

.work-report-main a {
	text-decoration: none;
	color: #000;
}

.work-report-title {
	font-size: 25px;
}

.work-report-content {
	width: 100%;
	display: inline-block;
	background-color: #eee;
}

.work-report-list-zip {
	border: 1px solid #ddd;
	border-radius: 8px;
	background-color: #fff;
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
	padding: 10px;
	width: 80%;
	margin: auto;
	margin-bottom: 5%;
}

.work-report-list {
	width: 100%;
	display: inline-block;
}

.work-ann {
	width: 100%;
}

.work-ann h4 {
	text-align: left;
	font-size: 18px;
	padding-left: 20px;
}

.line-select-box {
	width: 15%;
	padding: 5px;
	border-radius: 5px;
	border: 1px solid #bebdbd;
}

.work-report-order {
	width: 100%;
	text-align: left;
	padding-left: 3%;
}

.report-select-box {
	border-radius: 5px;
	width: 16%;
	padding: 5px;
	border: 1px solid #bebdbd;
}

.report-count {
	width: 10%;
	padding: 5px;
	border: 1px solid #bebdbd;
	text-align: right;
	border-radius: 20px;
}

.report-sign {
	border: 1px solid #bebdbd;
	border-radius: 5px;
	padding: 0;
	width: 93%;
	resize: none;
}

.report-send {
	text-align: right;
	/* margin-right: 13%; */
	margin-bottom: 2%;
}

.report-send-button {
	background-color: #3498DB;
	margin-top: 10px;
	width: 80px;
	height: 40px;
	border-radius: 5px;
	cursor: pointer;
	color: #fff;
	border: 0;
}

.report-send-button:hover {
	background-color: rgb(0, 47, 255);
	transition: 0.2s;
}

.report-cancle-button {
	margin: 0 4% 0 1%;
	background-color: red;
	margin-top: 10px;
	width: 80px;
	height: 40px;
	border-radius: 5px;
	cursor: pointer;
	color: #fff;
	border: 0;
}

.report-cancle-button:hover {
	background-color: rgb(190, 52, 52);
	transition: 0.2s;
}

/* 품질검사 보고 현황 */
#quality-history {
	display: inline-block;
}

.quality-report {
	width: 90%;
	margin-left: 10%;
	display: flex;
	justify-content: space-between;
	margin-top: 5%;
	margin-bottom: 5%;
}

.quality-checker {
	width: 30%;
	background-color: #b3b3b3;
}

.quality-checker-img {
	width: 50%;
	margin-top: 10%;
	margin-bottom: 5%;
	margin-left: 25%;
}

.quality-checker-img img {
	width: 50%;
}

.quality-checker-info {
	width: 100%;
	height: 50%;
	background-color: #d1d0d0;
	margin-top: 17%;
	font-size: 12px;
	text-align: center;
}

.quality-report-history {
	width: 90%;
	text-align: center;
	margin-left: 0%;
}

.quality-table {
	display: inline-block;
	width: 100%;
	font-size: 10px;
}

.quality-table-title {
	width: 100%;
	display: table-caption;
	text-align: center;
	font-weight: bold;
	font-size: large;
	margin-top: 3%;
	margin-bottom: 3%;
}

.quality-table-title span {
	font-size: 14px;
}

.quality-table-head {
	display: table-row;
	font-weight: bold;
	text-align: center;
}

.quality-table-row {
	display: table-row;
}

#quality-cell-info {
	width: 35%;
}

.quality-table-cell {
	display: table-cell;
	border: solid;
	border-width: thin;
	padding-left: 5px;
	padding-right: 5px;
}

#model-cell {
	min-width: 50px;
}

.quality-table-head div {
	background-color: #7a7a7a;
}

.back-button-div {
	text-align: center;
	margin-top: 5%;
	margin-bottom: 5%;
}

.back-button-div button {
	background-color: #3498DB;
	margin-top: 10px;
	width: 80px;
	height: 40px;
	border-radius: 5px;
	cursor: pointer;
	color: #fff;
	border: 0;
}

.back-button-div button:hover {
	background-color: rgb(0, 47, 255);
	transition: 0.2s;
}

/* 특이사항 팝업 */
.report-popup {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.7);
}

.report-popup-content {
	background-color: white;
	margin: 15% auto;
	padding: 20px;
	width: 70%;
	border-radius: 5px;
	position: relative;
}

.popup-close {
	position: absolute;
	top: 0;
	right: 0;
	padding: 10px;
	cursor: pointer;
}

label {
	display: inline-block;
	margin: 5px;
	font-size: 15px;
	color: #333;
}

/* aside, section 끝*/
footer {
	width: 100%;
	background: #000;
	color: #fff;
	text-align: center;
	height: 7%;
	line-height: 70px;
}

@media screen and (max-width: 430px) {
	/* 전체 페이지 */
	.wrap {
		width: 100%;
	}
	section div h2 {
		font-size: 20px;
	}

	/* 헤더 */
	header {
		width: 100%;
		background: #000;
		color: #fff;
		text-align: center;
		padding: 5px;
		box-sizing: border-box;
		border-radius: 0px;
	}

	/* 미디어 쿼리 헤더 영역 수정 코드 */
	header ul {
		display: none;
	}
	.header-content {
		display: flex;
		justify-content: center;
		align-items: center;
		width: 100%;
		position: relative;
	}
	#headerTitle {
		display: block !important;
		text-align: center;
		color: #fff;
		width: 100%;
		font-size: 20px;
	}
	#headerTitle a {
		text-decoration: none;
		color: #fff;
	}
	.hamburger-menu {
		position: absolute;
		left: 0;
		top: 0;
		display: flex;
	}
	#workerTitle {
		display: none;
	}
	nav {
		width: 100%;
		position: absolute;
		top: 100%;
		/* header 높이에 맞게 조정 */
		left: 0;
		right: 0;
		background: #eee;
		max-height: 881px;
		overflow: hidden;
		box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
		transition: max-height 0.5s ease, visibility 0s 0.5s, opacity 0.5s
			linear;
		transform: translateX(0%);
		visibility: hidden;
		z-index: 100;
		/* opacity: 0; */
	}
	nav.active {
		/* height: 881px; */
		max-height: none;
		width: 200px;
		visibility: visible;
		opacity: 1;
		transition: max-height 0.5s ease, visibility 0s 0.5s, opacity 0.5s
			linear;
		transform: translateX(0%);
	}

	/* 왼쪽에서 오른쪽으로 나오는 애니메이션을 추가합니다. */
	nav {
		transform: translateX(-100%);
		transition: transform 0.5s ease;
	}
	nav.active {
		transform: translateX(0%);
		transition: transform 0.5s ease;
	}
	nav.closing {
		transform: translateX(-100%);
		transition: transform 0.5s ease;
	}
	nav .menu-bar {
		width: 100%;
		height: 100%;
		border-top: 0px;
		border-right: 1px solid #ccc;
		border-bottom: 1px solid #ccc;
		box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
		display: flex;
		flex-direction: column;
		justify-content: flex-start;
		background-color: #dde;
	}
	.menu-bar-content {
		width: 100%;
		margin-left: 0px;
	}
	.menu-bar-content ul li {
		padding: 10px;
	}
	aside {
		display: none;
	}

	/* 섹션 목록 */
	section {
		width: 100%;
	}
	.workerGrade {
		display: inline;
	}
	.workerPic {
		width: 80px;
		height: 80px;
		border-radius: 50%;
	}
	.line-select-box {
		width: 80px;
		font-size: 12px;
	}
	.report-select-box {
		width: 80px;
		font-size: 12px;
	}
	.report-count {
		width: 80px;
		font-size: 12px;
	}
	.work-report-title div h3 {
		font-size: 20px;
	}
	.quality-checker-info div {
		font-size: 11px;
		padding: 3px;
	}
}
</style>

</head>

<%
// 세션에서 권한 정보 가져오기
session = request.getSession(false);
String role = null;
String userId = null;
if (session != null) {
	role = (String) session.getAttribute("role");
	userId = (String) session.getAttribute("user");
}
System.out.println("----------------------------------------------------");
System.out.println("session : " + session);
System.out.println("role : " + role);
System.out.println("userId : " + userId);

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
		<a href="#"> <img
			src="${pageContext.request.contextPath}/images/logo.png" class="logo">
		</a>
	</div>
	<h1 id="mainTitle">
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

<div class="wrap">
	<div class="header-nav-container">
		<header>
			<!-- 모바일 헤더 코드 -->
			<div class="header-content">
				<div class="hamburger-menu">
					<span></span> <span></span> <span></span>
				</div>
				<h1 id="headerTitle" style="display: none;">
					<a href="main">J.company</a>
				</h1>
			</div>
			<ul>
				<li><a href="#" class="hover" title="작업지시서">작업</a></li>
				<li><a href="#" class="hover" title="품질검사">설비</a></li>
				<li><a href="#" class="hover" title="건의사항">재고관리</a></li>
				<%
				if ("ADMIN".equals(role)) {
				%>
				<li id="adminTitle"><a href="#" class="hover" title="직원관리">직원관리</a></li>
				<%
				}
				%>
				<li><a href="#" class="hover" title="직원 게시판">게시판</a></li>
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
						<!--                      <li><a href="facilityMonitoring.html">설비 모니터링</a></li> -->
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
			<ul>
				<li><a href="workOrder">작업지침서</a></li>
				<li><a href="workSafety">안전지침서</a></li>
				<li><a href="workQuality">품질검사</a></li>
				<li><a href="workReport">작업보고</a></li>
			</ul>
		</aside>
		<section>
			<article class="article-container">
				<div class="work-report-main">

					<div class="work-report-title">
						<div>
							<h3>품질검사 보고</h3>
						</div>
					</div>
					<div class="quality-history">
						<div class="quality-report">
							<div class="quality-report-history">
								<div class="quality-table">

									<div class="quality-table-title">
										<span>점검일시 </span> <input type="month" id="select_date"
											value="${ pagingDTO.select_date }">
									</div>
									<div class="quality-table-head">
										<div class="quality-table-cell">
											<p>No.</p>
										</div>
										<div class="quality-table-cell">
											<p>라인</p>
										</div>
										<div id="model-cell" class="quality-table-cell">
											<p>모델</p>
										</div>
										<div class="quality-table-cell">
											<p>양품 갯수</p>
										</div>
										<div class="quality-table-cell">
											<p>불량 갯수</p>
										</div>
										<div class="quality-table-cell">
											<p>품질검사 날짜</p>
										</div>
										<div class="quality-table-cell">
											<p>작업자</p>
										</div>
										<div id="quality-cell-info" class="quality-table-cell">
											<p>불량 내용</p>
										</div>
									</div>
									<c:forEach var="i" items="${ map.get('list') }">
										<c:if test="${ not empty map.get('list') }">
											<div id="entry-table" class="quality-table-row">
												<div class="quality-table-cell">
													<p>${ i.rnum }</p>
												</div>
												<div class="quality-table-cell">
													<p>${ i.linenum }</p>
												</div>
												<div class="quality-table-cell">
													<p>${ i.g_grade }</p>
												</div>
												<div class="quality-table-cell">
													<p>${ i.clear_num }</p>
												</div>
												<div class="quality-table-cell">
													<p>${ i.unclear_num }</p>
												</div>
												<div class="quality-table-cell">
													<p>${ i.end_time }</p>
												</div>
												<div class="quality-table-cell">
													<p>${ i.sname }</p>
												</div>
												<div class="quality-table-cell">
													<p>${ i.quality_detail }</p>
												</div>
											</div>
										</c:if>
										<c:if test="${ not not empty map.get('list') }">
											<div>없음</div>
										</c:if>
									</c:forEach>
								</div>
							</div>
						</div>
						<div>

							<c:if test="${ map.get('pagingDTO').sec_first != 1 }">
								    [ <a
									href="workReport?now_page=${ map.get('pagingDTO').sec_first - 1 }&select_date=${ map.get('pagingDTO').select_date }">이전</a> ]
								</c:if>
							<c:if test="${ map.get('pagingDTO').sec_first == 1 }">
								    [ 이전 ]
								</c:if>
							<c:forEach var="i" begin="${ map.get('pagingDTO').sec_first }"
								end="${ map.get('pagingDTO').sec_last }">
								<c:choose>
									<c:when test="${ i != map.get('pagingDTO').now_page }">
								            [ <a
											href="workReport?now_page=${ i }&select_date=${ map.get('pagingDTO').select_date }">${ i }</a> ]
								        </c:when>
									<c:otherwise>
								            [ <a
											href="workReport?now_page=${ i }&select_date=${ map.get('pagingDTO').select_date }"><strong>${ i }</strong></a> ]                
								        </c:otherwise>
								</c:choose>
							</c:forEach>

							<c:if
								test="${ map.get('pagingDTO').sec_last != map.get('pagingDTO').last_page }">
								    [ <a
									href="workReport?now_page=${ map.get('pagingDTO').sec_last + 1 }&select_date=${ map.get('pagingDTO').select_date }">다음</a> ]
								</c:if>
							<c:if
								test="${ map.get('pagingDTO').sec_last == map.get('pagingDTO').last_page }">
								    [ 다음 ]
								</c:if>

						</div>
						<div>


							<%-- ${ map.get('PagingDTO').page_num } --%>
						</div>

						<!-- 특이사항 팝업 -->
						<div id="report-popup" class="report-popup">
							<div class="report-popup-content">
								<span id="closeModalBtn" class="popup-close">&times;</span>
								<h2>특이사항</h2>
								<div class="report-detail"></div>
							</div>
						</div>

					</div>
			</article>
		</section>
	</div>
	<footer>ⓒ2024 J.company System</footer>
</div>
<script>
    let userRole = '<%=role%>
	';
</script>
<script src="${pageContext.request.contextPath}/js/workReport.js"></script>
</body>

</html>