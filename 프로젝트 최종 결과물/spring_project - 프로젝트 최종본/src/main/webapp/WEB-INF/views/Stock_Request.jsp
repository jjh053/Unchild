<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ page import="java.util.List"%>
<%@ page import="com.mes.project.jjh.dto.Sr_DTO"%>


<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Management System</title>
<style>
@font-face {
	font-family: "SOYOMapleBoldTTF";
	src:
		url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2310@1.0/SOYOMapleBoldTTF.woff2")
		format("woff2");
	font-weight: 400;
	font-style: normal;
}

button, input, textarea {
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

#mainTitle a {
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

#myPageLogo {
	border: 0;
	border-radius: 50%;
	width: 30%;
	height: 90%;
	margin-right: 3%;
	border-radius: 50%;
	width: 30%;
	height: 90%;
	width: 30%;
	height: 90%;
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

a {
	text-decoration: none;
}

#workerName a:hover {
	text-decoration: none;
	color: #888;
	transition: color 0.2s ease;
}

/* title end */
.wrap {
	width: 1000px;
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
	max-height: none;
	visibility: visible;
	opacity: 1;
	transition: max-height 0.5s ease, visibility 0s 0.5s, opacity 0.5s
		linear;
	transform: translateX(0%);
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
	justify-content: center;
	width: 80%;
	background: #eee;
	z-index: 50;
	align-items: center;
	/*min-height: 800px;*/
	position: relative;
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

/* 전체 div */
.stock_request_page {
	display: flex;
	flex-direction: column;
	align-items: center;
	/* border: 1px solid blue; */
	/* height: 800px; */
	/* margin-top: 20px; */
}

/* Stock_Request_box */

/* .Stock_Request_box {
            border: 1px solid red;
            width: 500px;
            height: 500px;
        } */

/*  재고신청 확인 */
.Stock_Request_confirm1 {
	/* position: relative;
            top: 120px;
            left: 730px; */
	font-size: 30px;
	line-height: 100px;
	/* border : 1px solid blue; */
}

.Stock_Request_confirm2 {
	/* position: relative;
            top: 120px;
            left: 730px; */
	font-size: 30px;
}

/*  */

/* 재고신청 내역*/
.Stock_Request_History {
	width: 700px;
	display: flex;
	justify-content: center;
}

.table_SPH {
	/* border : 1px solid red; */
	display: flex;
	/* flex 포지션이  column으로 잡혀있으니 꼭 확인하도록 */
	flex-direction: column;
	border-collapse: collapse;
	width: 700px;
	/* 표의 너비 조절 */
}

.row_SPH1 {
	display: flex;
	border-bottom: 2px solid #bbb;
	/* 아래 테두리 스타일 지정 */
}

.row_SPH {
	height: 45px;
	display: flex;
	border-bottom: 2px solid #bbb;
	/* 아래 테두리 스타일 지정 */
}

.row_SPH1 {
	border-top: 2px solid #ddd;
	background-color: #888888;
	/* 첫 번째 행의 위 테두리 스타일 지정 */
}

.row_SPH1 div input, .picO {
	margin-top: 13px;
	width: 50%;
}

.cell_SPH, .cell_SPH_D1, .cell_SPH_D2, .cell_SPH_D3 {
	flex: 1;
	/* 	padding: 8px; */
	text-align: center;
	border-right: 1px solid #bbb;
	display: flex;
	justify-content: center;
	align-items: center;
}

.cell_SPH4 {
	width: 9%;
	padding: 8px;
	text-align: center;
	border-right: 1px solid #bbb;
}

.cell_SPHC {
	border-left: 1px solid #bbb;
	border-right: 1px solid #bbb;
	width: 7%;
	text-align: center;
}

.cell_SPH_D4 {
	width: 9%;
	padding: 8px;
	text-align: center;
	border-right: 1px solid #bbb;
	display: flex;
	justify-content: center;
}

.cell_SPH:last-child {
	border-right: none;
	/* 마지막 셀에서 오른쪽 테두리 제거 */
}

.cell_SPH input, .cell_SPH_D1 input, .cell_SPH_D2 input, .cell_SPH_D3 input
	{
	border: none;
	text-align: center;
	background-color: #eee;
	width: 100px;
}

.reason {
	width: 95%;
	height: 80%;
	resize: none;
	outline: none;
	background-color: #eee;
	border: 0;
}
/*  */
/* 재고신청 내역*/
.Stock_Request {
	width: 700px;
	display: flex;
	justify-content: center;
}

/* .Stock_Request1{
            position: relative;
            left : -5px;;
            width: 700px;
            display: flex;
            justify-content: center;
        } */
.table_SR {
	/* border : 1px solid red; */
	display: flex;
	/* flex 포지션이  column으로 잡혀있으니 꼭 확인하도록 */
	flex-direction: column;
	border-collapse: collapse;
	width: 1000px;
	/* border: 1px solid red; */
	/* 표의 너비 조절 */
}

.row_SR, .row_SR1 {
	display: flex;
	border-bottom: 2px solid #ddd;
	/* 아래 테두리 스타일 지정 */
}

.row_SR:first-child, .row_sr1:first-child {
	border-top: 2px solid #ddd;
	/* background-color: #888888; */
	/* 첫 번째 행의 위 테두리 스타일 지정 */
}

/* 표시 */
/* .cell_SR{
            width : 10px !important; 
            border : 1px solid red;
        } */
.cell_SR {
	/* flex: 1; */
	padding: 8px;
	text-align: center;
	border-right: 1px solid #ddd;
	/* 오른쪽 테두리 스타일 지정 */
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
	/* 마지막 셀에서 오른쪽 테두리 제거 */
}

/* .cell_SR:nth-child(1) {
            width: 40%;
        }

        .cell_SR:nth-child(2) {
            width: 50%;
        }

        .cell_SR:nth-child(3) {
            width: 10%;
        } */
.cell_SR input {
	border: none;
	text-align: center;
	background-color: #eee;
	font-family: "SOYOMapleBoldTTF";
	/* width: 0px; */
}

.add {
	margin-left: auto;
	/* add를 오른쪽에 위치시킵니다. */
}

.submit, .cancel {
	display: inline-flex;
	/* 같은 행에 가로로 정렬하기 위해 */
	margin: 25px;
	/* submit과 cancel 사이의 간격을 조절합니다. */
}

/*  */

/* Modal */
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

.requestD {
	display: none;
	position: fixed;
	/*overflow-y: auto;*/
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	width: 50%;
	min-height: 50%;
	background-color: white;
	padding: 20px;
	border-radius: 5px;
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.5);
	z-index: 1001;
}

