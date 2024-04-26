<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Work Quality Page</title>

<style>
@font-face {
	font-family: "SOYOMapleBoldTTF";
	src:
		url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2310@1.0/SOYOMapleBoldTTF.woff2")
		format("woff2");
	font-weight: 400;
	font-style: normal;
}

select, input, textarea {
	font-family: "SOYOMapleBoldTTF";
}

#facility {
	margin-top: 5px;
	padding: 5px;
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

/* header 코드 끝 */
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
	min-height: 800px;
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
	min-height: 800px;
	background: #eee;
	z-index: 50;
	align-items: center;
}

#article-container {
	width: 100%;
}

#article-work-main {
	text-align: center;
}

#main-content {
	border: 1px solid #ddd;
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
	width: 95%;
	background-color: #fff;
	border-radius: 8px;
	display: flex;
	justify-content: center;
	margin: 0 auto;
	padding: 20px 0;
}

#work-checker {
	margin-left: 20px;
	/* box-shadow: 0 0 15px rgba(0, 0, 0, 0.1); */
	border-radius: 8px;
	width: 60%;
	text-align: center;
}

#work-checker-img {
	margin-top: 10%;
}

#work-checker-img img {
	width: 50%;
}

#work-checker-history {
	margin-top: 20%;
}

#work-checker-button {
	background: #333;
	color: #fff;
	border: 0;
	border-radius: 10px;
	width: 120px;
	height: 50px;
	cursor: pointer;
}

#work-checker-button:hover {
	background-color: #555;
	transition: 0.2s;
}

.work-check-list {
	margin: 0 auto;
	width: 80%;
	border: 1px solid #ddd;
	background-color: #eee;
	border-radius: 8px;
	font-size: 13px;
	padding: 15px;
}

.work-check-list-content {
	text-align: left;
	position: relative;
	margin-left: 8%;
	margin-bottom: 2%;
}

.work-check-list-content span {
	display: flex;
	justify-content: space-between;
}

#complete-button-div {
	text-align: center;
	margin-top: 5%;
	margin-bottom: 5%;
	/* display: none; */
}

#complete-button {
	background-color: #3498DB;
	margin-top: 10px;
	width: 80px;
	height: 40px;
	border-radius: 5px;
	cursor: pointer;
	color: #fff;
	border: 0;
}

#complete-button:hover {
	background-color: rgb(0, 47, 255);
	transition: 0.2s;
}

#send-button {
	background-color: #3498DB;
	margin-top: 10px;
	width: 80px;
	height: 40px;
	border-radius: 5px;
	cursor: pointer;
	color: #fff;
	border: 0;
}

#send-button:hover {
	background-color: rgb(0, 47, 255);
	transition: 0.2s;
}

/* 팝업 */
.popup {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.7);
}

.popup-content {
	background-color: white;
	margin: 15% auto;
	padding: 20px;
	width: 70%;
	border-radius: 5px;
	position: relative;
	margin-top: 4%;
}

.popup-close {
	position: absolute;
	top: 0;
	right: 0;
	padding: 10px;
	cursor: pointer;
}

.popup-title {
	text-align: center;
}

.quality-list {
	display: flex;
	justify-content: center;
}

.quality-list div {
	padding: 5%;
}

#quality-history {
	display: none;
}

/* 관리자 페이지 */
#work-quality {
	width: 80%;
	display: inline-block;
}

.work-check-list {
	position: relative;
}

.work-check-list h3 {
	text-align: center;
}

.work-check-list-content span {
	text-align: left;
	margin-left: 0%;
}

.delete-checkbox-div {
	position: absolute;
	top: 22px;
	right: 50px;
	display: block;
}

.error-checkbox-div {
	position: absolute;
	top: 0%;
	left: -8%;
	display: block;
}

.error-quantity {
	width: 10%;
	display: block;
}

.list-delete-button {
	margin: 0 10px;
	background-color: red;
	margin-top: 10px;
	width: 80px;
	height: 40px;
	border-radius: 5px;
	cursor: pointer;
	color: #fff;
	border: 0;
}

.list-delete-button:hover {
	background-color: rgb(190, 52, 52);
	transition: 0.2s;
}

#add-button-div {
	margin-top: 5%;
	margin-bottom: 5%;
	display: block;
}

.add-button {
	background-color: #3498DB;
	margin-top: 10px;
	width: 80px;
	height: 40px;
	border-radius: 5px;
	cursor: pointer;
	color: #fff;
	border: 0;
}

.add-button:hover {
	background-color: rgb(0, 47, 255);
	transition: 0.2s;
}

/* 품질불량 체크 수정 팝업 */
.add-popup {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.7);
}

.add-popup-content {
	background-color: white;
	margin: 15% auto;
	margin-top: 5%;
	padding: 20px;
	width: 50%;
	border-radius: 5px;
	position: relative;
	text-align: center;
}

