<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<%@ page import="java.util.List"%>
<%@ page import="com.mes.project.jjh.dto.Fpm_DTO"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Management System</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/dom-to-image/2.6.0/dom-to-image.min.js"
	integrity="sha512-01CJ9/g7e8cUmY0DFTMcUw/ikS799FHiOA0eyHsUWfOetgbx/t6oV4otQ5zXKQyIrQGTHSmRVPIgrgLcZi/WMA=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<style>
@font-face {
	font-family: "SOYOMapleBoldTTF";
	src:
		url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2310@1.0/SOYOMapleBoldTTF.woff2")
		format("woff2");
	font-weight: 400;
	font-style: normal;
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

/* title */
#workerTitle {
	display: flex;
	width: 1000px;
	justify-content: space-between;
	padding: 5px;
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

#workerTitle h1 {
	width: 200px;
	color: #000;
}

.userBox {
	width: 63%;
	height: 95%;
	display: flex;
	flex-direction: column;
	justify-content: space-evenly;
	align-items: center;
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

.accountBox {
	height: 40%;
	width: 100%;
	display: flex;
	align-items: center;
	justify-content: center;
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

.workerGrade {
	margin-right: 3px;
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
	justify-content: space-evenly;
}

.menu-bar-content {
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
	min-height: 800px;
}

#left-nav {
	height: 100%;
	background: #666;
	color: #fff;
	box-sizing: border-box;
	padding-top: 20px;
}

#left-nav ul li {
	padding-bottom: 60px;
	cursor: pointer;
	list-style: none;
}

#left-nav ul li:hover {
	color: #888;
	transition: color 0.2s ease;
}

#left-nav a {
	height: 100%;
	background: #666;
	color: #fff;
	box-sizing: border-box;
	padding-top: 20px;
}

#left-nav ul li a {
	text-decoration: none;
	padding-bottom: 60px;
	cursor: pointer;
	list-style: none;
}

#left-nav ul li a:hover {
	color: #888;
	transition: color 0.2s ease;
}

/* 섹션 창을 조작하기바람 */
section {
	/* border: 1px solid blue; */
	display: flex;
	/* justify-content: center; */
	/* width: 80%; */
	/* overflow: auto; */
	/* background: #eee; */
	/* z-index: 50; */
	/* align-items: center; */
	/* min-height: 800px; */
	justify-content: center;
	width: 80%;
	background: #eee;
	z-index: 50;
	align-items: center;
	min-height: 800px;
	position: relative;
}

article {
	width: 100%;
	min-height: 100%;
	background: #eee;
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

/* .output_text table{
    
} */
#mainTitle a {
	text-decoration: none;
	color: #333;
}

table {
	border-radius: 10px;
	/* border-color: red; */
	font-size: 14px;
	width: 500px;
	height: 100px;
	padding: 0;
	/* border-collapse: collapse; */
}

tr, td {
	border-radius: 10px;
	/* border: 1px solid #ddd; */
	background-color: #eef;
	/* box-shadow: 0 3px 4px rgba(0, 0, 0, 0.116); */
}

/* 작업자 관리자 */
.admin, .worker {
	background-color: #3498DB;
	margin-top: 10px;
	margin-bottom: 10px;
	width: 80px;
	height: 40px;
	border-radius: 5px;
	cursor: pointer;
	color: #fff;
	border: 0;
}

.admin:hover, .worker:hover {
	background-color: rgb(0, 47, 255);
	transition: 0.2s;
}

/* 3css */
.management {
	width: 100%;
	height: 100%;
}

.managementIndex {
	margin-top: 30px;
	width: 100%;
	height: 50px;
	text-align: center;
	font-size: 30px;
	/*    border: 1px solid green; */
}

.managementManuBar {
	height: 150px;
	width: 100%;
	/*    border: 1px solid red; */
	display: flex;
	align-items: center;
	justify-content: space-evenly;
}

.managementManuBar div {
	width: 25%;
	height: 100px;
	border: 1px solid #ddd;
	border-radius: 8px;
	background: #fff;
	font-size: 20px;
	display: flex;
	justify-content: center;
	align-items: center;
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
	display: flex;
}

.managementManuBar div:hover {
	background: #95a5a6
}

/* 일별 생산표 */
.dayManagementBox {
	width: 100%;
	/*    height: 100%; */
	display: none;
}

.dayManagement {
	width: 100%;
	height: 100%;
	/*    border: 1px solid blue; */
	display: flex;
	flex-direction: column;
	align-items: center;
}

.dayManagementGraph {
	width: 90%;
	padding: 20px;
	border: 1px solid #ddd;
	background: #fff;
	border-radius: 8px;
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
	display: flex;
	flex-direction: column;
	align-items: center;
	margin-bottom: 20px;
}

.dayManagementGraph div {
	/*    width: 100%; */
	text-align: center;
}

.oneLineGraph, .twoLineGraph, .threeLineGraph, .fourLineGraph {
	display: flex;
	align-items: flex-end;
	justify-content: space-evenly;
}

.oneLine, .twoLine, .threeLine, .fourLine {
	/*    flex: 1; */
	display: flex;
	border: 1px solid #ddd;
	background: #fff; /* 그래프 백그라운드 */
	flex-direction: row;
	height: 200px;
	margin-top: 20px;
	width: 95%;
	margin-bottom: 20px;
}

.oneBox, .twoBox, .threeBox, .fourBox {
	flex: 1;
	height: 100%;
	display: flex;
	flex-direction: column;
}

.oneLineGraph, .twoLineGraph, .threeLineGraph, .fourLineGraph {
	border: 1px solid #ddd;
	height: 80%;
}

.oneLineGraph, .twoLineGraph, .threeLineGraph, .fourLineGraph {
	border: 1px solid #ddd;
	height: 80%;
}

.oneLineDay, .twoLineDay, .threeLineDay, .fourLineDay {
	border: 0;
	height: 20%;
	display: flex;
	justify-content: center;
	align-items: center;
}

}

/* 일별 생산표 끝 */

/* 월별 생산표 */
.monthManagementBox {
	width: 100%;
	height: 100%;
	display: none;
}

.monthManagement {
	width: 100%;
	height: 100%;
	display: flex;
	flex-direction: column;
	align-items: center;
}

.monthManagementGraph {
	width: 90%;
	padding: 20px;
	border: 1px solid #ddd;
	background: #fff;
	border-radius: 8px;
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
	display: flex;
	flex-direction: column;
	align-items: center;
	margin-bottom: 20px;
}

.oneLineMonthGraph, .twoLineMonthGraph, .threeLineMonthGraph,
	.fourLineMonthGraph {
	display: flex;
	align-items: flex-end;
	justify-content: space-evenly;
	align-items: flex-end;
}

.oneLineMonth, .twoLineMonth, .threeLineMonth, .fourLineMonth {
	display: flex;
	justify-content: center;
	align-items: center;
}

.oneLineMonthGraph, .twoLineMonthGraph, .threeLineMonthGraph,
	.fourLineMonthGraph {
	border: 1px solid #ddd;
	height: 80%;
}

.oneLineMonth, .twoLineMonth, .threeLineMonth, .fourLineMonth {
	border: 0;
	height: 20%;
}

/* 월별 생산표 끝 */

/* 판매량 */
.salsBox {
	width: 100%;
	/*    height: 100%; */
	/*    display: none; */
}

.entryRank, .mainRank, .perforRank {
	display: flex;
	border: 1px solid #ddd;
	background: #fff;
	flex-direction: row;
	height: 200px;
	margin-top: 20px;
	width: 95%;
	margin-bottom: 20px;
}

.entryRankMonthBox, .mainRankMonthBox, .perforRankMonthBox {
	flex: 1;
	height: 100%;
	display: flex;
	flex-direction: column;
	align-items: center;
}

.entryRankMonthGraph1, .mainRankMonthGraph1, .perforRankMonthGraph1 {
	border: 1px solid #ddd;
	width: 100%;
	height: 80%;
	display: flex;
	align-items: flex-end;
	justify-content: center;
}

.entryRankMonthGraph2, .mainRankMonthGraph2, .perforRankMonthGraph2 {
	height: 20%;
	width: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
	width: 100%;
}

.oneLineSalsGraph, .twoLineSalsGraph, .threeLineSalsGraph,
	.fourLineSalsGraph {
	border: 1px solid #ddd;
	height: 80%;
}

.oneSalsLineMonth, .twoSalsLineMonth, .threeSalsLineMonth,
	.fourSalsLineMonth {
	width: 100%;
	height: 20%;
	display: flex;
	justify-content: center;
	align-items: center;
}

.monthSals {
	width: 100%;
	/*    height: 100%; */
	display: flex;
	flex-direction: column;
	align-items: center;
}

.rankSals {
	width: 100%;
	/*    height: 900px; */
	display: flex;
	flex-direction: column;
	align-items: center;
}

.monthSalsGraph {
	width: 90%;
	/*    height: 100%; */
	padding: 20px;
	border: 1px solid #ddd;
	background: #fff;
	border-radius: 8px;
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
	display: flex;
	flex-direction: column;
	align-items: center;
	margin-bottom: 20px;
	padding: 20px;
}

.oneLineSalsGraph, .twoLineSalsGraph, .threeLineSalsGraph,
	.fourLineSalsGraph {
	display: flex;
	align-items: center;
	flex-direction: column-reverse;
	justify-content: flex-start;
}

.salsBoradBox {
	margin-top: 20px;
	width: 100%;
	/*    height: 60px; */
	/*    border: 1px solid red; */
}

.boradEntry, .boradMain, .boradPerfor {
	/*    border: 1px solid green; */
	width: 100%;
	height: 33%;
	display: flex;
	align-items: center;
}

.boradEntry div, .boradMain div, .boradPerfor div {
	margin-left: 10px;
}

/* 실적평가 */
.report {
	display: none;
	top: 300px;
	background: #ddd;
	border-radius: 5px;
	width: 87%;
	height: 650px;
	position: absolute;
	border-radius: 5px;
	border: 1px solid black;
	background: white;
}

.reportBox {
	width: 100%;
	height: 100%;
}

.reportBut {
	width: 100%;
	display: flex;
	flex-direction: row-reverse;
	margin-right: 40px;
}

.reportButBox {
	box-sizing: border-box;
	text-decoration: none;
	color: #fff;
	width: 150px;
	background-color: #0F52BA;
	font-size: 12px;
	display: flex;
	margin-left: 5px;
	justify-content: center;
	align-items: center;
	border: 0;
	border-radius: 5px;
	height: 50px;
	font-size: 18px;
	margin-bottom: 10px;
}

.reportButBox:hover {
	background-color: #00008B;
	transition: background-color 0.3s ease;
}