.new_D {
	height: 300px;
	overflow-y: auto;
}

.result {
	/* border: 1px solid red; */
	height: 30px;
	margin: auto;
	text-align: center;
	line-height: 70px;
	display: flex;
	justify-content: center;
	align-items: center;
}

.result1 {
	/* border: 1px solid red; */
	height: 30px;
	margin: auto;
	text-align: center;
	line-height: 70px;
	display: flex;
	justify-content: center;
	align-items: center;
}

.result1 input {
	background-color: #eef;
	width: 33%;
	border: 0px;
	text-align: center;
	margin-left: 5px;
	margin-right: 5px;
}

.requestList {
	height: 30px;
	margin: auto;
	text-align: center;
	display: flex;
	justify-content: center;
	align-items: center;
}

.requestList3 {
	background-color: #aaa;
	line-height: 30px;
	height: 100%;
	width: 16%;
	border: 0px;
	text-align: center;
}

.requestList1, .requestList2, .requestList4, .requestList5 {
	background-color: #aaa;
	line-height: 30px;
	height: 100%;
	width: 13%;
	border: 0px;
	text-align: center;
	margin-left: 5px;
	margin-right: 5px;
}

.listName {
	width: 300px;
	height: 30px;
	margin: auto;
	text-align: center;
	display: flex;
	justify-content: center;
	align-items: center;
}

.listName div {
	height: 90%;
	width: 35%;
	border: 0px;
	line-height: 30px;
	text-align: center;
	margin-left: 5px;
	margin-right: 5px;
	font-family: "SOYOMapleBoldTTF";
	background-color: #aaa;
	width: 35%;
	text-align: center;
}

.result input {
	background-color: #eef;
	width: 13%;
	border: 0px;
	text-align: center;
	margin-left: 5px;
	margin-right: 5px;
}