.add-note {
	width: 95%;
	margin: 0 auto;
	text-align: left;
	display: inline-block;
	padding: 0;
}

.add-note p {
	padding: 0;
}

.img-note {
	width: 50%;
	display: inline-block;
}

.add-popup-content p {
	width: 50%;
	margin-bottom: 0;
}

.add-title {
	margin: 5px auto;
	width: 97%;
	border: 1px solid #aba7a7;
	padding: 8px;
	border-radius: 5px;
}

.add-detail {
	width: 97%;
	border: 1px solid #aba7a7;
	padding: 8px;
	border-radius: 10px;
	margin: 5px auto;
	height: 200px;
	resize: none;
}

.add-apply-div {
	width: 100%;
	margin-top: 3%;
}

.apply-button {
	background-color: #3498DB;
	margin-top: 10px;
	width: 80px;
	height: 40px;
	border-radius: 5px;
	cursor: pointer;
	color: #fff;
	border: 0;
}

.apply-button:hover {
	background-color: rgb(0, 47, 255);
	transition: 0.2s;
}

.cancel-button {
	margin: 0 10px;
	background-color: red;
	margin-top: 10px;
	width: 80px;
	height: 40px;
	border-radius: 5px;
	cursor: pointer;
	color: #fff;
	border: 0;
}

.cancel-button:hover {
	background-color: rgb(190, 52, 52);
	transition: 0.2s;
}

.retouch-popup {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.7);
}

.retouch-popup-content {
	background-color: white;
	margin: 15% auto;
	margin-top: 5%;
	padding: 20px;
	width: 50%;
	border-radius: 5px;
	position: relative;
	text-align: center;
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
	.workOrder h3 {
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
	article {
		height: 100%;
	}
	section div h2 {
		font-size: 20px;
	}
	.modal-content {
		width: 80%;
	}
	.workerGrade {
		display: inline;
	}
	.workOrder {
		font-size: 12px;
	}
	.work-ann h4 {
		font-size: 16px;
	}
	.work-ann {
		margin-left: -40%;
	}
	.work-list-zip {
		margin: auto;
		width: 90%;
	}
	.workImg img {
		width: 100px;
		height: 100px;
	}
	.add-popup-content {
		width: 75%;
		top: 7%;
	}
	#add-img, #fileName {
		width: 80%;
	}
	.addImgBox {
		width: 80%;
		height: 150px;
		justify-content: flex-start;
	}
	.file-button {
		width: 50%;
	}
	.img-preview {
		/* display: none; */
		width: 100px;
		height: 100px;
		margin: 0;
	}
	#file-button, .img-select-button {
		font-size: 10px;
		width: 60px;
		height: 30px;
		line-height: 30px;
		overflow: visible
	}
	.workerPic {
		width: 80px;
		height: 80px;
		border-radius: 50%;
	}
	.quality-order p {
		font-size: 12px;
	}
	.work-check-list-content span {
		margin-left: 5%;
	}
}
</style>

</head>