.reportTitleBox {
	width: 100%;
	height: 10%;
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 20px;
	border-bottom: 1px solid black;
}

.reportGraphBox {
	width: 100%;
	height: 80%;
	background: #eee;
	display: flex;
	justify-content: center;
	align-items: center;
}

.reportMainBox {
	height: 90%;
	width: 90%;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
}

.reportMain1 {
	width: 100%;
	height: 30%;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 20px;
}

.reportMain2 {
	width: 100%;
	height: 70%;
	display: flex;
	flex-direction: column;
	align-items: center;
}

.unitBox {
	width: 100% !important;
	height: 15% !important;
	border: 0 !important;
	display: flex !important;
	flex-direction: column;
	margin-bottom: 10px;
}

.hundredMillion {
	margin-left: 40px !important;
	border: 0 !important;
	width: 45% !important;
	height: 10px !important;
}

.hundredMillion div {
	height: 5px !important;
	font-size: 14px;
	border: 0 !important;
	display: flex !important;
	justify-content: flex-start !important;
}

.oneUnit {
	height: 5px !important;
	margin-left: 40px !important;
	width: 45% !important;
	border: 0 !important;
}

.oneUnit div {
	height: 5px !important;
	font-size: 14px;
	border: 0 !important;
	display: flex !important;
	justify-content: flex-start !important;
}

.reportMainBoxTop {
	width: 100%;
	height: 20%;
	display: flex;
	align-items: center;
	justify-content: space-evenly;
	align-items: center;
}

.reportMainBoxTop div {
	width: 20%;
	height: 50%;
	background: white;
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
	border-radius: 5px;
	background: white;
	display: flex;
	align-items: center;
	justify-content: center;
}

.reportMainBoxTop div:hover {
	background: #95a5a6;
}

.LastMonthBox {
	display: none;
	width: 100%;
	height: 80%;
	background: white;
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
	border-radius: 5px;
}

.LastMonth {
	width: 100%;
	height: 100%;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
}

.ThisMonthBox {
	/*    display: none; */
	width: 100%;
	height: 80%;
	background: white;
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
	border-radius: 5px;
}

.ThisMonth {
	width: 100%;
	height: 100%;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
}

.nextMonthBox {
	display: none;
	width: 100%;
	height: 80%;
	background: white;
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
	border-radius: 5px;
}

.qrScanBox {
	display: none;
	width: 100%;
	height: 80%;
	background: white;
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
	border-radius: 5px;
}

.qrScan {
	width: 100%;
	height: 100%;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
}

.nextMonth {
	width: 100%;
	height: 100%;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
}

.reportMain2 div {
	width: 90%;
	height: 15%;
	display: flex;
}

.reportMain2 div div {
	border: 1px solid #666;
	display: flex;
	align-items: center;
	justify-content: center;
	flex: 1;
	margin: 1px;
	border-radius: 5px;
	height: 35px;
}

.reportButtonBox {
	width: 100%;
	height: 10%;
	border-top: 1px solid black;
	display: flex;
	justify-content: center;
	align-items: center;
}

.reportButtton {
	width: 20%;
	height: 50%;
	border: 1px solid red;
	display: flex;
	justify-content: center;
	align-items: center;
	box-sizing: border-box;
	text-decoration: none;
	color: #fff;
	background-color: #555;
	font-size: 12px;
	display: flex;
	justify-content: center;
	align-items: center;
	border: 0;
	border-radius: 5px;
}

.reportButtton:hover {
	background-color: #000;
}
/*  실적평가 끝 */

/* 판매량끝  */

/* 3css 끝*/

/* 미디어테그 */
@media screen and (max-width: 430px) {
	#qrImgArea img {
		height: 180px !important;
		width: 180px !important;
	}
	#qrImgArea {
		justify-content: center;
		height: 100%;
	}
	.managementManuBar div {
		font-size: 15px;
	}
	.oneBox div, .twoBox div, .threeBox div, .fourBox div {
		font-size: 10px;
	}
	.wrap {
		width: 100%;
	}
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
	nav {
		width: 100%;
		position: absolute;
		top: 100%;
		/* header 높이에 맞게 조정 */
		left: 0;
		right: 0;
		background: #dde;
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
		min-height: 800px;
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
		display: flex;
		flex-direction: column;
		justify-content: start;
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
	section {
		width: 100%;
		display: flex;
		flex-direction: column;
		align-items: center;
	}

	/* 위는 미디어 공통 */
	/* 아래가 미디어 내 부분 */
	.Stock_Request_History {
		width: 95%;
	}
	.workerPic {
		width: 80px;
		height: 80px;
		border-radius: 50%;
	}

	/* title */
	#workerTitle {
		display: none;
		/*display: flex;
      width: 100%;
      justify-content: space-between;
      padding: 5px;*/
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
		width: 80%;
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
		width: 200px;
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
		justify-content: center;
		align-items: center;
		width: 93%;
		height: 40%;
	}
	#myPageLogo {
		display: none;
		border: 0;
		border-radius: 50%;
		width: 30%;
		height: 90%;
		margin-right: 3%;
		border: 0;
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
	.report {
		height: 450px;
	}
	.reportMain2 div div {
		height: 24px;
	}
	.reportMainBoxTop div {
		text-align: center;
		font-size: 10px;
		width: 29%;
	}
	.reportMain1 {
		font-size: 16px;
		height: 20%;
	}
	.reportMain2 {
		text-align: center;
		font-size: 10px;
	}
	.reportMain2 div {
		width: 100%;
	}
	.hundredMillion, .oneUnit {
		margin-left: 10px !important;
		width: 60% !important;
	}
	.hundredMillion div {
		width: 100% !important;
	}
	.unitBox div {
		text-align: center;
		font-size: 10px;
	}
}
</style>
</head>