.company {
	width: 16%;
	text-align: center;
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

.orderingBox1 {
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
	width: 50%;
	height: 70%;
	display: none;
}

.orderingBox2 {
	width: 100%;
	height: 85%;
}

.Stock_page {
	/* border: 1px solid blue; */
	line-height: 100px;
	width: 210px;
	margin: auto;
	font-size: 30px;
	/* position: absolute; */
}

.ordering_page {
	/* border: 1px solid blue; */
	width: 210px;
	margin: auto;
	font-size: 30px;
	text-align: center;
	padding: 30px;
	/* position: absolute; */
}

.searchbox {
	/* margin-left: 10px; */
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

.ordering_searchbox {
	/* margin-left: 10px; */
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
	margin-bottom: 20px;
}

.searchbox input, .ordering_searchbox input {
	border: 1px solid #ccc;
	border-radius: 3px;
}

.glasses, .orderingGlasses {
	padding: 1px;
	height: 20px;
}

.search, .orderingSearch {
	padding-right: 20px;
}

.itemList {
	display: flex;
	flex-wrap: wrap;
	flex-direction: row;
	justify-content: center;
	align-items: center;
	flex-wrap: wrap;
	/*justify-content: space-between;
	align-content: space-evenly;*/
	height: 60%;
	/* border: 1px solid red; */
	width: 95%;
}

.orderingItemList {
	display: flex;
	flex-wrap: wrap;
	flex-direction: row;
	justify-content: center;
	align-items: center;
	align-content: flex-start;
	flex-wrap: wrap;
	/*justify-content: space-between;
	align-content: space-evenly;*/
	/* border: 1px solid red; */
	width: 100%;
	height: 85%;
	overflow-y: auto;
}

.item {
	width: 90%;
	height: 100%;
	display: flex;
	flex-direction: column;
	justify-content: start;
	overflow-y: auto;
}

.orderingItem {
	width: 90%;
	height: 70%;
	display: flex;
	flex-direction: column;
	justify-content: start;
	overflow-y: auto;
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

.choice {
	width: 100px;
	margin: auto;
	text-align: center;
}

.choice input {
	border: 1px solid #ddd;
	border-radius: 3px;
	background-color: #eef;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	width: 100px;
	margin-top: 10px;
	text-align: center;
}

.sample_img {
	/* border: 1px solid red; */
	width: 200px;
	height: 100%;
}

.itemName {
	/*	font-size: 30px;
	border: 0px;
	background-color: rgb(214, 214, 214);
	width: 98.5%;
	text-align: center; */
	
}

.button_RR {
	width: 300px;
	margin: auto;
	display: flex;
	justify-content: space-around;
}

.button_RR_D {
	width: 300px;
	margin: auto;
	display: flex;
	justify-content: space-around;
}

.button_ac, .ordering_bct {
	/* border: 1px solid red; */
	width: 300px;
	margin: auto;
	display: flex;
	justify-content: space-around;
}

/*  */

/* 버튼 스타일 */
.but_plus, .but_minus {
	width: 25px;
	cursor: pointer;
}

.count {
	width: 100px;
	/* border: 1px solid red; */
}

.item_name {
	width: 100px;
}

.add_Stock, .drop {
	/* margin-top: 10px; */
	width: 40px;
	height: 20px;
	border-radius: 5px;
	cursor: pointer;
	color: #fff;
	border: 0;
	background: #3498DB;
}

.pic {
	/* border : 1px solid red; 
	display: flex;
	flex-direction: row-reverse;
	align-items: flex-end;
	margin-right: 10px;
	height: 50%;*/
	
}

.pic1, .pics, .orderingPics, .orderingPic1 {
	width: 40px;
	height: 20px;
	border-radius: 5px;
	border-radius: 5px;
	cursor: pointer;
	color: #fff;
	border: 0;
	background: #3498DB;
}

.add_Stock_bar, #add_text, #cancel, .orderingConfirm, .orderingClose {
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

.add {
	margin-top: 70px;
	margin-right: 80px;
}

.add_Stock:hover, .drop:hover, .pic1:hover, .pic2:hover, .add_Stock_bar:hover,
	#add_text:hover, #cancel:hover, .order_rr:hover, .order_D:hover,
	.orderingConfirm:hover, .orderingClose:hover {
	background-color: rgb(0, 47, 255);
	transition: 0.2s;
}

/* 주문요청 버튼 */
.order_rr, .order_D {
	width: 100px;
	height: 30px;
	margin-top: 10px;
	border-radius: 5px;
	cursor: pointer;
	color: #fff;
	border: 0;
	background: #3498DB;
}

.cancel_rr, .cancel_D {
	background-color: red;
	width: 100px;
	height: 30px;
	margin-top: 10px;
	border-radius: 5px;
	cursor: pointer;
	color: #fff;
	border: 0;
}

.cancel_rr:hover, .cancel_D:hover {
	background-color: rgb(163, 6, 6);
	transition: 0.2s;
}

.orderingBox {
	width: 80%;
	display: flex;
	flex-direction: row-reverse;
}

.backbut {
	background-color: red;
	width: 50px;
	height: 25px;
	border-radius: 5px;
	cursor: pointer;
	color: #fff;
	border: 0;
	display: flex;
	justify-content: center;
}

.backbut a {
	color: white;
	line-height: 25px;
}

.backbut:hover {
	background-color: rgb(163, 6, 6);
	transition: 0.2s;
}

.ordering {
	width: 100px;
	height: 30px;
	border-radius: 5px;
	cursor: pointer;
	margin-bottom: 20px;
	color: #fff;
	border: 0;
	background: #3498DB;
	text-align: center;
	line-height: 30px;
	font-size: 13px;
}

.ordering:hover {
	background-color: rgb(0, 47, 255);
	transition: 0.2s;
}

/* 주문 요청 버튼 끝 */
.drop {
	/* margin: 0 10px; */
	background-color: red;
	/* margin-top: 10px; */
	width: 40px;
	height: 20px;
	border-radius: 5px;
	cursor: pointer;
	color: #fff;
	border: 0;
}

.drop:hover {
	background-color: rgb(163, 6, 6);
	transition: 0.2s;
}

.order1, .order2 {
	background: #333;
	color: #fff;
	border: 0;
	border-radius: 10px;
	width: 120px;
	height: 45px;
	cursor: pointer;
}

.order1:hover, .order2:hover {
	background-color: #555;
	transition: 0.2s;
}

.delete1 {
	background: #333;
	color: #fff;
	border: 0;
	border-radius: 10px;
	width: 40px;
	height: 20px;
	cursor: pointer;
}

.delete1 :hover {
	background-color: #555;
	transition: 0.2s;
}

.admin, .worker {
	background-color: #3498DB;
	margin-top: 10px;
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

.submit {
	width: 100%;
	/* border: 1px solid red; */
	display: flex;
	align-items: flex-end;
	justify-content: space-around;
}

/* 미디어테그 */
@media screen and (max-width: 430px) {
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
		justify-content: flex-start;
	}

	/* 위는 미디어 공통 */
	/* 아래가 미디어 내 부분 */
	.Stock_Request_History {
		width: 350px;
	}

	/* .table_SPH {}

            .table_SPH {}
            
            .row_SPH {}

            .cell_SPH {} */
	.Stock_Request {
		width: 390px;
	}
	.cell_SR:nth-child(1) {
		width: 30%;
	}
	.cell_SR:nth-child(2) {
		display: flex;
		width: 55%;
	}
	.row_SR1 .cell_SR:nth-child(3) {
		/* border: 1px solid red; */
		width: 9.3%;
	}
	.cell_SR {
		/* border: 1px solid red; */
		/* display: flex; */
		align-items: center;
		text-align: center;
	}
	.delete1 {
		width: 40px;
		height: 40px;
	}
	.add {
		margin-right: 30px;
		/* add를 오른쪽에 위치시킵니다. */
	}
	.add_img {
		width: 90%;
		height: 80%;
		/* border: 1px solid blue; */
		/* display:flex; */
	}
	.Stock_page {
		height: 80px;
		/* border: 1px solid red; */
	}
	/*	.item {
		width: 100%;
		height: 120px;
		display: flex;
		flex-direction: column;
		justify-content: center;
		margin-bottom: 10px;
	}*/
	.sample_img {
		width: 100px;
		height: 100px;
		margin-top: 10px;
	}
	/*.itemName, .orderringItemName {
		font-size: 10px;
		;
	}*/
	.table_SPH {
		/* border: 1px solid red; */
		display: flex;
		flex-direction: column;
		border-collapse: collapse;
		width: 100%;
	}
	.orderingBox1 {
		width: 90%;
	}
	.row_SPH1 div {
		font-size: 12px;
		width: 10%;
	}
	.row_SPH div {
		font-size: 12px;
		width: 10%;
	}
	.backbut {
		width: 100% !important;
	}
	.row_SPH div input.picO {
		width: 80%;
	}
	.reason {
		font-size: 10px;
	}
	.row_SPH div input {
		font-size: 12px;
		width: 100%;
		line-height: 25px;
	}
	.orderingItemInfor2 {
		font-size: 12px;
	}
	.submit {
		width: 80%;
	}
	.infor_box {
		/* border: 1px solid red; */
		width: 50%;
	}
	.itemList {
		display: flex;
		flex-direction: column;
		justify-content: flex-start;
		align-items: center;
		flex-wrap: wrap;
		height: 100%;
		width: 95%;
	}
	.item_name {
		/* border: 1px solid red; */
		margin-top: 10px;
	}
	.request_result {
		/* display: flex; */
		width: 80%;
		/* height: 40%; */
	}
	.result_box {
		width: 100%;
		height: 80%;
		display: flex;
		flex-direction: column;
		justify-content: space-around;
	}
	.workerPic {
		width: 80px;
		height: 80px;
		border-radius: 50%;
	}
	.but_pm {
		display: none;
	}
	.but_ad {
		/* border: 1px solid green; */
		width: 50px;
	}

	/* title */
	#workerTitle {
		display: none;
		/*
		display: flex;
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
		width: 100%;
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
	.requestD {
		width: 80%;
	}
	.requestList div {
		width: 20%;
		font-size: 9px;
	}
	.result input, .result select {
		width: 20%;
		font-size: 9px;
	}

	/* .new_RR {

            }*/
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
					<!-- 재고신청확인 -->

					<div class="stock_request_page">
						<%
						if ("ADMIN".equals(role)) {
						%>
						<div class="Stock_Request_confirm1">재고신청확인</div>


						<!-- 재고신청내역 -->
						<form method="get" action="SS">
							<div class="Stock_Request_History">
								<div class="table_SPH">
									<div class="row_SPH1">
										<div class="cell_SPHC">
											<input type="checkbox" class="picsO">
										</div>
										<div class="cell_SPH">재고신청내역</div>
										<div class="cell_SPH">요청수량</div>
										<div class="cell_SPH">신청자</div>
										<div class="cell_SPH">신청일</div>
										<div class="cell_SPH">반려사유</div>
										<div class="cell_SPH4"></div>

									</div>
									<c:if test="${not empty requestConfirmation}">
										<c:forEach var="l3" items="${requestConfirmation}">


											<div class="row_SPH">
												<div class="cell_SPHC">
													<input type="checkbox" class="picO">
												</div>
												<div class="cell_SPH_D1">
													<input type="text" name="rejectName" value="${l3.mesGrade}"
														READONLY> <input type="hidden" name="rejectMesId"
														class="rejectMesId" value="${l3.mesId}">
												</div>
												<div class="cell_SPH_D2">
													<input type="text" name="rejectCount"
														value="${l3.orderQuantity}" READONLY>
												</div>
												<div class="cell_SPH_D3">
													<input type="text" value="${l3.userInfo}" READONLY>
												</div>
												<div class="cell_SPH_D3">
													<input type="text"
														value="<fmt:formatDate value="${l3.orderData}" pattern="yyyy-MM-dd" />"
														READONLY>
												</div>
												<div class="cell_SPH_D3">
													<textarea name="rejectReason" class="reason"> </textarea>
												</div>
												<div class="cell_SPH_D4">
													<div class="backbut">
														<a href="sd?mesId=${l3.mesId}">반려</a>
														<!-- 만약 반려를 삭제가 아니게 하려면 주소에 다 적어주고 인설트문으로 바꿔주면 됨 -->
													</div>
												</div>
											</div>

										</c:forEach>
									</c:if>

								</div>
							</div>
						</form>
						<br> <br>
						<div class="orderingBox">
							<div class="ordering">업체 주문 내역</div>

						</div>

						<%
						}
						%>

						<%
						if ("WORKER".equals(role)) {
						%>
						<br>
						<!-- 재고신청 -->
						<div class="Stock_Request_confirm2">재고신청</div>
						<br>
						<div class="Stock_Request">
							<div class="table_SR">
								<div class="row_SR">

									<div class="cell_SR">재고명</div>
									<div class="cell_SR">수량</div>
									<div class="cell_SR"></div>
								</div>
								<div class="new_div">
									<div class="row_SR1">
										<!-- <div class="cell_SR">
											<input type="text" class="item_name" value="" readonly>
										</div>
										<div class="cell_SR">
											<input type="number" class="count" value="0"> <input
												type="button" value="+" onclick="plus(this)"> <input
												type="button" value="-" onclick="minus(this)">
											<button type="button" class="add_Stock">선택</button>
											선택기능을 추가기능으로 이 추가를 누르면 오라클에 있는 정보 가져오도록 지움 대신
											수정으로 
											<button type="button" class="drop">지움</button>
										</div>
										<div class="cell_SR">
											<button type="button" class="delete1">삭제</button>
										</div>
										<div class="cell_SR" style="width: 10%;"></div>
										-->
									</div>
								</div>
							</div>
						</div>
						<!-- <div class="ㄴㄴ">
                            <div class="delete">삭제</div>
                        </div> -->
						<div class="add">
							<input type="button" class="add_Stock_bar" value="추가">
						</div>

						<%
						}
						%>


						<br> <br> <br> <br>
						<div>
							<div class="submit">
								<%
								if ("ADMIN".equals(role)) {
								%>
								<button type="button" class="order1">업체 주문 요청</button>
								<%
								}
								%>

								<%
								if ("WORKER".equals(role)) {
								%>

								<button type="button" class="order2">관리자에게 요청</button>
								<%
								}
								%>
							</div>
							<!-- <input type="button" value="업체 주문 요청"> -->
							<!-- <button type="button" class="order">취소하기</button> -->
							<!-- <div class="cancel"> <input type="button" value="취소하기"></div> -->

						</div>
					</div>

					<!-- 팝업 -->
					<form method="get" action="SS">

						<div class="modal-overlay" id="modal-overlay"
							style="display: 
							
							<%String name = (String) request.getAttribute("gradeSerch");
if (name != null) {%> block<%} else {%> none <%}%> ;"></div>
						<div class="add_img" <%if (name != null) {%>
							style="display: inline-flex" <%}%>>
							<div class="Stock_page">품목선택 페이지</div>
							<div class="searchbox">
								<div class="search">품목검색</div>
								<div>
									<input type="text" name="mesGradeSerch" class="search_text"
										value="">
								</div>
								<div>
									<input type="submit" class="glasses" value="검색">
								</div>
							</div>
					</form>
					<br>
					<div class="itemList">
						<div class="item">
							<div class="itemInfor1">
								<div>
									<input type="checkbox" class="pics">
								</div>
								<div>품목</div>
								<div>양품 수량</div>
								<div>물품설명1</div>
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
										<div class="itemIndex1">${l2.mesContent}</div>
										<div class="itemMGLoc" style="display: none">${l2.GLoc}</div>
										<div class="itemBCount" style="display: none">
											${l2.BCount}</div>
										<div class="itemBLoc" style="display: none">${l2.BLoc}</div>

									</div>
								</c:forEach>
							</c:if>
						</div>
					</div>
					<div class="choice"></div>
					<br> <br>
					<div class="button_ac">
						<button type="button" id="add_text">추가하기</button>
						<button type="button" id="cancel">취소하기</button>
					</div>
		</div>


		<!-- 팝업2 -->
		<form method="get" class="si" action="si">
			<div class="modal-overlay" id="modal-overlay" style="display: none;"></div>

			<div class="request_result" id="request_result"
				style="display: none;">
				<h1 style="text-align: center;">주문 요청 리스트</h1>
				<div class="listName">
					<div>품목</div>
					:
					<div>수량</div>
				</div>
				<div class="new_RR"></div>
				<div class="button_RR">
					<button type="submit" class="order_rr">주문하기</button>
					<button type="button" class="cancel_rr">취소하기</button>
				</div>
			</div>
		</form>

		<form method="get" class="sd" action="sid">
			<div class="requestD" id="requestD" style="display: none;">
				<h1 style="text-align: center;">업체 요청 리스트</h1>
				<div class="requestList">
					<div class="requestList1">품목</div>
					<div class="requestList2">수량</div>
					<div class="requestList3">업체</div>
					<div class="requestList4">업체번호</div>
					<div class="requestList5">업체연락처</div>

				</div>
				<div class="new_D"></div>
				<div class="button_RR_D">
					<button type="submit" class="order_D">주문하기</button>
					<button type="button" class="cancel_D">취소하기</button>
				</div>
			</div>
		</form>


		<!-- 재고 신청 내역 -->
		<form method="get" action="SS">
			<div class="modal-overlay" id="modal-overlay"
				style="display: 
			<%
			String orderingName = (String) request.getAttribute("orderingName");
			if (orderingName != null) {%>
				block
			<%} else {%>
			none
			<%}%>
			;">
			</div>
			<div class="orderingBox1" <%if (orderingName != null) {%>
				style="display: inline-flex" <%}%>>



				<div class="orderingBox2">
					<div class="ordering_page">업체주문내역</div>
					<div class="ordering_searchbox">
						<div class="orderingSearch">품목검색</div>
						<div>
							<input type="text" name="orderingName"
								class="orderingsearch_text" value="">

						</div>
						<div>
							<input type="submit" class="orderingGlasses" value="검색">

						</div>
					</div>

					<div class="orderingItemList">
						<div class="orderingItem">
							<div class="orderingItemInfor1">

								<div>신청번호</div>
								<div>품목</div>
								<div>주문수량</div>
								<div>업체번호</div>
								<div>주문요청일</div>
								<div>주문현황</div>
							</div>
							<c:if test="${not empty orderHistory}">
								<c:forEach var="l4" items="${orderHistory}">
									<div class="orderingItemInfor2">
										<div class="orderringItemName">${l4.orderNumber}</div>
										<div class="orderringItemIndex1">${l4.mesGrade}</div>
										<div class="orderringItemIndex2">${l4.orderQuantity}</div>
										<div class="orderringItemIndex3">${l4.co_Number}</div>
										<div class="orderringItemIndex3">
											<fmt:formatDate value="${l4.adminOrderData}"
												pattern="yyyy-MM-dd" />
										</div>
										<div class="orderringItemIndex4">${l4.orderStatus}</div>
									</div>
								</c:forEach>
							</c:if>
						</div>
					</div>
				</div>
				<div class="choice"></div>
				<br> <br>
				<div class="ordering_bct">
					<!--  	<button type="button" class="orderingConfirm">확인</button> -->
					<button type="button" class="orderingClose">닫기</button>
				</div>
			</div>
		</form>

		</article>
		</section>
	</div>
	<footer>ⓒ2024 J.company System</footer>
	</div>

	<script>

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

    hover.forEach(link => {
        link.addEventListener("click", function (event) {
            event.preventDefault();
            if (nav.classList.contains('active') && window.matchMedia("(max-width: 430px)").matches) {
                nav.style.height = `${section.offsetHeight}px`
            }
        });
    });


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

    section.addEventListener("click", function () {
        hideMenuBar();
    })

    function showMenuBar() {
        nav.classList.add('active');
    }

    function hideMenuBar() {
        nav.classList.remove('active');
    }

    hover.forEach(link => {
        link.addEventListener("click", function (event) {
            let myPage = document.querySelector("#myPage");
            let menuBar = document.querySelector(".menu-bar");
            let mainPage = document.querySelector(".wrap");
            let companyLogo = document.querySelector("#workerLogo");

            let ulLi = document.querySelectorAll(".menu-bar-content ul li");


            event.preventDefault();
            if (nav.classList.contains('active') && window.matchMedia("(max-width: 430px)").matches) {
                nav.style.height = `${section.offsetHeight}px`


                // 네비5
                for (let i = 0; i < ulLi.length; i++) {
                    ulLi[i].style.padding = '7px';

                }
                menuBar.prepend(myPage);
            }
        });
    });

        
        // 2차 프로젝트 추가
        
//        document.querySelector(".drop").addEventListener("click", function(){
//                let item_name = document.querySelector(".item_name");
//                let count = document.querySelector(".count");
//                item_name.value = "";
//                count.value = "";
//            });
        
		// 품목선택 페이지 체크박스        
        
        let pics = document.querySelector(".pics");
   		let pic1 = document.querySelectorAll(".pic1"); 
		pics.addEventListener("click", function(){
   			for(let i = 0; i < pic1.length; i++){ 
      		pic1[i].checked = pics.checked; 
  			}
		});
		
        // 재고신청확인 체크박스
							<%if ("ADMIN".equals(role)) {%>
        
		let picsO = document.querySelector(".picsO");
		let picO = document.querySelectorAll(".picO");
		picsO.addEventListener("click", function(){
			for(let i = 0; i < picO.length; i++){
				picO[i].checked = picsO.checked;
			}
		});


		
		document.querySelector(".order1").addEventListener("click", function(){
			   document.querySelector(".requestD").style.display = "block";
			   document.getElementById('modal-overlay').style.display = "block";
		
		              document.querySelector('.new_D').innerHTML = ""
			  let row_SPH = document.querySelectorAll(".row_SPH");
			  row_SPH.forEach(function(event){
				  
				  let checkbox = event.querySelector(".picO");
				  if(checkbox.checked){
					  let D1 = event.querySelector(".cell_SPH_D1 input").value;
					  let D2 = event.querySelector(".cell_SPH_D2 input").value;
					  let rejectMesId = event.querySelector(".rejectMesId").value;
					 // console.log(D1);
					 // console.log(D2);
					  
					  let newRR = document.createElement('div');
	                    newRR.className = 'result';
	                    newRR.innerHTML = `
	                <input type="text" class="RRN" name = "mesGrade" value="\${D1}" readonly> 
	                <input type="text" class="RRC" name = "orderQuantity" value="\${D2}" readonly>
	                <input type="hidden" name = "mesId" value="\${rejectMesId}">
	                <select name="company" class = "company">
	                <option value=""> 업체 선택 </option>
	                <option value="테크윅스">테크윅스</option>
	                <option value="메인스타">메인스타</option>
	                <option value="쿨텍">쿨텍</option>
	            	</select>
	                <input type="text" class="comNum1" name = "co_Number" value="" readonly>
	                <input type="text" class="comNum2" name = "comNum2" value="" readonly>
	                
	                
	                
	                `;
	                    document.querySelector('.new_D').appendChild(newRR);
	                
	                    
	                    
	                    
	                let  arr = document.querySelectorAll(".company");
	                for(let i = 0; i < arr.length; i++){
		    		arr[i].addEventListener("change", function(){
   				 	if(this.value == "메인스타"){
    				this.parentElement.querySelector(".comNum1").value = "9007";
    				this.parentElement.querySelector(".comNum2").value = "010-****-2024";
   				 	}else if(this.value == "테크윅스"){
    				this.parentElement.querySelector(".comNum1").value = "9006";
    				this.parentElement.querySelector(".comNum2").value = "010-****-2024";
   				 	}else if(this.value == "쿨텍"){
    				this.parentElement.querySelector(".comNum1").value = "9008";
    				this.parentElement.querySelector(".comNum2").value = "010-****-2024";
   				 	}
		    		
			});
	                    
				  }
			  }
			  });});

		<%}%>
		
		
		   

		
		
		
        
		document.querySelector("#add_text").addEventListener("click", function(){
			   document.querySelector(".add_img").style.display = "none";
			   document.getElementById('modal-overlay').style.display = "none";
	                // 취소 클릭시 ss로 페이지 이동
	             //   location.href="SS";
		    let itemInfor2 = document.querySelectorAll(".itemInfor2");
		    itemInfor2.forEach(function(event) {
		        let checkbox = event.querySelector('.pic1');
		        if (checkbox.checked) {
		        let itemName = event.querySelector('.itemName').innerHTML;

		        
		       // console.log(itemName);
		            let newRow = document.createElement('div');
		            newRow.className = 'Stock_Request';
		            newRow.innerHTML = `
		                <div class="table_SR">
		                    <div class="row_SR1">
		                        <div class="cell_SR">
		                            <input type="text" class="item_name" style="width: 70%" value= "\${itemName}" readonly>
		                           
		                        </div>
		                        <div class="cell_SR">
		                            <input type="number" class="count" value="0">
		                            <button type="button" class="drop">지움</button>
		                        </div>
		                        <div class="cell_SR">
		                            <button type="button" class="delete1">삭제</button>
		                        </div>
		                        <input type="hidden" value="<%=role %>" name="userRole">
		                    </div>
		                </div>
		            `;
		            document.querySelector('.new_div').appendChild(newRow);
		        }
		    });
		});
		<%if ("ADMIN".equals(role)) {%>

		document.querySelector(".ordering").addEventListener("click", function(){
			   document.querySelector(".orderingBox1").style.display = "block";
			   document.getElementById('modal-overlay').style.display = "block";
		});
		
		<%}%>	
		
		document.querySelector(".orderingClose").addEventListener("click", function(){
			   document.querySelector(".orderingBox1").style.display = "none";
			   document.getElementById('modal-overlay').style.display = "none";
			   location.href="SS";
		});
		
		
// 		function deletePost(seq) {
// 			window.location.href = "sd?seq=" + seq;
// 		}
		
		
		
		
        // 2차 프로젝트 끝


        window.onload = function () {
            let add_Stock = document.querySelector(".add_Stock");
            let cancel = document.querySelector("#cancel");
            let add_text = document.querySelector("#add_text");
            let add_img = document.querySelector(".add_img");
            let cpu1 = document.querySelector(".cpu1");
            let cpu2 = document.querySelector(".cpu2");
            let cpu3 = document.querySelector(".cpu3");
            let item_name = document.querySelector(".item_name");
            let drop = document.querySelector(".drop");
            let add_Stock_bar = document.querySelector(".add_Stock_bar");
            let choice_text = document.querySelector(".choice_text");
            let pic1 = document.querySelector(".pic1");
            let count = document.querySelector(".count");
            let delete1 = document.querySelector(".delete1");
            let order2 = document.querySelector(".order2");
            let RRN = document.querySelector(".RRN");
            let RRC = document.querySelector(".RRC");
            let modalOverlay = document.getElementById('modal-overlay');
            let requestModal = document.getElementById('request_result');
            let cancel_rr = document.querySelector(".cancel_rr");

            let lastbtn = 0;
            let aa = 0;


			<%if ("WORKER".equals(role)) {%>



            document.querySelector('.order2').addEventListener('click', function () {
                // 지움
                document.querySelector('.new_RR').innerHTML = ""
                // 재고 전체
                rs = document.querySelectorAll('.row_SR1');
                
        		let userInfo2 = document.querySelector("#workerName").textContent.replace(/\s/g, "");
        		userInfo2 = userInfo2.slice(0, 3) + " " + userInfo2.slice(3);

                for (i = 1; i < rs.length; i++) {
                	let lengtn = rs.length-1;
                    let item_name = rs[i].querySelector('.item_name').value;
                    let count = rs[i].querySelector('.count').value;
                    
    		       // let itemMesId = rs[i].querySelector('.itemMesId').innerHTML;
    		        //let itemMesName = rs[i].querySelector('.itemMesName').innerHTML;
    		        //let itemIndex2 = rs[i].querySelector('.itemIndex2').innerHTML;
    		        //let itemMesPrice = rs[i].querySelector('.itemMesPrice').innerHTML;
    		        //let itemIndex1 = rs[i].querySelector('.itemIndex1').innerHTML;
    		        //let itemMGLoc = rs[i].querySelector('.itemMGLoc').innerHTML;
    		        //let itemBCount = rs[i].querySelector('.itemBCount').innerHTML;
    		        //let itemBLoc = rs[i].querySelector('.itemBLoc').innerHTML;
                    
                    
                    
//                <input type="text" name ="itemMesId" style="display : none" value= "\${itemMesId}" readonly>
  //              <input type="text" name ="itemMesName" style="display : none" value= "\${itemMesName}" readonly>
    //            <input type="text" name ="itemIndex2" style="display : none" value= "\${itemIndex2}" readonly>
      //          <input type="text" name ="itemMesPrice" style="display : none" value= "\${itemMesPrice}" readonly>
        //        <input type="text" name ="itemIndex1" style="display : none" value= "\${itemIndex1}" readonly>
          //      <input type="text" name ="itemMGLoc" style="display : none" value= "\${itemMGLoc}" readonly>
            //    <input type="text" name ="itemBCount" style="display : none" value= "\${itemBCount}" readonly>
              //  <input type="text" name ="itemBLoc" style="display : none" value= "\${itemBLoc}" readonly>
                
                    
                    
                    
                    let newRR = document.createElement('div');
                    newRR.className = 'result1';
                    newRR.innerHTML = `
                <input type="text" class="RRN2" name = "mesGrade" value="\${item_name}"> 
                <input type="text" style="display:none" name = "length" value = "\${lengtn}">:
                <input type="text" class="RRC2" name = "orderQuantity" value="\${count}" readonly>
                <input type="hidden" name = "userInfo" value="\${userInfo2}">
                `;
                    document.querySelector('.new_RR').appendChild(newRR);
                    modalOverlay.style.display = 'flex'; // 오버레이 표시
                    requestModal.style.display = 'block'; // 모달 표시
                }



                request_result.style.display = "inline-block";

            })

			<%}%>
            document.querySelector('.cancel_rr').addEventListener('click', function () {
                modalOverlay.style.display = 'none'; // 오버레이 숨기기
                requestModal.style.display = 'none'; // 모달 숨기기

   
            });
            document.querySelector('.cancel_D').addEventListener('click', function () {
                modalOverlay.style.display = 'none'; // 오버레이 숨기기
                requestModal.style.display = 'none'; // 모달 숨기기
				document.querySelector(".requestD").style.display = "none";
   
            });


            cancel_rr.onclick = function () {
                request_result.style.display = "none";
                RRN.value = ""
                RRC.value = ""
            }



 


            cancel.onclick = function () {
                add_img.style.display = "none";
                modalOverlay.style.display = 'none';
                // 취소 클릭시 ss로 페이지 이동
                location.href="SS";
                

            }

 	
    			
					<%if ("WORKER".equals(role)) {%>
            add_Stock_bar.onclick = function () {
                lastbtn = this;
                add_img.style.display = "inline-flex";
                modalOverlay.style.display = 'flex';
    
            }
    		<%}%>



            // 이 위가 window.onload










            // 지움 버튼 누르면 재고명에 공백

            document.addEventListener('click', function (event) {
                if (event.target.classList.contains('drop')) {
                   // item_name = event.target.parentNode.parentNode.querySelector('.item_name');
                    count = event.target.parentNode.querySelector('.count');
                   // item_name.value = "";
                    count.value = 0;
               }

            });


            // 삭제 버튼을 누르면 새로 생성된 div 삭제

            document.addEventListener('click', function (event) {
                if (event.target.classList.contains('delete1')) {
                    let row_SR1_length = document.querySelectorAll('.row_SR1').length;
                    if (row_SR1_length > 1) {
                        let Stock_Request = event.target.closest(".row_SR1");
                        Stock_Request.remove();
                    } else {
                        alert("1개는 남겨둬야합니다.");
                    }
                }

            });

        }


        // 여기는 function
        //  + - 누르면 숫자 증가 감소


        function plus(clickedElement) {
            var parentRow = clickedElement.parentNode.parentNode;
            var input = parentRow.querySelector('.count');
            var value = parseInt(input.value, 10);
            value = isNaN(value) ? 0 : value;
            if (value < 999) {
                value++;
                input.value = value;
            } else {
                alert("1000이상 구매할 수 없습니다.");
            }
        }

        function minus(clickedElement) {
            var parentRow = clickedElement.parentNode.parentNode;
            var input = parentRow.querySelector('.count');
            var value = parseInt(input.value, 10);
            value = isNaN(value) ? 0 : value;
            if (value > 0) {
                value--;
                input.value = value;
            } else {
                alert("음수는 입력할 수 없습니다.");
            }
        }


        // + - 여기까지





        // 마이페이지
        document.querySelector("#workerName").addEventListener("click", () => {
            window.open("myPage.html", '_blank', 'width = 630, height = 470, top=100, left=100');
        });

        // document.querySelector("#adminTitle").style.display = 'block';
 //       document.querySelector("#adminNav").style.display = 'block';
        // document.querySelector(".workerGrade").innerHTML = '작업자<br>';
     //   document.querySelector(".workerGrade").innerHTML = '관리자<br>';

        // document.querySelector("#adminTitle").style.display = 'none';
        // document.querySelector("#adminNav").style.display = 'none';
        
        

    </script>
</body>

</html>