<body>
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
				src="${pageContext.request.contextPath}/images/logo.png"
				class="logo">
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
				<article id="article-container">
					<div id="article-work-main">
						<div id="work-main-title">
							<h2>품질불량 체크사항</h2>
						</div>

						<form method="post" action="workQuality/delete">

							<div id="main-content">
								<%
								if ("WORKER".equals(role)) {
								%>

								<div id="work-checker">
									<div id="work-checker-img">
										<img
											src="https://cdn.pixabay.com/photo/2016/08/31/11/54/icon-1633249_1280.png">
									</div>
									<div id="work-checker-info">
										<input type="hidden" id="workerId"
											value="${ workQualityDTO.staffno }">
										<div>${ workQualityDTO.sname }</div>
										<div>
											${ workQualityDTO.sphone }<br> ${ workQualityDTO.smail }
										</div>
									</div>
									<div id="work-checker-history">
										<button type="button" id="work-checker-button">품질검사
											지침서</button>
									</div>
									<div class="work-complete-facility">
										<select id="facility">
											<option>검사할 물품선택</option>
											<c:forEach var="i" items="${ facilityList }">
												<option value="${ i.procid }" data-type="${ i.pass }">
													${ i.linenum }라인 ${ i.g_grade }모델 ${ i.pass }개 ${ i.endtime }
												</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<%
								}
								%>
								<div id="work-quality">
									<c:forEach var="i" items="${ detailList }">
										<div class="work-check-list">
											<h3>
												${ i.w_title }
												<%
												if ("ADMIN".equals(role)) {
												%>
												<div class="delete-checkbox-div">
													<input type="checkbox" class="delete-checkbox"
														name="w_bord_seq" value="${ i.w_bord_seq }">
												</div>
												<%
												}
												%>
											</h3>
											<c:forEach var="j" items="${ fn:split(i.w_detail, '\\\\n') }">
												<div class="work-check-list-content">
													<span> ${ j }
														<div class="error-checkbox-div">
															<input type="hidden" value="${ j }">
															<%
															if ("WORKER".equals(role)) {
															%>
															<input type="checkbox" class="error-checkbox">
															<%
															}
															%>
														</div> <%
 if ("WORKER".equals(role)) {
 %> <input type="number" class="error-quantity"> <%
 }
 %>
													</span>
												</div>
											</c:forEach>
										</div>
									</c:forEach>
								</div>

							</div>
							<%
							if ("WORKER".equals(role)) {
							%>
							<div id="complete-button-div">
								<button type="button" id="send-button">전송</button>
								<!-- 	                            <button type="button" id="complete-button">완료</button> -->
							</div>
							<%
							}
							%>
							<%
							if ("ADMIN".equals(role)) {
							%>
							<div id="add-button-div">
								<button type="button" id="list-add-button" class="add-button">추가하기</button>
								<button type="button" id="list-retouch-button"
									class="add-button">수정하기</button>
								<input type="submit" id="list-delete" class="list-delete-button"
									value="삭제하기">
								<!-- 	                            <button type="button" id="user" class="add-button">유저</button> -->
							</div>
							<%
							}
							%>
						</form>
					</div>
					<!-- 품질검사 지침서 팝업 -->
					<div id="work-popup" class="popup">
						<div class="popup-content">
							<span id="close-popup-btn" class="popup-close">&times;</span>
							<div class="popup-title">
								<h3>품질검사 지침서</h3>
							</div>
							<div class="quality-list">
								<div class="quality-order">
									<p>
										<c:set var="guideSplit"
											value="${fn:split(guide.w_detail, '\\\\n')}" />
										<c:forEach var="i" items="${ guideSplit }" begin="0">
											${ i }<br>
										</c:forEach>
									</p>
								</div>
								<div class="workImg">
									<img
										src="https://image.spreadshirtmedia.net/image-server/v1/compositions/T996A1PA2179PT10X17Y18D172654919W7098H6789/views/1,width=550,height=550,appearanceId=1,backgroundColor=FFFFFF,noPt=true/pixel-art-fox-fox-podstawki.jpg"
										width="100px">
								</div>
							</div>
						</div>
					</div>

					<!-- 품질불량 체크사항 추가팝업 -->
					<form method="post" action="workQuality">
						<div id="quality-add-popup" class="add-popup">
							<div class="add-popup-content">
								<h2>품질불량 체크사항 추가하기</h2>
								<div class="add-note">
									<p>추가할 제목</p>
									<input type="text" id="add-title" class="add-title"
										name="w_title" placeholder="제목입력">
									<p>추가할 목록</p>
									<textarea id="add-detail" class="add-detail" name="w_detail"
										rows="5" cols="50" placeholder="목록입력시 한목록당 엔터 쳐주세요"></textarea>
								</div>
								<div class="add-apply-div">
									<input type="submit" id="add-apply-button" class="apply-button"
										value="적용하기">
									<button type="button" id="cancel-apply-button"
										class="cancel-button">취소하기</button>
								</div>
							</div>
						</div>
					</form>

					<!-- 품질불량 체크사항 수정팝업 -->
					<form method="post" action="workQuality/update">
						<div id="quality-retouch-popup" class="retouch-popup">
							<div class="retouch-popup-content">
								<h2>품질불량 체크사항 수정하기</h2>
								<div class="retouch-note">
									<p>수정할 제목</p>
									<input type="text" id="retouch-title" class="add-title"
										name="w_title" placeholder="제목입력">
									<p>수정할 목록</p>
									<textarea id="retouch-detail" class="add-detail"
										name="w_detail" rows="5" cols="50"
										placeholder="목록입력시 한목록당 엔터 쳐주세요"></textarea>
								</div>
								<div class="add-apply-div">
									<input type="submit" id="retouch-apply-button"
										class="apply-button" value="적용하기">
									<button type="button" id="retouch-cancel-apply-button"
										class="cancel-button">취소하기</button>
								</div>
							</div>
						</div>
					</form>


				</article>
			</section>
		</div>
		<footer>ⓒ2024 J.company System</footer>
	</div>
	<script src="${pageContext.request.contextPath}/js/workQuality.js"></script>
	<script>
	let role = '<%=role%>';
		console.log(role);
	<%-- 	<% --%>
		// 	   if ("ADMIN".equals(role)) {
		// 	%>
		// 	    addPopup();
		//    		retouchPopup();
	<%--    	<% --%>
		//    	   } else if ("WORKER".equals(role)) {
		//    	%>
		// 	   	qualityPopup(role);
		// 		sendError(role);
	<%-- 	<%  --%>
		// 	   }
		// 	%>
	</script>

</body>

</html>