<body>
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
				<!-- aside 영역내에 메뉴 추가 가능함 -->

				<div id="left-nav">
					<ul>
						<li><a href="ot">재고 현황</a></li>
						<li><a href="SS">재고 신청</a></li>
						<li><a href="fs">완제품 관리</a></li>
						<li><a href="rodi">재고 불량 신고</a></li>
					</ul>
				</div>

			</aside>
			<section>
				<article>
					<!-- <3차 시작> -->
					<div class="management">
						<div class="managementIndex">완제품 생산 지표</div>
						<div class="managementManuBar">
							<div class="dailyProduction">일별 생산표</div>
							<div class="monthlyProduction">월별 생산표</div>
							<div class="monthlySales">월별 판매량</div>
						</div>
						<!-- 일별 생산표 시작 -->
						<div class="dayManagementBox">
							<div class="dayManagement">
								<h1>일별 생산표</h1>
								<div class="dayManagementGraph">
									<div>1번라인</div>
									<div class="salsBoradBox">
										<div class="boradEntry">
											<div
												style="width: 50px; height: 10px; background-color: blue;"></div>
											<div style="width: 170px; text-align: right;">생산량 [기준 :
												100개]</div>
										</div>
										<div class="boradMain">
											<div
												style="width: 50px; height: 10px; background-color: red;"></div>
											<div style="width: 170px; text-align: right;">불량 [기준 :
												100개]</div>
										</div>
									</div>
									<div class="oneLine">
										<c:if test="${not empty list}">
											<c:forEach var="l" items="${list}">


												<div class="oneBox">
													<div class="oneLineGraph"
														title="생산량 : ${l.dayClear} 불량 : ${l.dayUnClear}">

														<div class="oneLineGraph1"
															style="width: 40%; height: ${l.dayClear}%; background-color: blue;"></div>
														<div class="oneLineGraph2"
															style="width: 40%; height: ${l.dayUnClear}%; background-color: red;"></div>
													</div>
													<div class="oneLineDay">${l.dayNum}</div>
												</div>
											</c:forEach>
										</c:if>

									</div>
									<div>2번라인</div>
									<div class="salsBoradBox">
										<div class="boradEntry">
											<div
												style="width: 50px; height: 10px; background-color: blue;"></div>
											<div style="width: 170px; text-align: right;">생산량 [기준 :
												100개]</div>
										</div>
										<div class="boradMain">
											<div
												style="width: 50px; height: 10px; background-color: red;"></div>
											<div style="width: 170px; text-align: right;">불량 [기준 :
												100개]</div>
										</div>
									</div>
									<div class="twoLine">
										<c:if test="${not empty list2}">
											<c:forEach var="l2" items="${list2}">
												<div class="twoBox">
													<div class="twoLineGraph"
														title="생산량 : ${l2.dayClear} 불량 : ${l2.dayUnClear}">
														<div class="twoLineGraph1"
															style="width: 40%; height: ${l2.dayClear}%; background-color: blue;"></div>
														<div class="twoLineGraph2"
															style="width: 40%; height: ${l2.dayUnClear}%; background-color: red;"></div>
													</div>
													<div class="twoLineDay">${l2.dayNum}</div>
												</div>
											</c:forEach>
										</c:if>

									</div>
									<div>3번라인</div>
									<div class="salsBoradBox">
										<div class="boradEntry">
											<div
												style="width: 50px; height: 10px; background-color: blue;"></div>
											<div style="width: 170px; text-align: right;">생산량 [기준 :
												100개]</div>
										</div>
										<div class="boradMain">
											<div
												style="width: 50px; height: 10px; background-color: red;"></div>
											<div style="width: 170px; text-align: right;">불량 [기준 :
												100개]</div>
										</div>
									</div>
									<div class="threeLine">
										<c:if test="${not empty list3}">
											<c:forEach var="l3" items="${list3}">
												<div class="threeBox">
													<div class="threeLineGraph"
														title="생산량 : ${l3.dayClear} 불량 : ${l3.dayUnClear}">
														<div class="threeLineGraph1"
															style="width: 40%; height: ${l3.dayClear}%; background-color: blue;"></div>
														<div class="threeLineGraph2"
															style="width: 40%; height: ${l3.dayUnClear}%; background-color: red;"></div>
													</div>
													<div class="threeLineDay">${l3.dayNum}</div>
												</div>
											</c:forEach>
										</c:if>
									</div>
									<div>4번라인</div>
									<div class="salsBoradBox">
										<div class="boradEntry">
											<div
												style="width: 50px; height: 10px; background-color: blue;"></div>
											<div style="width: 170px; text-align: right;">생산량 [기준 :
												100개]</div>
										</div>
										<div class="boradMain">
											<div
												style="width: 50px; height: 10px; background-color: red;"></div>
											<div style="width: 170px; text-align: right;">불량 [기준 :
												100개]</div>
										</div>
									</div>
									<div class="fourLine">
										<c:if test="${not empty list4}">
											<c:forEach var="l4" items="${list4}">
												<div class="fourBox">
													<div class="fourLineGraph"
														title="생산량 : ${l4.dayClear} 불량 : ${l4.dayUnClear}">
														<div class="fourLineGraph1"
															style="width: 40%; height: ${l4.dayClear}%; background-color: blue;"></div>
														<div class="fourLineGraph2"
															style="width: 40%; height: ${l4.dayUnClear}%; background-color: red;"></div>
													</div>
													<div class="fourLineDay">${l4.dayNum}</div>
												</div>
											</c:forEach>
										</c:if>
									</div>
								</div>
							</div>
						</div>
						<!-- 일별 생산표 끝 -->

						<!-- 월별별 생산표 시작 -->
						<div class="monthManagementBox" style="display: none">
							<div class="monthManagement">
								<h1>월별 생산표</h1>
								<div class="monthManagementGraph">
									<div>1번라인</div>
									<div class="salsBoradBox">
										<div class="boradEntry">
											<div
												style="width: 50px; height: 10px; background-color: blue;"></div>
											<div style="width: 170px; text-align: right;">생산량 [기준 :
												1000개]</div>
										</div>
										<div class="boradMain">
											<div
												style="width: 50px; height: 10px; background-color: red;"></div>
											<div style="width: 170px; text-align: right;">불량 [기준 :
												1000개]</div>
										</div>
									</div>
									<div class="oneLine">
										<c:if test="${not empty monthList1}">
											<c:forEach var="ml1" items="${monthList1}">
												<div class="oneBox">
													<div class="oneLineMonthGraph">
														<div class="oneLineMonthGraph1"
															style="width: 40%; background-color: blue;"></div>
														<input type="hidden" class="monthClear"
															value="${ml1.monthClear}">
														<div class="oneLineMonthGraph2"
															style="width: 40%; background-color: red;"></div>
														<input type="hidden" class="monthUnClear"
															value="${ml1.monthUnClear}">
													</div>
													<div class="oneLineMonth">${ml1.monthNum}</div>
												</div>
											</c:forEach>
										</c:if>
									</div>
									<div>2번라인</div>
									<div class="salsBoradBox">
										<div class="boradEntry">
											<div
												style="width: 50px; height: 10px; background-color: blue;"></div>
											<div style="width: 170px; text-align: right;">생산량 [기준 :
												1000개]</div>
										</div>
										<div class="boradMain">
											<div
												style="width: 50px; height: 10px; background-color: red;"></div>
											<div style="width: 170px; text-align: right;">불량 [기준 :
												1000개]</div>
										</div>
									</div>
									<div class="twoLine">

										<c:if test="${not empty monthList2}">
											<c:forEach var="ml2" items="${monthList2}">
												<div class="twoBox">
													<div class="twoLineMonthGraph">
														<div class="twoLineMonthGraph1"
															style="width: 40%; background-color: blue;"></div>
														<input type="hidden" class="twoLineMonthClear"
															value="${ml2.monthClear}">
														<div class="twoLineMonthGraph2"
															style="width: 40%; background-color: red;"></div>
														<input type="hidden" class="twoLineMonthUnClear"
															value="${ml2.monthUnClear}">
													</div>
													<div class="twoLineMonth">${ml2.monthNum}</div>
												</div>
											</c:forEach>
										</c:if>

									</div>
									<div>3번라인</div>
									<div class="salsBoradBox">
										<div class="boradEntry">
											<div
												style="width: 50px; height: 10px; background-color: blue;"></div>
											<div style="width: 170px; text-align: right;">생산량 [기준 :
												1000개]</div>
										</div>
										<div class="boradMain">
											<div
												style="width: 50px; height: 10px; background-color: red;"></div>
											<div style="width: 170px; text-align: right;">불량 [기준 :
												1000개]</div>
										</div>
									</div>
									<div class="threeLine">
										<c:if test="${not empty monthList3}">
											<c:forEach var="ml3" items="${monthList3}">
												<div class="threeBox">
													<div class="threeLineMonthGraph">
														<div class="threeLineMonthGraph1"
															style="width: 40%; background-color: blue;"></div>
														<input type="hidden" class="threeLineMonthClear"
															value="${ml3.monthClear}">
														<div class="threeLineMonthGraph2"
															style="width: 40%; background-color: red;"></div>
														<input type="hidden" class="threeLineMonthUnClear"
															value="${ml3.monthUnClear}">
													</div>
													<div class="threeLineMonth">${ml3.monthNum}</div>
												</div>
											</c:forEach>
										</c:if>
									</div>
									<div>4번라인</div>
									<div class="salsBoradBox">
										<div class="boradEntry">
											<div
												style="width: 50px; height: 10px; background-color: blue;"></div>
											<div style="width: 170px; text-align: right;">생산량 [기준 :
												1000개]</div>
										</div>
										<div class="boradMain">
											<div
												style="width: 50px; height: 10px; background-color: red;"></div>
											<div style="width: 170px; text-align: right;">불량 [기준 :
												1000개]</div>
										</div>
									</div>
									<div class="fourLine">
										<c:if test="${not empty monthList4}">
											<c:forEach var="ml4" items="${monthList4}">
												<div class="fourBox">
													<div class="fourLineMonthGraph">
														<div class="fourLineMonthGraph1"
															style="width: 40%; background-color: blue;"></div>
														<input type="hidden" class="fourLineMonthClear"
															value="${ml4.monthClear}">
														<div class="fourLineMonthGraph2"
															style="width: 40%; background-color: red;"></div>
														<input type="hidden" class="fourLineMonthUnClear"
															value="${ml4.monthUnClear}">
													</div>
													<div class="fourLineMonth">${ml4.monthNum}</div>
												</div>
											</c:forEach>
										</c:if>

									</div>
								</div>
							</div>
						</div>

						<!-- 월별별 생산표 끝 -->


						<!-- 월별 판매량 -->
						<div class="salsBox">

							<div class="rankSals">
								<h1>등급별 월 판매량</h1>
								<div class="reportBut">
									<div class="reportButBox">평가지표</div>
								</div>
								<div class="report">
									<div class="reportBox" id="reportBox">

										<div class="reportTitleBox">실적평가</div>
										<div class="reportGraphBox">
											<div class="reportMainBox">
												<div class="reportMainBoxTop">
													<div class="lastPerformance">지난달 실적</div>
													<div class="thisPerformance">이번달 실적</div>
													<div class="nextPerformance">다음달 예상 실적</div>
													<div class="qrPerformance">QR</div>
												</div>
												<div class="LastMonthBox">
													<div class="LastMonth">
														<div class="reportMain1">지난달 실적</div>
														<div class="reportMain2">
															<div class="unitBox">
																<div class="hundredMillion">
																	<div>목표판매랑, 실판매량</div>
																	<div>: 단위(억)</div>
																</div>
																<div class="oneUnit">
																	<div>목표수익, 실수익</div>
																	<div>: 단위(개)</div>
																</div>
															</div>
															<div class="reportMainTop">
																<div>등급</div>
																<div>목표수익</div>
																<div>실수익</div>
																<div>목표판매량</div>
																<div>실판매량</div>
																<div>달성률</div>
															</div>
															<div class="reportMainEntry">
																<div>엔트리</div>
																<div title="${totalEntryLastSalestarget*700000}">${telsti }</div>
																<div title="${totalEntryLastMonthSals *700000}">${telmsi }</div>
																<div>${totalEntryLastSalestarget}</div>
																<div>${totalEntryLastMonthSals }</div>
																<c:if test="${ enrtyPerformancePercent > 0}">
																	<div style="color: blue">${enrtyPerformancePercent }%</div>
																</c:if>
																<c:if test="${ enrtyPerformancePercent < 0}">
																	<div style="color: red">${enrtyPerformancePercent }%</div>
																</c:if>
																<c:if test="${ enrtyPerformancePercent == 0}">
																	<div>${enrtyPerformancePercent }%</div>
																</c:if>
															</div>
															<div class="reportMainMain">
																<div>메인스트림</div>
																<div title="${totalMainLastSalestarget*1200000}">${tmlsti }</div>
																<div title="${totalMainLastMonthSals *1200000}">${tmlmsi }</div>
																<div>${totalMainLastSalestarget}</div>
																<div>${totalMainLastMonthSals }</div>
																<c:if test="${ MainPerformancePercent > 0}">
																	<div style="color: blue">${MainPerformancePercent }%</div>
																</c:if>
																<c:if test="${ MainPerformancePercent < 0}">
																	<div style="color: red">${MainPerformancePercent }%</div>
																</c:if>
																<c:if test="${ MainPerformancePercent == 0}">
																	<div>${MainPerformancePercent }%</div>
																</c:if>
															</div>
															<div class="reportMainPerfor">
																<div>퍼포먼스</div>
																<div title="${totalPerforLastSalestarget *2000000}">${tplsti }</div>
																<div title="${totalPerforLastMonthSals *2000000}">${tplmsi }</div>
																<div>${totalPerforLastSalestarget }</div>
																<div>${totalPerforLastMonthSals }</div>
																<c:if test="${ PerforPerformancePercent > 0}">
																	<div style="color: blue">${PerforPerformancePercent }%</div>
																</c:if>
																<c:if test="${ PerforPerformancePercent < 0}">
																	<div style="color: red">${PerforPerformancePercent }%</div>
																</c:if>
																<c:if test="${ PerforPerformancePercent == 0}">
																	<div>${PerforPerformancePercent }%</div>
																</c:if>
															</div>
														</div>
													</div>
												</div>
												<div class="ThisMonthBox">
													<div class="ThisMonth">
														<div class="reportMain1">이번달 실적</div>
														<div class="reportMain2">
															<div class="unitBox">
																<div class="hundredMillion">
																	<div>목표판매랑, 실판매량</div>
																	<div>: 단위(억)</div>
																</div>
																<div class="oneUnit">
																	<div>목표수익, 실수익</div>
																	<div>: 단위(개)</div>
																</div>
															</div>
															<div class="reportMainTop">
																<div>등급</div>
																<div>목표수익</div>
																<div>실수익</div>
																<div>목표판매량</div>
																<div>실판매량</div>
																<div>달성률</div>
															</div>
															<div class="reportMainEntry">
																<div>엔트리</div>
																<div title="${totalEntryMonthSalestarget *700000}">${temsti }</div>
																<div title="${totalEntryMonthSals*700000}">${temsi }</div>
																<div>${totalEntryMonthSalestarget }</div>
																<div>${totalEntryMonthSals}</div>
																<c:if test="${ tepp > 0}">
																	<div style="color: blue">${tepp }%</div>
																</c:if>
																<c:if test="${ tepp < 0}">
																	<div style="color: red">${tepp }%</div>
																</c:if>
																<c:if test="${ tepp == 0}">
																	<div>${tepp }%</div>
																</c:if>
															</div>
															<div class="reportMainMain">
																<div>메인스트림</div>
																<div title="${totalMainMonthSalestarget *1200000}">${tmmsti }</div>
																<div title="${totalMainMonthSals*1200000}">${tmmsi }</div>
																<div>${totalMainMonthSalestarget }</div>
																<div>${totalMainMonthSals}</div>
																<c:if test="${ tmpp > 0}">
																	<div style="color: blue">${tmpp }%</div>
																</c:if>
																<c:if test="${ tmpp < 0}">
																	<div style="color: red">${tmpp }%</div>
																</c:if>
																<c:if test="${ tmpp == 0}">
																	<div>${tmpp }%</div>
																</c:if>
															</div>
															<div class="reportMainPerfor">
																<div>퍼포먼스</div>
																<div title="${totalPerforMonthSalestarget *2000000}">${tpmsti }</div>
																<div title="${totalPerforMonthSals *2000000}">${tpmsi }</div>
																<div>${totalPerforMonthSalestarget }</div>
																<div>${totalPerforMonthSals }</div>
																<c:if test="${ tppp > 0}">
																	<div style="color: blue">${tppp }%</div>
																</c:if>
																<c:if test="${ tppp < 0}">
																	<div style="color: red">${tppp }%</div>
																</c:if>
																<c:if test="${ tppp == 0}">
																	<div>${tppp }%</div>
																</c:if>
															</div>
														</div>
													</div>
												</div>
												<div class="nextMonthBox">
													<div class="nextMonth">
														<div class="reportMain1">다음달 예상 실적</div>
														<div class="reportMain2">
															<div class="unitBox">
																<div class="hundredMillion">
																	<div>목표판매랑, 실판매량</div>
																	<div>: 단위(억)</div>
																</div>
																<div class="oneUnit">
																	<div>목표수익, 실수익</div>
																	<div>: 단위(개)</div>
																</div>
															</div>
															<div class="reportMainTop">
																<div>등급</div>
																<div>목표수익</div>
																<div>실수익</div>
																<div>목표판매량</div>
																<div>실판매량</div>
																<div>달성률</div>
															</div>
															<div class="reportMainEntry">
																<div>엔트리</div>
																<div title="${entryPastThreeMonths*700000}">${eptmi}</div>
																<div>-</div>
																<div>${entryPastThreeMonths}</div>
																<div>-</div>
																<div>-</div>
															</div>
															<div class="reportMainMain">
																<div>메인스트림</div>
																<div title="${mainPastThreeMonths*1200000}">${mptmi}</div>
																<div>-</div>
																<div>${mainPastThreeMonths}</div>
																<div>-</div>
																<div>-</div>
															</div>
															<div class="reportMainPerfor">
																<div>퍼포먼스</div>
																<div title="${perforPastThreeMonths *2000000}">${pptmi}</div>
																<div>-</div>
																<div>${perforPastThreeMonths }</div>
																<div>-</div>
																<div>-</div>
															</div>
														</div>
													</div>
												</div>
												<div class="qrScanBox">
													<div class="qrScan">
														<div class="reportMain1" style="margin-top: 30px;">이번달
															실적 QR코드</div>
														<div class="reportMain2" style="height: 100%">
															<div id="qrImgArea"
																style="width: 100%; justify-content: center;"></div>
														</div>
													</div>

												</div>

											</div>

										</div>
										<div class="reportButtonBox">
											<div class="reportButtton">확인</div>
										</div>
									</div>
								</div>
								<div class="monthSalsGraph">
									<div>엔트리</div>

									<div class="entryRank">
										<div class="entryRankMonthBox">
											<div class="entryRankMonthGraph1">
												<div class="entryMonthGraph"
													style="width: 40%; background-color: green;"></div>
											</div>
											<div class="entryRankMonthGraph2">1</div>
										</div>
										<div class="entryRankMonthBox">
											<div class="entryRankMonthGraph1">
												<div class="entryMonthGraph"
													style="width: 40%; background-color: green;"></div>
											</div>
											<div class="entryRankMonthGraph2">2</div>
										</div>
										<div class="entryRankMonthBox">
											<div class="entryRankMonthGraph1">
												<div class="entryMonthGraph"
													style="width: 40%; background-color: green;"></div>
											</div>
											<div class="entryRankMonthGraph2">3</div>
										</div>
										<div class="entryRankMonthBox">
											<div class="entryRankMonthGraph1">
												<div class="entryMonthGraph"
													style="width: 40%; background-color: green;"></div>
											</div>
											<div class="entryRankMonthGraph2">4</div>
										</div>
										<div class="entryRankMonthBox">
											<div class="entryRankMonthGraph1">
												<div class="entryMonthGraph"
													style="width: 40%; background-color: green;"></div>
											</div>
											<div class="entryRankMonthGraph2">5</div>
										</div>
										<div class="entryRankMonthBox">
											<div class="entryRankMonthGraph1">
												<div class="entryMonthGraph"
													style="width: 40%; background-color: green;"></div>
											</div>
											<div class="entryRankMonthGraph2">6</div>
										</div>
										<div class="entryRankMonthBox">
											<div class="entryRankMonthGraph1">
												<div class="entryMonthGraph"
													style="width: 40%; background-color: green;"></div>
											</div>
											<div class="entryRankMonthGraph2">7</div>
										</div>
										<div class="entryRankMonthBox">
											<div class="entryRankMonthGraph1">
												<div class="entryMonthGraph"
													style="width: 40%; background-color: green;"></div>
											</div>
											<div class="entryRankMonthGraph2">8</div>
										</div>
										<div class="entryRankMonthBox">
											<div class="entryRankMonthGraph1">
												<div class="entryMonthGraph"
													style="width: 40%; background-color: green;"></div>
											</div>
											<div class="entryRankMonthGraph2">9</div>
										</div>
										<div class="entryRankMonthBox">
											<div class="entryRankMonthGraph1">
												<div class="entryMonthGraph"
													style="width: 40%; background-color: green;"></div>
											</div>
											<div class="entryRankMonthGraph2">10</div>
										</div>
										<div class="entryRankMonthBox">
											<div class="entryRankMonthGraph1">
												<div class="entryMonthGraph"
													style="width: 40%; background-color: green;"></div>
											</div>
											<div class="entryRankMonthGraph2">11</div>
										</div>
										<div class="entryRankMonthBox">
											<div class="entryRankMonthGraph1">
												<div class="entryMonthGraph"
													style="width: 40%; background-color: green;"></div>
											</div>
											<div class="entryRankMonthGraph2">12</div>
										</div>
									</div>

									<div>메인스트림</div>
									<div class="mainRank">
										<div class="mainRankMonthBox">
											<div class="mainRankMonthGraph1">
												<div class="mainMonthGraph"
													style="width: 40%; background-color: blue;"></div>
											</div>
											<div class="mainRankMonthGraph2">1</div>
										</div>
										<div class="mainRankMonthBox">
											<div class="mainRankMonthGraph1">
												<div class="mainMonthGraph"
													style="width: 40%; background-color: blue;"></div>
											</div>
											<div class="mainRankMonthGraph2">2</div>
										</div>
										<div class="mainRankMonthBox">
											<div class="mainRankMonthGraph1">
												<div class="mainMonthGraph"
													style="width: 40%; background-color: blue;"></div>
											</div>
											<div class="mainRankMonthGraph2">3</div>
										</div>
										<div class="mainRankMonthBox">
											<div class="mainRankMonthGraph1">
												<div class="mainMonthGraph"
													style="width: 40%; background-color: blue;"></div>
											</div>
											<div class="mainRankMonthGraph2">4</div>
										</div>
										<div class="mainRankMonthBox">
											<div class="mainRankMonthGraph1">
												<div class="mainMonthGraph"
													style="width: 40%; background-color: blue;"></div>
											</div>
											<div class="mainRankMonthGraph2">5</div>
										</div>
										<div class="mainRankMonthBox">
											<div class="mainRankMonthGraph1">
												<div class="mainMonthGraph"
													style="width: 40%; background-color: blue;"></div>
											</div>
											<div class="mainRankMonthGraph2">6</div>
										</div>
										<div class="mainRankMonthBox">
											<div class="mainRankMonthGraph1">
												<div class="mainMonthGraph"
													style="width: 40%; background-color: blue;"></div>
											</div>
											<div class="mainRankMonthGraph2">7</div>
										</div>
										<div class="mainRankMonthBox">
											<div class="mainRankMonthGraph1">
												<div class="mainMonthGraph"
													style="width: 40%; background-color: blue;"></div>
											</div>
											<div class="mainRankMonthGraph2">8</div>
										</div>
										<div class="mainRankMonthBox">
											<div class="mainRankMonthGraph1">
												<div class="mainMonthGraph"
													style="width: 40%; background-color: blue;"></div>
											</div>
											<div class="mainRankMonthGraph2">9</div>
										</div>
										<div class="mainRankMonthBox">
											<div class="mainRankMonthGraph1">
												<div class="mainMonthGraph"
													style="width: 40%; background-color: blue;"></div>
											</div>
											<div class="mainRankMonthGraph2">10</div>
										</div>
										<div class="mainRankMonthBox">
											<div class="mainRankMonthGraph1">
												<div class="mainMonthGraph"
													style="width: 40%; background-color: blue;"></div>
											</div>
											<div class="mainRankMonthGraph2">11</div>
										</div>
										<div class="mainRankMonthBox">
											<div class="mainRankMonthGraph1">
												<div class="mainMonthGraph"
													style="width: 40%; background-color: blue;"></div>
											</div>
											<div class="mainRankMonthGraph2">12</div>
										</div>

									</div>

									<div>퍼포먼스</div>
									<div class="perforRank">
										<div class="perforRankMonthBox">
											<div class="perforRankMonthGraph1">
												<div class="perforMonthGraph"
													style="width: 40%; background-color: pink;"></div>
											</div>
											<div class="perforRankMonthGraph2">1</div>
										</div>
										<div class="perforRankMonthBox">
											<div class="perforRankMonthGraph1">
												<div class="perforMonthGraph"
													style="width: 40%; background-color: pink;"></div>
											</div>
											<div class="perforRankMonthGraph2">2</div>
										</div>
										<div class="perforRankMonthBox">
											<div class="perforRankMonthGraph1">
												<div class="perforMonthGraph"
													style="width: 40%; background-color: pink;"></div>
											</div>
											<div class="perforRankMonthGraph2">3</div>
										</div>
										<div class="perforRankMonthBox">
											<div class="perforRankMonthGraph1">
												<div class="perforMonthGraph"
													style="width: 40%; background-color: pink;"></div>
											</div>
											<div class="perforRankMonthGraph2">4</div>
										</div>
										<div class="perforRankMonthBox">
											<div class="perforRankMonthGraph1">
												<div class="perforMonthGraph"
													style="width: 40%; background-color: pink;"></div>
											</div>
											<div class="perforRankMonthGraph2">5</div>
										</div>
										<div class="perforRankMonthBox">
											<div class="perforRankMonthGraph1">
												<div class="perforMonthGraph"
													style="width: 40%; background-color: pink;"></div>
											</div>
											<div class="perforRankMonthGraph2">6</div>
										</div>
										<div class="perforRankMonthBox">
											<div class="perforRankMonthGraph1">
												<div class="perforMonthGraph"
													style="width: 40%; background-color: pink;"></div>
											</div>
											<div class="perforRankMonthGraph2">7</div>
										</div>
										<div class="perforRankMonthBox">
											<div class="perforRankMonthGraph1">
												<div class="perforMonthGraph"
													style="width: 40%; background-color: pink;"></div>
											</div>
											<div class="perforRankMonthGraph2">8</div>
										</div>
										<div class="perforRankMonthBox">
											<div class="perforRankMonthGraph1">
												<div class="perforMonthGraph"
													style="width: 40%; background-color: pink;"></div>
											</div>
											<div class="perforRankMonthGraph2">9</div>
										</div>
										<div class="perforRankMonthBox">
											<div class="perforRankMonthGraph1">
												<div class="perforMonthGraph"
													style="width: 40%; background-color: pink;"></div>
											</div>
											<div class="perforRankMonthGraph2">10</div>
										</div>
										<div class="perforRankMonthBox">
											<div class="perforRankMonthGraph1">
												<div class="perforMonthGraph"
													style="width: 40%; background-color: pink;"></div>
											</div>
											<div class="perforRankMonthGraph2">11</div>
										</div>
										<div class="perforRankMonthBox">
											<div class="perforRankMonthGraph1">
												<div class="perforMonthGraph"
													style="width: 40%; background-color: pink;"></div>
											</div>
											<div class="perforRankMonthGraph2">12</div>
										</div>
									</div>
								</div>



								<div class="monthSals">
									<h1>라인별 월 판매량</h1>
									<div class="monthSalsGraph">
										<div>1번라인</div>
										<div class="salsBoradBox">
											<div class="boradEntry">
												<div
													style="width: 50px; height: 10px; background-color: green;"></div>
												<div style="width: 200px; text-align: right;">엔트리 [기준
													: 1000개]</div>
											</div>
											<div class="boradMain">
												<div
													style="width: 50px; height: 10px; background-color: blue;"></div>
												<div style="width: 200px; text-align: right;">메인스트림
													[기준 : 1000개]</div>
											</div>
											<div class="boradPerfor">
												<div
													style="width: 50px; height: 10px; background-color: pink;"></div>
												<div style="width: 200px; text-align: right;">퍼포먼스 [기준
													: 1000개]</div>
											</div>
										</div>

										<div class="oneLine">
											<c:if test="${not empty monthSalsList1}">
												<c:forEach var="msl1" items="${monthSalsList1}">
													<div class="oneBox">
														<div class="oneLineSalsGraph"
															title="엔트리 판매량 : ${msl1.entryMonthSals}, 메인스트림 판매량 : ${msl1.mainMonthSals}, 퍼포먼스 판매량 : ${msl1.perforMonthSals}">
															<div class="oneLineSalsGraph1"
																style="width: 40%; background-color: green;"></div>
															<input type="hidden" class="entryMonthSals"
																value="${msl1.entryMonthSals}">
															<div class="oneLineSalsGraph2"
																style="width: 40%; background-color: blue;"></div>
															<input type="hidden" class="mainMonthSals"
																value="${msl1.mainMonthSals}">
															<div class="oneLineSalsGraph3"
																style="width: 40%; background-color: pink;"></div>
															<input type="hidden" class="perforMonthSals"
																value="${msl1.perforMonthSals}">
														</div>
														<div class="oneSalsLineMonth">${msl1.monthNum}</div>
													</div>
												</c:forEach>
											</c:if>
										</div>

										<div>2번라인</div>
										<div class="salsBoradBox">
											<div class="boradEntry">
												<div
													style="width: 50px; height: 10px; background-color: green;"></div>
												<div style="width: 200px; text-align: right;">엔트리 [기준
													: 1000개]</div>
											</div>
											<div class="boradMain">
												<div
													style="width: 50px; height: 10px; background-color: blue;"></div>
												<div style="width: 200px; text-align: right;">메인스트림
													[기준 : 1000개]</div>
											</div>
											<div class="boradPerfor">
												<div
													style="width: 50px; height: 10px; background-color: pink;"></div>
												<div style="width: 200px; text-align: right;">퍼포먼스 [기준
													: 1000개]</div>
											</div>
										</div>
										<div class="twoLine">
											<c:if test="${not empty monthSalsList2}">
												<c:forEach var="msl2" items="${monthSalsList2}">
													<div class="twoBox">
														<div class="twoLineSalsGraph"
															title="엔트리 판매량 : ${msl2.entryMonthSals}, 메인스트림 판매량 : ${msl2.mainMonthSals}, 퍼포먼스 판매량 : ${msl2.perforMonthSals}">
															<div class="twoLineSalsGraph1"
																style="width: 40%; background-color: green;"></div>
															<input type="hidden" class="twoEntryMonthSals"
																value="${msl2.entryMonthSals}">
															<div class="twoLineSalsGraph2"
																style="width: 40%; background-color: blue;"></div>
															<input type="hidden" class="twoMainMonthSals"
																value="${msl2.mainMonthSals}">
															<div class="twoLineSalsGraph3"
																style="width: 40%; background-color: pink;"></div>
															<input type="hidden" class="twoPerforMonthSals"
																value="${msl2.perforMonthSals}">
														</div>
														<div class="twoSalsLineMonth">${msl2.monthNum}</div>
													</div>
												</c:forEach>
											</c:if>
										</div>

										<div>3번라인</div>
										<div class="salsBoradBox">
											<div class="boradEntry">
												<div
													style="width: 50px; height: 10px; background-color: green;"></div>
												<div style="width: 200px; text-align: right;">엔트리 [기준
													: 1000개]</div>
											</div>
											<div class="boradMain">
												<div
													style="width: 50px; height: 10px; background-color: blue;"></div>
												<div style="width: 200px; text-align: right;">메인스트림
													[기준 : 1000개]</div>
											</div>
											<div class="boradPerfor">
												<div
													style="width: 50px; height: 10px; background-color: pink;"></div>
												<div style="width: 200px; text-align: right;">퍼포먼스 [기준
													: 1000개]</div>
											</div>
										</div>
										<div class="threeLine">

											<c:if test="${not empty monthSalsList3}">
												<c:forEach var="msl3" items="${monthSalsList3}">
													<div class="threeBox">
														<div class="threeLineSalsGraph"
															title="엔트리 판매량 : ${msl3.entryMonthSals}, 메인스트림 판매량 : ${msl3.mainMonthSals}, 퍼포먼스 판매량 : ${msl3.perforMonthSals}">
															<div class="threeLineSalsGraph1"
																style="width: 40%; background-color: green;"></div>
															<input type="hidden" class="threeEntryMonthSals"
																value="${msl3.entryMonthSals}">
															<div class="threeLineSalsGraph2"
																style="width: 40%; background-color: blue;"></div>
															<input type="hidden" class="threeMainMonthSals"
																value="${msl3.mainMonthSals}">
															<div class="threeLineSalsGraph3"
																style="width: 40%; background-color: pink;"></div>
															<input type="hidden" class="threePerforMonthSals"
																value="${msl3.perforMonthSals}">
														</div>
														<div class="threeSalsLineMonth">${msl3.monthNum}</div>
													</div>
												</c:forEach>
											</c:if>

										</div>

										<div>4번라인</div>
										<div class="salsBoradBox">
											<div class="boradEntry">
												<div
													style="width: 50px; height: 10px; background-color: green;"></div>
												<div style="width: 200px; text-align: right;">엔트리 [기준
													: 1000개]</div>
											</div>
											<div class="boradMain">
												<div
													style="width: 50px; height: 10px; background-color: blue;"></div>
												<div style="width: 200px; text-align: right;">메인스트림
													[기준 : 1000개]</div>
											</div>
											<div class="boradPerfor">
												<div
													style="width: 50px; height: 10px; background-color: pink;"></div>
												<div style="width: 200px; text-align: right;">퍼포먼스 [기준
													: 1000개]</div>
											</div>
										</div>
										<div class="fourLine">
											<c:if test="${not empty monthSalsList4}">
												<c:forEach var="msl4" items="${monthSalsList4}">
													<div class="fourBox">
														<div class="fourLineSalsGraph"
															title="엔트리 판매량 : ${msl4.entryMonthSals}, 메인스트림 판매량 : ${msl4.mainMonthSals}, 퍼포먼스 판매량 : ${msl4.perforMonthSals}">
															<div class="fourLineSalsGraph1"
																style="width: 40%; background-color: green;"></div>
															<input type="hidden" class="fourEntryMonthSals"
																value="${msl4.entryMonthSals}">
															<div class="fourLineSalsGraph2"
																style="width: 40%; background-color: blue;"></div>
															<input type="hidden" class="fourMainMonthSals"
																value="${msl4.mainMonthSals}">
															<div class="fourLineSalsGraph3"
																style="width: 40%; background-color: pink;"></div>
															<input type="hidden" class="fourPerforMonthSals"
																value="${msl4.perforMonthSals}">
														</div>
														<div class="fourSalsLineMonth">${msl4.monthNum}</div>
													</div>
												</c:forEach>
											</c:if>
										</div>

									</div>
								</div>

							</div>

						</div>
						<!-- 월별 판매량 끝 -->
					</div>

					<!-- <3차 시작 끝> -->
				</article>
			</section>
		</div>
		<footer>ⓒ2024 J.company System</footer>
	</div>

	<script>
        // 완제품관리 JS
        
	// 3차 프로젝트
	
	// 월별판매량 > 평가지표 버튼 클릭 이벤트
	
	document.querySelector(".reportButBox").addEventListener("click", ()=>{
		document.querySelector(".report").style.display = "block";
	});
	document.querySelector(".reportButtton").addEventListener("click", ()=>{
		document.querySelector(".report").style.display = "none";
	});

	// 월별판매량 > 평가지표 버튼 클릭 이벤트

   
   document.querySelector(".lastPerformance").addEventListener("click", ()=>{
      document.querySelector(".LastMonthBox").style.display = "block";
      document.querySelector(".ThisMonthBox").style.display = "none";
      document.querySelector(".nextMonthBox").style.display = "none";
      document.querySelector(".qrScanBox").style.display = "none";
   });
   document.querySelector(".thisPerformance").addEventListener("click", ()=>{
      document.querySelector(".LastMonthBox").style.display = "none";
      document.querySelector(".ThisMonthBox").style.display = "block";
      document.querySelector(".nextMonthBox").style.display = "none";
      document.querySelector(".qrScanBox").style.display = "none";
   });
   document.querySelector(".nextPerformance").addEventListener("click", ()=>{
      document.querySelector(".LastMonthBox").style.display = "none";
      document.querySelector(".ThisMonthBox").style.display = "none";
      document.querySelector(".nextMonthBox").style.display = "block";
      document.querySelector(".qrScanBox").style.display = "none";
   });   
   document.querySelector(".qrPerformance").addEventListener("click", ()=>{
      document.querySelector(".LastMonthBox").style.display = "none";
      document.querySelector(".ThisMonthBox").style.display = "none";
      document.querySelector(".nextMonthBox").style.display = "none";
      document.querySelector(".qrScanBox").style.display = "block";
   });  
	// 생산표, 판매량 상단 버튼 클릭시 display 표시
	
	// 상단 버튼
	let dailyProduction = document.querySelector(".dailyProduction");
	let monthlyProduction = document.querySelector(".monthlyProduction");
	let monthlySales = document.querySelector(".monthlySales");

	
	
	// 표
	let dayManagementBox = document.querySelector(".dayManagementBox");
	let monthManagementBox = document.querySelector(".monthManagementBox");
	let salsBox = document.querySelector(".salsBox");
	
	// 클릭이벤트(일별생산표)
	dailyProduction.addEventListener("click", () =>{
		dayManagementBox.style.display = "block";
		monthManagementBox.style.display = "none";
		salsBox.style.display = "none";
	})
	// 클릭이벤트(월별생산표)
	monthlyProduction.addEventListener("click", () =>{
		dayManagementBox.style.display = "none";
		monthManagementBox.style.display = "block";
		salsBox.style.display = "none";
	})
	// 클릭이벤트(판매량)
	monthlySales.addEventListener("click", () => {
		dayManagementBox.style.display = "none";
		monthManagementBox.style.display = "none";
		salsBox.style.display = "block";
	})
	
	
	
	// 3차 프로젝트 월별 라인 생산량 % 계산식

	// 1번라인
	document.addEventListener("DOMContentLoaded", function() {
	    let monthClears = document.querySelectorAll(".monthClear");
	    let monthUnClears = document.querySelectorAll(".monthUnClear");
	    let oneLineMonthGraphs = document.querySelectorAll('.oneLineMonthGraph');
	    let oneLineGraphs1 = document.querySelectorAll('.oneLineMonthGraph1');
	    let oneLineGraphs2 = document.querySelectorAll('.oneLineMonthGraph2');
	if(monthClears != null){
	    for (let i = 0; i < monthClears.length; i++) {
	        let monthClear = parseFloat(monthClears[i].value) / 10;
	        let monthClear1 = parseFloat(monthClears[i].value);
	        oneLineGraphs1[i].style.height = monthClear + "%";
	        if(monthUnClears[i] != null){
	        let monthUnClear = parseFloat(monthUnClears[i].value) / 10;
	        let monthUnClear1 = parseFloat(monthUnClears[i].value);
	        oneLineGraphs2[i].style.height = monthUnClear + "%";
	        
	        oneLineMonthGraphs[i].setAttribute("title", "1번라인 "+ (i+1) +"월 생산량 : " + monthClear1 + ", 불량 : " + monthUnClear1);
	        }
	    }
	}
	});


	// 1번라인 끝
    // 2번라인    
    
   	document.addEventListener("DOMContentLoaded", function() {
	    let twoLineMonthClears = document.querySelectorAll(".twoLineMonthClear");
	    let twoLineMonthUnClears = document.querySelectorAll(".twoLineMonthUnClear");
	    let towLineMonthGraphs = document.querySelectorAll('.twoLineMonthGraph');
	    let twoLineMonthGraphs1 = document.querySelectorAll('.twoLineMonthGraph1');
	    let twoLineMonthGraphs2 = document.querySelectorAll('.twoLineMonthGraph2');
	if(twoLineMonthClears != null){
	    for (let i = 0; i < twoLineMonthClears.length; i++) {
	        let twoLineMonthClear = twoLineMonthClears[i].value / 10;
	        let twoLineMonthClear1 = twoLineMonthClears[i].value;
	        twoLineMonthGraphs1[i].style.height = twoLineMonthClear + "%";
	        if(twoLineMonthUnClears[i] != null){
	        let twoLineMonthUnClear = twoLineMonthUnClears[i].value / 10;
	        let twoLineMonthUnClear1 = twoLineMonthUnClears[i].value;
	        twoLineMonthGraphs2[i].style.height = twoLineMonthUnClear + "%";
	        
	        towLineMonthGraphs[i].setAttribute("title", "2번라인 "+ (i+1) +"월 생산량 : " + twoLineMonthClear1 + ", 불량 : " + twoLineMonthUnClear1);
	        }
	    }
	}
	});
    // 2번라인 끝   
    // 3번라인
    
   	document.addEventListener("DOMContentLoaded", function() {
	    let threeLineMonthClears = document.querySelectorAll(".threeLineMonthClear");
	    let threeLineMonthUnClears = document.querySelectorAll(".threeLineMonthUnClear");
	    let threeLineMonthGraphs = document.querySelectorAll('.threeLineMonthGraph');
	    let threeLineMonthGraphs1 = document.querySelectorAll('.threeLineMonthGraph1');
	    let threeLineMonthGraphs2 = document.querySelectorAll('.threeLineMonthGraph2');
	if(threeLineMonthClears != null){
	    for (let i = 0; i < threeLineMonthClears.length; i++) {
	        let threeLineMonthClear = threeLineMonthClears[i].value / 10;
	        let threeLineMonthClear1 = threeLineMonthClears[i].value;
	        threeLineMonthGraphs1[i].style.height = threeLineMonthClear + "%";
	        if(threeLineMonthUnClears[i] != null){
	        let threeLineMonthUnClear = threeLineMonthUnClears[i].value / 10;
	        let threeLineMonthUnClear1 = threeLineMonthUnClears[i].value;
	        threeLineMonthGraphs2[i].style.height = threeLineMonthUnClear + "%";
	        
	        threeLineMonthGraphs[i].setAttribute("title", "3번라인 "+ (i+1) +"월 생산량 : " + threeLineMonthClear1 + ", 불량 : " + threeLineMonthUnClear1);
	        }
	    }
	}
	});            
    
    // 3번라인 끝
    // 4번라인
    
   	document.addEventListener("DOMContentLoaded", function() {
	    let fourLineMonthClears = document.querySelectorAll(".fourLineMonthClear");
	    let fourLineMonthUnClears = document.querySelectorAll(".fourLineMonthUnClear");
	    let fourLineMonthGraphs = document.querySelectorAll('.fourLineMonthGraph');
	    let fourLineMonthGraphs1 = document.querySelectorAll('.fourLineMonthGraph1');
	    let fourLineMonthGraphs2 = document.querySelectorAll('.fourLineMonthGraph2');
	if(fourLineMonthClears != null){
	    for (let i = 0; i < fourLineMonthClears.length; i++) {
	        let fourLineMonthClear = fourLineMonthClears[i].value / 10;
	        let fourLineMonthClear1 = fourLineMonthClears[i].value;
	        fourLineMonthGraphs1[i].style.height = fourLineMonthClear + "%";
	        if(fourLineMonthUnClears[i] != null){
	        let fourLineMonthUnClear = fourLineMonthUnClears[i].value / 10;
	        let fourLineMonthUnClear1 = fourLineMonthUnClears[i].value;
	        fourLineMonthGraphs2[i].style.height = fourLineMonthUnClear + "%";
	        
	        
	        fourLineMonthGraphs[i].setAttribute("title", "4번라인 "+ (i+1) +"월 생산량 : " + fourLineMonthClear1 + ", 불량 : " + fourLineMonthUnClear1);
	        }
	    }
	}
	});            
    
    // 4번라인 끝

    // 3차 프로젝트 월별 라인 생산량 % 계산식 끝

    
    // 월별 생산표 1번라인 그래프
    
   	document.addEventListener("DOMContentLoaded", function() {
	    let entryMonthSalss = document.querySelectorAll(".entryMonthSals");
	    let mainMonthSalss = document.querySelectorAll(".mainMonthSals");
	    let perforMonthSalss = document.querySelectorAll(".perforMonthSals");
	    
	    let oneLineSalsGraphs1 = document.querySelectorAll('.oneLineSalsGraph1');
	    let oneLineSalsGraphs2 = document.querySelectorAll('.oneLineSalsGraph2');
	    let oneLineSalsGraphs3 = document.querySelectorAll('.oneLineSalsGraph3');

		if(entryMonthSalss != null){
		    for (let i = 0; i < entryMonthSalss.length; i++) {
		    	
		        let entryMonthSals = entryMonthSalss[i].value / 33.3;
		        oneLineSalsGraphs1[i].style.height = entryMonthSals + "%";
		       
		        let mainMonthSals = mainMonthSalss[i].value / 33.3;
		        oneLineSalsGraphs2[i].style.height = mainMonthSals + "%";
		 
		        let perforMonthSals = perforMonthSalss[i].value / 33.3;
		        oneLineSalsGraphs3[i].style.height = perforMonthSals + "%";
			}
		}  
	});
    
    // 월별 생산표 1번라인 그래프 끝
    
    // 월별 생산표 2번라인 그래프
    
   	document.addEventListener("DOMContentLoaded", function() {
	    let twoEntryMonthSalss = document.querySelectorAll(".twoEntryMonthSals");
	    let twoMainMonthSalss = document.querySelectorAll(".twoMainMonthSals");
	    let twoPerforMonthSalss = document.querySelectorAll(".twoPerforMonthSals");
	    
	    let twoLineSalsGraphs1 = document.querySelectorAll('.twoLineSalsGraph1');
	    let twoLineSalsGraphs2 = document.querySelectorAll('.twoLineSalsGraph2');
	    let twoLineSalsGraphs3 = document.querySelectorAll('.twoLineSalsGraph3');

		if(twoEntryMonthSalss != null){
		    for (let i = 0; i < twoEntryMonthSalss.length; i++) {
		    	
		        let twoEntryMonthSals = twoEntryMonthSalss[i].value / 33.3;
		        twoLineSalsGraphs1[i].style.height = twoEntryMonthSals + "%";
		       
		        let twoMainMonthSals = twoMainMonthSalss[i].value / 33.3;
		        twoLineSalsGraphs2[i].style.height = twoMainMonthSals + "%";
		 
		        let twoPerforMonthSals = twoPerforMonthSalss[i].value / 33.3;
		        twoLineSalsGraphs3[i].style.height = twoPerforMonthSals + "%";
			}
		}  
	});
    
    // 월별 생산표 2번라인 그래프 끝        
    
    // 월별 생산표 3번라인 그래프
    
   	document.addEventListener("DOMContentLoaded", function() {
	    let threeEntryMonthSalss = document.querySelectorAll(".threeEntryMonthSals");
	    let threeMainMonthSalss = document.querySelectorAll(".threeMainMonthSals");
	    let threePerforMonthSalss = document.querySelectorAll(".threePerforMonthSals");
	    
	    let threeLineSalsGraphs1 = document.querySelectorAll('.threeLineSalsGraph1');
	    let threeLineSalsGraphs2 = document.querySelectorAll('.threeLineSalsGraph2');
	    let threeLineSalsGraphs3 = document.querySelectorAll('.threeLineSalsGraph3');

		if(threeEntryMonthSalss != null){
		    for (let i = 0; i < threeEntryMonthSalss.length; i++) {
		    	
		        let threeEntryMonthSals = threeEntryMonthSalss[i].value / 33.3;
		        threeLineSalsGraphs1[i].style.height = threeEntryMonthSals + "%";
		       
		        let threeMainMonthSals = threeMainMonthSalss[i].value / 33.3;
		        threeLineSalsGraphs2[i].style.height = threeMainMonthSals + "%";
		 
		        let threePerforMonthSals = threePerforMonthSalss[i].value / 33.3;
		        threeLineSalsGraphs3[i].style.height = threePerforMonthSals + "%";
			}
		}  
	});
    
    // 월별 생산표 3번라인 그래프 끝   
    
	// 월별 생산표 4번라인 그래프
    
   	document.addEventListener("DOMContentLoaded", function() {
	    let fourEntryMonthSalss = document.querySelectorAll(".fourEntryMonthSals");
	    let fourMainMonthSalss = document.querySelectorAll(".fourMainMonthSals");
	    let fourPerforMonthSalss = document.querySelectorAll(".fourPerforMonthSals");
	    
	    let fourLineSalsGraphs1 = document.querySelectorAll('.fourLineSalsGraph1');
	    let fourLineSalsGraphs2 = document.querySelectorAll('.fourLineSalsGraph2');
	    let fourLineSalsGraphs3 = document.querySelectorAll('.fourLineSalsGraph3');

		if(fourEntryMonthSalss != null){
		    for (let i = 0; i < fourEntryMonthSalss.length; i++) {
		    	
		        let fourEntryMonthSals = fourEntryMonthSalss[i].value / 33.3;
		        fourLineSalsGraphs1[i].style.height = fourEntryMonthSals + "%";
		       
		        let fourMainMonthSals = fourMainMonthSalss[i].value / 33.3;
		        fourLineSalsGraphs2[i].style.height = fourMainMonthSals + "%";
		 
		        let fourPerforMonthSals = fourPerforMonthSalss[i].value / 33.3;
		        fourLineSalsGraphs3[i].style.height = fourPerforMonthSals + "%";
			}
		}  
	});
    
    // 월별 생산표 4번라인 그래프 끝  
    
    // 등급별 월 판매량
    // 등급별 월 엔트리 판매량
  	document.addEventListener("DOMContentLoaded", function() {
	    let entryMonthGraphs = document.querySelectorAll(".entryMonthGraph");
	   
	    let entryMonthSalss = document.querySelectorAll(".entryMonthSals");
	    let twoEntryMonthSalss = document.querySelectorAll(".twoEntryMonthSals");
	    let threeEntryMonthSalss = document.querySelectorAll(".threeEntryMonthSals");
	    let fourEntryMonthSalss = document.querySelectorAll(".fourEntryMonthSals");
    
	    for (let i = 0; i < entryMonthSalss.length; i++) {
	    	let entryMonthSals = entryMonthSalss[i].value
	    	let twoEntryMonthSals = twoEntryMonthSalss[i].value
	    	let threeEntryMonthSals = threeEntryMonthSalss[i].value
	    	let fourEntryMonthSals = fourEntryMonthSalss[i].value
	    	
	    	let entrySum = ((parseInt(entryMonthSals) + parseInt(twoEntryMonthSals) + parseInt(threeEntryMonthSals) + parseInt(fourEntryMonthSals))/4000)*100;
	    	let entrySum1 = parseInt(entryMonthSals) + parseInt(twoEntryMonthSals) + parseInt(threeEntryMonthSals) + parseInt(fourEntryMonthSals);
// 			console.log(entrySum1);
	    	entryMonthGraphs[i].style.height = entrySum+"%";
	    	entryMonthGraphs[i].setAttribute("title", "엔트리 등급 "+ (i+1) +"월 판매량 : " + entrySum1);
	    }
	});
    // 등급별 월 엔트리 판매량 끝
    
    // 등급별 월 메인 판매량
  	document.addEventListener("DOMContentLoaded", function() {
	    let mainMonthGraphs = document.querySelectorAll(".mainMonthGraph");
	    console.log(mainMonthGraphs.length);
	    let mainMonthSalss = document.querySelectorAll(".mainMonthSals");
	    let twoMainMonthSalss = document.querySelectorAll(".twoMainMonthSals");
	    let threeMainMonthSalss = document.querySelectorAll(".threeMainMonthSals");
	    let fourMainMonthSalss = document.querySelectorAll(".fourMainMonthSals");
	    for (let i = 0; i < mainMonthGraphs.length; i++) {
	    	let mainMonthSals = mainMonthSalss[i].value
	    	let twoMainMonthSals = twoMainMonthSalss[i].value
	    	let threeMainMonthSals = threeMainMonthSalss[i].value
	    	let fourMainMonthSals = fourMainMonthSalss[i].value
			console.log(mainMonthSals);
			console.log(twoMainMonthSals);
			console.log(threeMainMonthSals);
			console.log(fourMainMonthSals);
	    	
	    	let mainSum = ((parseInt(mainMonthSals) + parseInt(twoMainMonthSals) + parseInt(threeMainMonthSals) + parseInt(fourMainMonthSals))/4000)*100;
	    	let mainSum1 = parseInt(mainMonthSals) + parseInt(twoMainMonthSals) + parseInt(threeMainMonthSals) + parseInt(fourMainMonthSals);
// 			console.log(mainSum1);
			mainMonthGraphs[i].style.height = mainSum+"%";
			mainMonthGraphs[i].setAttribute("title", "메인 등급 "+ (i+1) +"월 판매량 : " + mainSum1);
	    }
	});
    // 등급별 월 퍼포먼스 판매량 끝    
    
      	document.addEventListener("DOMContentLoaded", function() {
	    let perforMonthGraphs = document.querySelectorAll(".perforMonthGraph");
	    console.log(perforMonthGraphs.length);
	    let perforMonthSalss = document.querySelectorAll(".perforMonthSals");
	    let twoPerforMonthSalss = document.querySelectorAll(".twoPerforMonthSals");
	    let threePerforMonthSalss = document.querySelectorAll(".threePerforMonthSals");
	    let fourPerforMonthSalss = document.querySelectorAll(".fourPerforMonthSals");
	    for (let i = 0; i < perforMonthGraphs.length; i++) {
	    	let perforMonthSals = perforMonthSalss[i].value
	    	let twoPerforMonthSals = twoPerforMonthSalss[i].value
	    	let threePerforMonthSals = threePerforMonthSalss[i].value
	    	let fourPerforMonthSals = fourPerforMonthSalss[i].value
			console.log(perforMonthSals);
			console.log(twoPerforMonthSals);
			console.log(threePerforMonthSals);
			console.log(fourPerforMonthSals);
	    	
	    	let perforSum = ((parseInt(perforMonthSals) + parseInt(twoPerforMonthSals) + parseInt(threePerforMonthSals) + parseInt(fourPerforMonthSals))/4000)*100;
	    	let perforSum1 = parseInt(perforMonthSals) + parseInt(twoPerforMonthSals) + parseInt(threePerforMonthSals) + parseInt(fourPerforMonthSals);
// 			console.log(mainSum1);
			perforMonthGraphs[i].style.height = perforSum+"%";
			perforMonthGraphs[i].setAttribute("title", "메인 등급 "+ (i+1) +"월 판매량 : " + perforSum1);
	    }
	});
    // 등급별 월 퍼포먼스 판매량 끝 
    
    
    
    // 등급별 월 판매량 끝
    
        
// 3차 프로젝트 끝


// 2차 프로젝트//
// let total = document.querySelectorAll(".cell_SPH");
// let startNum = total[4]; 
// let startNum2 = total[7]; 
// let startNum3 = total[10]; 
// let startNum4 = total[16]; 
// let startNum5 = total[19]; 
// let startNum6 = total[22]; 
// let startNum7 = total[28]; 
// let startNum8 = total[31]; 
// let startNum9 = total[34]; 


// let startbNum = total[5]; 
// let startbNum2 = total[8]; 
// let startbNum3 = total[11]; 
// let startbNum4 = total[17]; 
// let startbNum5 = total[20]; 
// let startbNum6 = total[23]; 
// let startbNum7 = total[29]; 
// let startbNum8 = total[32]; 
// let startbNum9 = total[35]; 




// // 양품 셋인터벌
// setInterval(function () {
// 	document.querySelector(".bar_dp").style.width = startNum.textContent + "%";
// 	if(parseInt(startNum.innerHTML) < 100) {
// 		startNum.innerHTML = parseInt(startNum.innerHTML) + 1;		
// 	} else {
// 	}
// 	document.querySelector(".bar_dm").style.width = startNum2.textContent + "%";
// 	if(parseInt(startNum2.innerHTML) < 100){
// 		startNum2.innerHTML = parseInt(startNum2.innerHTML) + 1;
// 	} else {
// 	}
// 	document.querySelector(".bar_de").style.width = startNum3.textContent + "%";
// 	if(parseInt(startNum3.innerHTML) < 100){
// 		startNum3.innerHTML = parseInt(startNum3.innerHTML) + 1;
// 	} else {
// 	}
// },10000);

// setInterval(function () {
// 	document.querySelector(".bar_wp").style.width = ((startNum4.textContent/500)*100) + "%";
// 	if(parseInt(startNum4.innerHTML) < 500) {
// 		startNum4.innerHTML = parseInt(startNum4.innerHTML) + 1;		
// 	} else {
// 	}
// 	document.querySelector(".bar_wm").style.width = ((startNum5.textContent/500)*100) + "%";
// 	if(parseInt(startNum5.innerHTML) < 500){
// 		startNum5.innerHTML = parseInt(startNum5.innerHTML) + 1;
// 	} else {
// 	}
// 	document.querySelector(".bar_we").style.width = ((startNum6.textContent/500)*100) + "%";
// 	if(parseInt(startNum6.innerHTML) < 500){
// 		startNum6.innerHTML = parseInt(startNum6.innerHTML) + 1;
// 	} else {
// 	}
// },10000);

// setInterval(function () {
// 	document.querySelector(".bar_mp").style.width = ((startNum7.textContent/2000)*100) + "%";
// 	if(parseInt(startNum7.innerHTML) < 2000) {
// 		startNum7.innerHTML = parseInt(startNum7.innerHTML) + 1;		
// 	} else {
// 	}
// 	document.querySelector(".bar_mm").style.width = ((startNum8.textContent/2000)*100) + "%";
// 	if(parseInt(startNum8.innerHTML) < 2000){
// 		startNum8.innerHTML = parseInt(startNum8.innerHTML) + 1;
// 	} else {
// 	}
// 	document.querySelector(".bar_me").style.width = ((startNum9.textContent/2000)*100) + "%";
// 	if(parseInt(startNum9.innerHTML) < 2000){
// 		startNum9.innerHTML = parseInt(startNum9.innerHTML) + 1;
// 	} else {
// 	}
// },10000);


// // 불량 셋인터벌


// if(parseInt(startbNum.innerHTML) == 0){
// 	document.querySelector(".bar_dpx").style.display ="none";
// 	} 
// if(parseInt(startbNum2.innerHTML) == 0){
// 	document.querySelector(".bar_dmx").style.display ="none";
// 	} 
// if(parseInt(startbNum3.innerHTML) == 0){
// 	document.querySelector(".bar_dex").style.display ="none";
// 	} 

// if(parseInt(startbNum4.innerHTML) == 0){
// 	document.querySelector(".bar_wpx").style.display ="none";
// 	} 
// if(parseInt(startbNum5.innerHTML) == 0){
// 	document.querySelector(".bar_wmx").style.display ="none";
// 	} 
// if(parseInt(startbNum6.innerHTML) == 0){
// 	document.querySelector(".bar_wex").style.display ="none";
// 	} 

// if(parseInt(startbNum7.innerHTML) == 0){
// 	document.querySelector(".bar_mpx").style.display ="none";
// 	} 
// if(parseInt(startbNum8.innerHTML) == 0){
// 	document.querySelector(".bar_mmx").style.display ="none";
// 	} 
// if(parseInt(startbNum9.innerHTML) == 0){
// 	document.querySelector(".bar_mex").style.display ="none";
// 	} 
	
	
	

// setInterval(function () {
// 	document.querySelector(".bar_dpx").style.width = startbNum.textContent + "%";
// 	if(parseInt(startbNum.innerHTML) < 100) {
// 	document.querySelector(".bar_dpx").style.display ="block";
// 		startbNum.innerHTML = parseInt(startbNum.innerHTML) + 1;		
// 	} else {
// 	}
	
	
// 	document.querySelector(".bar_dmx").style.width = startbNum2.textContent + "%";
// 	if(parseInt(startbNum2.innerHTML) < 100){
// 	document.querySelector(".bar_dmx").style.display ="block";
// 		startbNum2.innerHTML = parseInt(startbNum2.innerHTML) + 1;
// 	} else {
// 	}
// 	document.querySelector(".bar_dex").style.width = startbNum3.textContent + "%";
// 	if(parseInt(startbNum3.innerHTML) < 100){
// 	document.querySelector(".bar_dex").style.display ="block";
// 		startbNum3.innerHTML = parseInt(startbNum3.innerHTML) + 1;
// 	} else {
// 	}
// },10000);

// setInterval(function () {
// 	document.querySelector(".bar_wpx").style.width = ((startbNum4.textContent/500)*100) + "%";
// 	if(parseInt(startbNum4.innerHTML) < 500) {
// 	document.querySelector(".bar_wpx").style.display ="block";
// 		startbNum4.innerHTML = parseInt(startbNum4.innerHTML) + 1;		
// 	} else {
// 	}
// 	document.querySelector(".bar_wmx").style.width = ((startbNum5.textContent/500)*100) + "%";
// 	if(parseInt(startbNum5.innerHTML) < 500){
// 	document.querySelector(".bar_wmx").style.display ="block";
// 		startbNum5.innerHTML = parseInt(startbNum5.innerHTML) + 1;
// 	} else {
// 	}
// 	document.querySelector(".bar_wex").style.width = ((startbNum6.textContent/500)*100) + "%";
// 	if(parseInt(startbNum6.innerHTML) < 500){
// 	document.querySelector(".bar_wex").style.display ="block";
// 		startbNum6.innerHTML = parseInt(startbNum6.innerHTML) + 1;
// 	} else {
// 	}
// },10000);

// setInterval(function () {
// 	document.querySelector(".bar_mpx").style.width = ((startbNum7.textContent/2000)*100) + "%";
// 	if(parseInt(startbNum7.innerHTML) < 2000) {
// 	document.querySelector(".bar_mpx").style.display ="block";
// 		startbNum7.innerHTML = parseInt(startbNum7.innerHTML) + 1;		
// 	} else {
// 	}
// 	document.querySelector(".bar_mmx").style.width = ((startbNum8.textContent/2000)*100) + "%";
// 	if(parseInt(startbNum8.innerHTML) < 2000){
// 	document.querySelector(".bar_mmx").style.display ="block";
// 		startbNum8.innerHTML = parseInt(startbNum8.innerHTML) + 1;
// 	} else {
// 	}
// 	document.querySelector(".bar_mex").style.width = ((startbNum9.textContent/2000)*100) + "%";
// 	if(parseInt(startbNum9.innerHTML) < 2000){
// 	document.querySelector(".bar_mex").style.display ="block";
// 		startbNum9.innerHTML = parseInt(startbNum9.innerHTML) + 1;
// 	} else {
// 	}
// },10000);




// 2차 프로젝트끝//





        // 완제품관리 여기까지




        const hover = document.querySelectorAll('a.hover');
        const menuBar = document.querySelector('.menu-bar');
        const nav = document.querySelector('nav');
        const wrap = document.querySelector('.wrap');

        // 모바일 스크립트 코드
        const hamburgerMenu = document.querySelector('.hamburger-menu');
        const myPage = document.querySelector('#myPage');

        hamburgerMenu.addEventListener('click', function () {
            nav.classList.toggle('active');

            if (nav.classList.contains('active')) {
                nav.prepend(myPage);
                myPage.style.display = 'flex';
                myPage.style.padding = '5px 0';
                myPage.style.backgroundColor = '#dde';

                let sectionHeight = section.offsetHeight;
                nav.style.height = `${sectionHeight}px`;
            } else {
                workerTitle.appendChild(myPage);
                myPage.style.display = '';
                nav.style.height = '';
            }
        });

        const section = document.querySelector('section');
        section.addEventListener("click", function () {
            hideMenuBar();
        })

        // if() {
        // document.querySelector("#mainTitle1").style.display = "block";
        // } else {
   //     document.querySelector("#mainTitle2").style.display = "block";
        // }

        let isHovered = false;

        hover.forEach(button => {
            button.addEventListener('mouseover', () => {
                showMenuBar();
                isHovered = true;
            });
        });

        wrap.addEventListener("mouseleave", function () {
            if (!isHovered) {
                hideMenuBar();
            }
        });

        menuBar.addEventListener("mouseenter", function () {
            isHovered = true;
        });

        menuBar.addEventListener("mouseleave", function () {
            hideMenuBar();
        });

        function showMenuBar() {
            nav.classList.add('active');
        }

        function hideMenuBar() {
            nav.classList.remove('active');
        }

        hover.forEach(link => {
            link.addEventListener("click", function (event) {
                let myPage = document.querySelector("#myPage");
                // let myPageName = document.querySelector("#workerName");
                // let myPageLogo = document.querySelector("#myPageLogo");
                let menuBar = document.querySelector(".menu-bar");
                let mainPage = document.querySelector(".wrap");
                let companyLogo = document.querySelector("#workerLogo");

                let ulLi = document.querySelectorAll(".menu-bar-content ul li");


                event.preventDefault();
                if (nav.classList.contains('active') && window.matchMedia("(max-width: 430px)").matches) {
                    nav.style.height = `${section.offsetHeight}px`

                    // 네비4
                    // for (let i = 0; i < ulLi.length; i++) {
                    //     ulLi[i].style.padding = '10px';
                    //     ulLi[i].style.margin = '0px';
                    // }

                    // 네비5
                    for (let i = 0; i < ulLi.length; i++) {
                        ulLi[i].style.padding = '7px';

                    }
                    menuBar.prepend(myPage);
                }
            });
        });

        // 마이페이지
        document.querySelector("#workerName").addEventListener("click", () => {
            window.open("myPage.html", '_blank', 'width = 630, height = 470, top=100, left=100');
        });
        
        
        let reportButBox = document.querySelector(".reportButBox");
        let sendURL = "";

        function convertToImage() {
            return new Promise((resolve, reject) => {
                var element = document.getElementById("reportBox");
                console.log(element);
                domtoimage
                    .toPng(element)
                    .then(function (URL) {
                        var newImg = new Image();
                        newImg.src = URL;
                        sendURL = URL;
                        console.log(sendURL);
                        resolve(); // 이미지 생성이 완료되면 Promise를 resolve합니다.
                    })
                    .catch(reject); // 이미지 생성 중 오류가 발생하면 Promise를 reject합니다.
            });
        }

        reportButBox.addEventListener("click", () => {
            console.log("버튼클릭");
            convertToImage().then(() => {
                qr_send_Ajax(sendURL);
            }).catch(error => {
                console.error("이미지 생성 중 오류 발생:", error);
            });
        });

        function qr_send_Ajax(URL) {
            let qrText = document.querySelector("#qrText");

            let xhr = new XMLHttpRequest();
            xhr.open("post", "create", true);
            xhr.setRequestHeader("Content-Type", "application/json");

            let param = {
            	fileName : "qrImg",
                data : URL
            };
			console.log(param);
            xhr.send(JSON.stringify(param));

            xhr.onload = function () {
            	if (xhr.status === 200) {
	                let data = xhr.responseText;
	                console.log("qrAjax > data : ", data);
// 	                let rm = document.querySelectorAll(".reportMain1");
// 	                let rm2 = document.querySelector(".LastMonthBox");
// 	                let rm3 = document.querySelector(".ThisMonthBox");
// 	                for(let i=0; i<rm.length; i++) {
// 	                	rm[i].style.display = "none";
// 	                	rm2.style.display = "none";
// 	                	rm3.style.display = "none";
// 	                }
	                document.querySelector(".qrPerformance").addEventListener("click", ()=>{
		                document.querySelector("#qrImgArea").innerHTML = "<img src='http://124.58.88.184:8802/mes_project/fileDownload?fileName=AfterImg.png' width='300' height='300'>"
	                })
            	}
            };
        }


    </script>
</body>

</html>