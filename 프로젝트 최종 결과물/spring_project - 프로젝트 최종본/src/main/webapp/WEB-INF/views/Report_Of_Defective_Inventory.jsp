<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ page import="java.util.List"%>
<%@ page import="com.mes.project.jjh.dto.Rodi_DTO"%>

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

textarea {
	resize: none;
	overflow: auto;
}

button, input {
	font-family: "SOYOMapleBoldTTF";
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
	border-radius: 8px;
	background-color: #fff;
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
	width: 240px;
	height: 80px;
	display: flex;
	justify-content: center;
	background-color: #fff;
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
	width: 240px;
	height: 80px;
	display: flex;
	justify-content: center;
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
	/*argin-left: 40px;*/
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
	min-height: 800px;
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

/*  재고신청 확인 */
.Refund_page {
	display: flex;
	flex-direction: column;
	align-items: center;
}

.Refund_Application1 {
	display: block;
	font-size: 30px;
	line-height: 100px;
}

/* 재고신청 내역*/
.Refund_Application_Record {
	width: 600px;
	display: flex;
	justify-content: center;
}

.table_RAR {
	display: flex;
	flex-direction: column;
	border-collapse: collapse;
	width: 700px;
	/* 표의 너비 조절 */
}

.cell_RARC {
	border-left: 1px solid #bbb;
	border-right: 1px solid #bbb;
	width: 7%;
	text-align: center;
}

.cell_RARC input {
	margin-top: 13px;
	width: 50%;
}

.row_RAR {
	display: flex;
	border-bottom: 2px solid #ddd;
	/* 아래 테두리 스타일 지정 */
}

.row_RAR:first-child {
	border-top: 2px solid #ddd;
	background-color: #888888;
	/* 첫 번째 행의 위 테두리 스타일 지정 */
}

.cell_RAR {
	flex: 1;
	height: 35px;
	line-height: 35px;
	text-align: center;
	border-right: 1px solid #ddd;
	text-align: center;
	/* 오른쪽 테두리 스타일 지정 */
}

.cell_RAR:last-child {
	border-right: none;
	/* 마지막 셀에서 오른쪽 테두리 제거 */
}

.cell_RAR input {
	border: none;
	text-align: center;
	background-color: #eee;
	width: 100px;
}

/* 재고신청내역 끝 */

/* 재고신청*/
.Refund_Application12 {
	font-size: 30px;
}

.Refund_Request {
	width: 750px;
	display: flex;
	justify-content: center;
}

.table_RR {
	display: flex;
	flex-direction: column;
	border-collapse: collapse;
	width: 750px;
	/* border :1px solid red; */
	/* 표의 너비 조절 */
}

.row_RR, .row_RR1 {
	display: flex;
	/* border : 1px solid blue; */
	border-bottom: 2px solid #ddd;
	/* 아래 테두리 스타일 지정 */
}

.row_RR:first-child, .row_RR1:first-child {
	border-top: 2px solid #ddd;
	/* 첫 번째 행의 위 테두리 스타일 지정 */
}

.cell_RR {
	padding: 0px;
	text-align: center;
	border-right: 1px solid #ddd;
	/* 오른쪽 테두리 스타일 지정 */
}

.cell_RR:last-child {
	border-right: none;
	/* 마지막 셀에서 오른쪽 테두리 제거 */
}

.cell_RR input {
	border: none;
	text-align: center;
	background-color: #eee;
	font-family: "SOYOMapleBoldTTF";
}

.item_name {
	margin-top: 55px;
	width: 100px;
	font-size: 20px;
}

.count {
	margin-top: 55px;
	width: 100px;
}

.plus, .minus {
	border: 1px solid red;
}

.text_rr {
	width: 147px;
	height: auto;
	word-wrap: break-word;
	font-size: 10px;
}

.text_RR {
	/* border: 1px solid blue; */
	width: 147px;
	height: 100%;
	padding: 1px;
	display: flex;
	flex-direction: column;
	justify-content: space-evenly;
	align-items: center;
}

.image_but {
	/* border: 1px solid red; */
	display: flex;
	width: 100%;
	/* flex-direction: row;
            justify-content: space-evenly; */
	/* border : 1px solid blue; */
	display: flex;
	justify-content: space-evenly
}

.image_area {
	display: flex;
	/* border: 1px solid red; */
	width: 100%;
}

.but_box {
	width: 100%;
}

.image_box {
	/* border: 1px solid green; */
	width: 125px;
	height: 100px;
	/* overflow: hidden; */
	/* background-image: url('https://media.discordapp.net/attachments/1186454147558551552/1201687978230173706/image.png?ex=65caba24&is=65b84524&hm=bd86b0025fb9ddc7b872d912c5a5b8ae55dd00d9e73964fbefffcfa4f54f77d7&=&format=webp&quality=lossless&width=468&height=468'); */
	background-size: contain;
	/* 이미지를 요소에 맞도록 조절 */
	background-repeat: no-repeat;
	/* 이미지 반복 없음 */
	background-position: center;
	/* 이미지를 가운데 정렬 */
}

.image_box1 {
	/* border: 1px solid green; */
	width: 100%;
	height: 100px;
	/* border: 1px solid red; */
	/* overflow: hidden; */
	/* background-image: url('https://media.discordapp.net/attachments/1186454147558551552/1201687978230173706/image.png?ex=65caba24&is=65b84524&hm=bd86b0025fb9ddc7b872d912c5a5b8ae55dd00d9e73964fbefffcfa4f54f77d7&=&format=webp&quality=lossless&width=468&height=468'); */
	background-size: contain;
	/* 이미지를 요소에 맞도록 조절 */
	background-repeat: no-repeat;
	/* 이미지 반복 없음 */
	background-position: center;
	/* 이미지를 가운데 정렬 */
}

.add {
	margin-left: auto;
}

.submit, .cancel {
	display: inline-flex;
	margin: 25px;
}

/* 재고신청 끝 */

/* 팝업 */
.pic {
	display: flex;
	justify-content: center;
	/* width : 250px; */
	/* height : 100px */
}

.text_area {
	/* border : 1px solid red; */
	width: 250px;
	height: 80px
}

.ta {
	width: 245px;
	height: 75px;
}

/* Modal 팝업 */
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
	overflow-y: auto;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	max-width: 300px;
	max-height: 700px;
	width: 30%;
	background-color: white;
	padding: 20px;
	border-radius: 5px;
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.5);
	z-index: 1001;
}

.result {
	/* border: 1px solid red; */
	width: 300px;
	height: 30px;
	margin: auto;
	text-align: center;
	line-height: 70px;
	display: flex;
	justify-content: center;
	align-items: center;
	/* display: flex; */
}

.result input {
	background-color: #eef;
	width: 100px;
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

.add_img {
	position: fixed;
	overflow-y: auto;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	max-width: 1700px;
	background-color: white;
	border-radius: 5px;
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.5);
	z-index: 1002;
	align-items: center;
	flex-direction: column;
	background-color: #eee;
	width: 50%;
	height: 75%;
	display: none;
}

.Stock_page {
	/* border: 1px solid blue; */
	line-height: 100px;
	width: 210px;
	margin: auto;
	font-size: 30px;
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
	width: 50%;
	display: flex;
	margin: auto;
	padding: 5px;
	margin-top: 20px;
	justify-content: space-around;
}

.searchbox input {
	border: 1px solid #ccc;
	border-radius: 3px;
	width: 100%;
}

.glasses {
	padding: 1px;
	height: 20px;
}

.search {
	padding-right: 20px;
}

.company, .reason {
	width: 100%;
	text-align: center;
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
	justify-content: center;
	align-items: center;
	flex-wrap: wrap;
	align-items: center;
	flex-wrap: wrap;
}

.item {
	width: 90%;
	height: 100%;
	display: flex;
	flex-direction: column;
	justify-content: start;
	overflow-y: auto;
}

.itemInfor1 {
	display: flex;
	height: 35px;
	line-height: 35px;
	justify-content: space-evenly;
}

.itemInfor1 div:first-child {
	text-align: center;
	width: 50px;
	border: 1px solid #eee;
	background-color: #aaa;
}

.itemInfor1 div {
	text-align: center;
	width: 19%;
	border: 1px solid #eee;
	background-color: #aaa;
}

.itemInfor1 div br {
	display: none;
}

.itemInfor2 {
	display: flex;
	line-height: 25px;
	margin-top: 3px;
	justify-content: space-evenly;
}

.itemIndex2 {
	font-size: 13px;
}

.itemInfor2 div:first-child {
	background-color: #fff;
	text-align: center;
	border: 1px solid #888888;
	width: 35px;
	height: 50px;
	line-height: 33px;
}

.itemInfor2 div {
	background-color: #fff;
	text-align: center;
	border: 1px solid #888888;
	width: 19%;
	height: 50px;
	line-height: 50px;
}

.itemInfor1 input {
	margin-top: 7px;
}

.itemInfor2 input {
	margin-top: 15px;
}

.invalid {
	height: 90%;
	width: 96%;
}

.pics {
	margin-top: 13px;
	width: 50%;
	height: 20px;
}

.infor_item_box {
	display: none;
	position: absolute;
	width: 40%;
	height: 50%;
	top: 25%;
	left: 30%;
	background-color: rgb(214, 214, 214);
	z-index: 1001;
	position: absolute;
}

.infor_item {
	/* border: 1px solid red; */
	display: flex;
	flex-direction: column;
	/* justify-content: center; */
	align-items: center;
	justify-content: space-evenly;
	width: 100%;
	height: 100%;
}

.infor_item_explan {
	font-size: 30px;
}

.infor_item_img {
	/* border: 1px solid red; */
	height: 30%;
	width: 40%;
	display: flex;
	justify-content: center;
	align-items: center;
}

.infor_item_img img {
	width: 100%;
}

.items_imglink {
	height: 100%;
}

.infor_item_name {
	/* border: 1px solid red; */
	width: 50%;
	text-align: center;
	height: 5%;
}

.infor_com {
	background-color: #3498DB;
	margin-top: 10px;
	margin-bottom: 10px;
	width: 20%;
	height: 55%;
	border-radius: 5px;
	cursor: pointer;
	color: #fff;
	border: 0;
	text-align: center;
	line-height: 35px;
}

.infor_com:hover {
	background-color: rgb(0, 47, 255);
	transition: 0.2s;
}

.dto0 {
	width: 100%;
	height: 100%;
}

/*위로 프로젝트2*/
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

.choice_textarea {
	display: none;
}

.sample_img {
	/* border: 1px solid red; */
	/* width: 200px; */
	height: 100%;
}

.cpu1, .cpu2, .cpu3 {
	font-size: 30px;
	border: 0px;
	background-color: rgb(214, 214, 214);
	width: 98.5%;
	text-align: center;
}

.button_RR, .button_RR_D {
	width: 300px;
	margin: auto;
	display: flex;
	justify-content: space-around;
}

.button_ac {
	/* border: 1px solid red; */
	width: 300px;
	margin: auto;
	display: flex;
	justify-content: space-around;
}

/* 버튼 스타일 */
.add_Stock, .drop {
	width: 40px;
	height: 20px;
	border-radius: 5px;
	cursor: pointer;
	color: #fff;
	border: 0;
	background: #3498DB;
}

.pic1 {
	width: 40px;
	height: 20px;
}

.add_Stock_bar, #add_text, #cancel {
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
	#add_text:hover, #cancel:hover, .order_rr:hover, .order_D:hover {
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

/* 주문 요청 버튼 끝 */
.drop {
	background-color: red;
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
	width: 50px;
	height: 50px;
	cursor: pointer;
	margin-top: 40px;
}

.delete1 :hover {
	background-color: #555;
	transition: 0.2s;
}

/* 미디어 태그 후 수정 */
.row_RR:nth-child(1) {
	background-color: #888888;
}

.table_RR {
	width: 100%;
}

.cell_RR:nth-child(1) {
	flex: 1;
	/* border: 1px solid red; */
	width: 15%;
}

.cell_RR:nth-child(2) {
	flex: 1;
	/* border: 1px solid red; */
	width: 15%;
}

.cell_RR:nth-child(3) {
	flex: 1;
	/* border: 1px solid red; */
	width: 20%;
}

.cell_RR:nth-child(4) {
	flex: 1;
	/* border: 1px solid red; */
	width: 20%;
	/* display: flex;
                align-items: center; */
}

.cell_RR:nth-child(5) {
	flex: 0.7;
	/* border: 1px solid red; */
	width: 20%;
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

/* 여기까지 수정 */
.ta_cpu1, .ta_cpu2, .ta_cpu3 {
	width: 250px;
	margin-left: 20px;
	height: 90px;
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
		justify-content: flex-start;
	}

	/* 위는 미디어 공통 */
	/* 아래가 미디어 내 부분 */
	.Refund_page {
		width: 420px;
	}
	.Refund_Application_Record {
		width: 95%;
	}
	.Refund_Request {
		width: 95%;
		/* border: 1px solid red; */
	}
	.row_RR:nth-child(1) {
		background-color: #888888;
	}
	.table_RR {
		width: 95%;
	}
	.cell_RR:nth-child(1) {
		flex: 1;
		/* border: 1px solid red; */
		width: 15%;
	}
	.cell_RR:nth-child(2) {
		flex: 1;
		/* border: 1px solid red; */
		width: 15%;
	}
	.cell_RR:nth-child(3) {
		flex: 1;
		/* border: 1px solid red; */
		width: 20%;
	}
	.cell_RR:nth-child(4) {
		flex: 1;
		/* border: 1px solid red; */
		width: 20%;
		/* display: flex;
                align-items: center; */
	}
	.cell_RR:nth-child(5) {
		flex: 0.7;
		/* border: 1px solid red; */
		width: 20%;
	}
	.cell_RR input {
		font-size: 10px;
	}
	.infor_item_box {
		width: 75%;
		top: 15%;
		left: 15%;
	}
	.cell_RAR {
		font-size: 15px;
	}
	.text_rr1 {
		font-size: 10px;
	}
	.text_rr2 {
		font-size: 10px;
		word-wrap: break-word;
	}
	.requestD {
		width: 75%;
	}
	.invalid {
		font-size: 10px;
	}
	.item_name {
		margin-top: 0px;
		/* width : 10px; */
		/* font-size: 10px; */
	}
	.delete1 {
		margin-top: 0px;
	}
	.cell_RR {
		/* border: 1px solid red; */
		display: flex;
		justify-content: center;
	}
	.row_RR1 {
		align-items: center;
	}
	.count {
		width: 50px;
		margin-top: 0px;
	}
	.plus, .minus {
		display: none;
	}
	.image_area {
		display: flex;
		justify-content: center;
		width: 100%;
	}
	.text_RR {
		width: 100%;
	}
	.image_box1 {
		/* border: 1px solid red; */
		width: 100%;
		height: 75%;
	}
	.image_but {
		display: flex;
		flex-direction: row;
		justify-content: center;
		width: 100%;
		/* border: 1px solid red; */
	}
	.but_box {
		display: flex;
		flex-direction: column;
		justify-content: space-between;
		align-items: center;
		height: 100px;
	}
	.add_Stock_bar {
		width: 50px;
	}
	.add {
		display: flex;
		margin: auto;
		margin-top: 50px;
		flex-direction: row-reverse;
		/* border: 1px solid red; */
		width: 90%;
	}

	/* 팝업 미디어 */
	.add_img {
		width: 95%;
		/* display: block; */
		overflow-y: auto;
		/* border: 1px solid green; */
	}
	.item {
		width: 100%;
	}
	.itemInfor1 {
		display: flex;
		height: 35px;
		line-height: 35px;
		justify-content: space-evenly;
	}
	.itemInfor1 div:first-child {
		text-align: center;
		width: 35px;
		border: 1px solid #eee;
		background-color: #aaa;
	}
	.itemInfor1 div {
		text-align: center;
		width: 19%;
		border: 1px solid #eee;
		background-color: #aaa;
	}
	.itemInfor2 {
		display: flex;
		line-height: 25px;
		margin-top: 3px;
		justify-content: space-evenly;
	}
	.itemInfor2 div:first-child {
		background-color: #fff;
		text-align: center;
		border: 1px solid #888888;
		width: 35px;
		height: 50px;
		line-height: 33px;
	}
	.itemInfor1 div:nth-child(2) {
		width: 10%;
	}
	.itemInfor2 div:nth-child(2) {
		width: 10%;
	}
	.itemInfor1 div:nth-child(3) {
		width: 13%;
	}
	.itemInfor2 div:nth-child(3) {
		width: 13%;
	}
	.itemInfor1 div:nth-child(4) {
		width: 10%;
	}
	.itemInfor2 div:nth-child(4) {
		width: 10%;
	}
	.itemInfor2 div {
		background-color: #fff;
		text-align: center;
		border: 1px solid #888888;
		width: 19%;
		height: 50px;
		line-height: 50px;
	}
	.itemInfor1 input {
		margin-top: 7px;
	}
	.itemInfor2 input {
		margin-top: 15px;
	}
	.pic {
		display: flex;
		/* border: 1px solid red; */
		width: 80%
	}
	.pic1 {
		width: 50%;
	}
	.itemInfor1 div br {
		display: block;
	}
	.itemInfor1 div span {
		display: none;
	}
	.company, .reason {
		font-size: 10px;
	}
	.sample_img {
		/* border: 1px solid red; */
		width: 100px;
		height: 100px;
	}
	.itemList {
		width: 100%;
		font-size: 10px;
		margin-left: 10px;
		/* border: 1px solid red; */
		display: flex;
		justify-content: center;
		margin-left: 10px;
	}
	.ta_cpu1, .ta_cpu2, .ta_cpu3 {
		width: 90%;
	}
	.text_area {
		display: flex;
		justify-content: center;
		height: 70px;
		margin-bottom: 10px;
	}
	.image_box {
		display: flex;
		align-items: center;
		/* border: 1px solid red; */
		height: 100%;
	}
	.request_result {
		/* display: block; */
		width: 80%;
	}
	.Refund_Application1, .Refund_Application12 {
		font-size: 20px;
	}
	.workerPic {
		width: 80px;
		height: 80px;
		border-radius: 50%;
	}
	.submit {
		display: flex;
		align-items: flex-end;
		justify-content: space-around;
		width: 100%;
		/* border : 1px solid red; */
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
	.order {
		width: 110px;
	}
	.admin:hover, .worker:hover {
		background-color: rgb(0, 47, 255);
		transition: 0.2s;
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
					<!-- 불량신청확인 -->
					<div class="Refund_page">

						<%
						if ("ADMIN".equals(role)) {
						%>

						<div class="Refund_Application1">반품신청확인</div>
						<br>

						<!-- 재고신청내역 -->
						<div class="Refund_Application_Record">
							<div class="table_RAR">
								<div class="row_RAR">
									<div class="cell_RARC">
										<input type="checkbox" class="picsO">
									</div>
									<div class="cell_RAR">불량재고신청내역</div>
									<div class="cell_RAR">수량</div>
									<div class="cell_RAR">신청자</div>
									<div class="cell_RAR">신청일</div>
								</div>

								<c:if test="${not empty list3}">
									<c:forEach var="l3" items="${list3 }">

										<div class="row_RAR">
											<div class="cell_RARC">
												<input type="checkbox" class="picO">
											</div>
											<div class="cell_RAR">
												<div class="dto0">${l3.itemName}</div>
											</div>
											<div class="cell_RAR">
												<div class="dto1">${l3.itemCount}</div>
												<div class="dto2" style="display: none">${l3.de_content}</div>
												<div class="dto3" style="display: none">${l3.de_etc}</div>
												<div class="dto4" style="display: none">${l3.s_number}</div>
												<div class="dto5" style="display: none">${l3.de_number}</div>
												<div class="dto6" style="display: none">${l3.itemImg}</div>
											</div>
											<div class="cell_RAR">
												<input type="text" value="${l3.userInfo}" READONLY>
											</div>
											<div class="cell_RAR">
												<fmt:formatDate value="${l3.de_date}" pattern="yyyy-MM-dd" />
											</div>
										</div>
									</c:forEach>
								</c:if>
							</div>
						</div>
						<%
						}
						%>
						<br> <br> <br>
						<%
						if ("WORKER".equals(role)) {
						%>
						<!-- 재고신청 -->
						<div class="Refund_Application12">업체반품신청</div>
						<br>
						<div class="Refund_Request">
							<div class="table_RR">
								<div class="row_RR">
									<div class="cell_RR">불량재고명</div>
									<div class="cell_RR">불량수량</div>
									<div class="cell_RR">불량내용</div>
									<div class="cell_RR">사진첨부</div>
									<div class="cell_RR"></div>
								</div>
								<form method="post" enctype="multipart/form-data"
									accept-charset="utf-8" class="ri" action="ri">
									<div class="new_div"></div>
								</form>
							</div>
						</div>
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
								<button type="button" class="order1">업체 반품 요청</button>
								<%
								}
								%>
								<%
								if ("WORKER".equals(role)) {
								%>
								<button type="button" class="order2">
									관리자에게 </br>반품 요청
								</button>
								<%
								}
								%>
							</div>
						</div>
					</div>

					<form method="get" action="rodi">
						<!-- 팝업 -->

						<div class="modal-overlay" id="modal-overlay"
							style="display: 
							 <%String name = (String) request.getAttribute("gradeSerch");
							 if (name != null) {%> block<%} else {%> none <%}%> ;">
						</div>
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
									<button type="submit">검색</button>
								</div>
							</div>

							<br>
							<div class="itemList">
								<div class="item">
									<div class="itemInfor1">
										<div class="picBox">
											<input type="checkbox" class="pics">
										</div>
										<div>
											<span>재고</span>번호
										</div>
										<div>품목</div>
										<div>
											불량<br>수량
										</div>
										<div>물품설명</div>
										<div>관련업체</div>
										<div>불량사유</div>
										<div>기타사유</div>
									</div>

									<c:if test="${not empty list2}">
										<c:forEach var="l2" items="${list2 }">
											<div class="itemInfor2">
												<div class="pic">
													<input type="checkbox" class="pic1">
												</div>
												<div class="itemMesId">${l2.mesId}</div>
												<div class="itemName">${l2.mesGrade}</div>
												<div class="itemIndex1">${l2.BCount}</div>
												<div class="itemIndex2">${l2.mesContent}</div>
												<div class="itemCompany">
													<select name="company" class="company">
														<option value="">업체선택</option>
														<option value="9006">테크윅스</option>
														<option value="9007">메인스타</option>
														<option value="9008">쿨텍</option>
													</select>
												</div>
												<div class="itemIndex3">
													<select class="reason" name="reason">
														<option value="">사유선택</option>
														<option value="제조 공정 불량">제조 공정 불량</option>
														<option value="자재 불량">자재 불량</option>
														<option value="운송 중 파손">운송 중 파손</option>
														<option value="보관 시 문제 발생">보관 시 문제 발생</option>
														<option value="기타">기타</option>
													</select>

												</div>
												<div class="itemIndex4">
													<textarea class="invalid"> </textarea>
												</div>
											</div>
										</c:forEach>
									</c:if>
								</div>
							</div>
							<br>
							<div class="button_ac">
								<button type="button" id="add_text">추가하기</button>
								<button type="button" id="cancel">취소하기</button>
							</div>
						</div>
					</form>

					<!-- 반품사유 팝업 -->
					<div class="infor_item_box">
						<div class="infor_item">
							<div class="infor_item_explan">품목 설명</div>
							<div class="infor_item_img">
								<img class="itemImgSrc" src="">
							</div>
							<div class="infor_item_name"></div>
							<div class="infor_item_index" style="text-align: center;"></div>
							<div class="infor_item_textarea">
								<textarea class="infor_item_ta" readonly></textarea>
							</div>
							<div class="infor_commit">
								<button type="button" class="infor_com" style="width: 50px;">확인</button>
							</div>
						</div>
					</div>

					<!-- 업체 반품 요청 -->

					<form method="get" class="rd" action="rd">
						<div class="requestD" id="requestD" style="display: none;">
							<h1 style="text-align: center;">반품 요청 리스트</h1>
							<div class="listName">
								<div>품목</div>
								:
								<div>수량</div>
							</div>
							<div class="new_D"></div>
							<div class="button_RR_D">
								<button type="submit" class="order_D">반품하기</button>
								<button type="button" class="cancel_D">취소하기</button>
							</div>
						</div>
					</form>

					<!-- 팝업2 -->

					<form method="post" enctype="multipart/form-data"
						accept-charset="utf-8" class="rifake" action="rifake">
						<div class="modal-overlay" id="modal-overlay"
							style="display: none;"></div>
						<div class="request_result" id="request_result">
							<h1 style="text-align: center;">반품 요청 리스트</h1>
							<div class="listName">
								<div>품목</div>
								:
								<div>수량</div>
							</div>
							<div class="new_RR"></div>
							<div class="button_RR">
								<button type="submit" class="order_rr">반품하기</button>
								<button type="button" class="cancel_rr">취소하기</button>
							</div>
						</div>
					</form>

				</article>
			</section>
		</div>
		<footer>ⓒ2024 J.company System</footer>
	</div>

	<script>

    // 프로젝트 3
	// 업체반품신청에서 사진정보 데이터베이스 넘기는 서브밋

	document.querySelector(".order_rr").addEventListener("click", function(event){
		event.preventDefault();
		let ri = document.querySelector(".ri");
		ri.submit();
	});

	// 업체반품신청에서 사진정보 데이터베이스 넘기는 서브밋 끝

    //프로젝트2
	
	let pics = document.querySelector(".pics");
	let pic1 = document.querySelectorAll(".pic1");

	pics.addEventListener("click", function() {
	    for (let i = 0; i < pic1.length; i++) {
	        pic1[i].checked = pics.checked;
		    }
	});
		
    <%if ("ADMIN".equals(role)) {%>
	
	let picsO = document.querySelector(".picsO");
	let picO = document.querySelectorAll(".picO");
	picsO.addEventListener("click", function(){
		for(let i = 0; i < picO.length; i++){
			picO[i].checked = picsO.checked;
		}
	});
	<%}%>

	document.querySelector("#cancel").addEventListener("click", function(){
		document.querySelector(".add_img").style.display = "none";
		document.querySelector(".modal-overlay").style.display = 'none';
	})
		
	document.querySelector("#add_text").addEventListener("click", function(){
		document.querySelector(".add_img").style.display = "none";
		document.getElementById('modal-overlay').style.display = "none";
		   // 취소 클릭시 ss로 페이지 이동
		   // location.href="SS";
		let itemInfor2 = document.querySelectorAll(".itemInfor2");
		
		itemInfor2.forEach(function(event) {
			let checkbox = event.querySelector('.pic1');
		    if (checkbox.checked) {
			    let itemMesId = event.querySelector('.itemMesId').innerHTML;
			    let company = event.querySelector('.company').value;
		        // 유저정보 담기
			    let userInfo2 = document.querySelector("#workerName").textContent.replace(/\s/g, "");
		        userInfo2 = userInfo2.slice(0, 3) + " " + userInfo2.slice(3);
		        // 유저정보 담기 끝
		        let itemName = event.querySelector('.itemName').innerHTML;
		        let itemIndex1 = event.querySelector('.itemIndex1').innerHTML;
		        let itemIndex3 = event.querySelector('.reason').value;
		        let itemIndex4 = event.querySelector('.invalid').value;
		            let newRow = document.createElement('div');
		            newRow.className = 'rodi';
		            newRow.innerHTML = `
		            <div class="table_SR">
		            	<div class="row_RR1">
			        		<div class="cell_RR">
			        			<input type="text" class="item_name" name="itemName" value="\${itemName}" readonly="">
			        		</div>
			        		<div class="cell_RR">
			        			<input type="number" class="count" name = "itemCount" value="\${itemIndex1}">
			        		</div>
			        		<div class="cell_RR">
			        			<div class="text_RR">
			        				<div class="text_rr1"><input type = "text" name = "de_content" value = "\${itemIndex3}"></div>
			        				<div class="text_rr2"><input type = "text" name = "de_etc" value = "\${itemIndex4}"></div>
			        				<input type = "hidden" class = "text_company" name = "co_number" value ="\${company}">
			        				<input type = "hidden" class="text_mesId" name = "s_number" value ="\${itemMesId}">
			        				<input type = "hidden" class="itemIndex4" value ="\${itemIndex4}">
			        				<input type = "hidden" class="userInfo" name = "userInfo" value ="\${userInfo2}">
			        			</div>
			        		</div>
			        		<div class="cell_RR">
			        			<div class="image_area">
			        				<div class="but_box">
			        					<div class="image_box1">
			        					<img class="items_imglink" src="">
			        					</div>
			        					<div class="image_but">
			        						<button type="button" class="add_Stock" title = "이미지파일 용량은 100MB까지 가능합니다.">선택</button>
			        						<input type ="file" name = "imgFileName" class = "itemImg" style = "display:none" >
			        						<!--<button type="button" class="drop">지움</button>-->
			        					</div>
			        				</div>
			        			</div>
			        		</div>
			        		<div class="cell_RR">
			        			<button type="button" class="delete1">삭제</button>
			        		</div>
		        		</div>
					</div>
		            `;
				document.querySelector('.new_div').appendChild(newRow);
			}
		});
		
		 // 파일 선택(input) 이벤트 감지
	    document.querySelectorAll('.itemImg').forEach(function(itemImgInput) {
	        itemImgInput.addEventListener('change', function() {
	            // 선택된 파일 객체 가져오기
	            var file = this.files[0];
	            
	            // FileReader 객체 생성
	            var reader = new FileReader();
	            
	            // 이미지를 표시할 img 요소 찾기
	            var imgElement = this.closest('.rodi').querySelector('.items_imglink');
	            
	            // 파일 로드가 완료된 경우 실행되는 이벤트 핸들러
	            reader.onload = function(event) {
	                // 이미지가 로드된 후에 이미지 태그(src 속성)에 이미지를 표시
	                imgElement.src = event.target.result;
	            };
	            
	            // 파일을 읽기
	            if (file) {
	                reader.readAsDataURL(file);
	            }
	        });
	    });
		
	});
		
	// 삭제버튼 클릭 시 해당 열 삭제
	document.addEventListener('click', function (event) {
	    if (event.target.classList.contains('delete1')) {
	        let rodi = event.target.closest(".rodi");
	        rodi.remove();
	  	}
	});
		
	document.addEventListener('click', function (event) {
	    if (event.target.classList.contains('add_Stock')) {
	        let itemImg = event.target.closest(".but_box").querySelector(".itemImg");
	        itemImg.click();
	   	}
	});

	// 선택 버튼 클릭 시 input 요소를 클릭하는 이벤트 핸들러
	document.querySelectorAll('.add_Stock').forEach(function(addStockButton) {
	    addStockButton.addEventListener('click', function() {
	        // 파일 선택(input) 요소 클릭
	        this.closest('.rodi').querySelector('.itemImg').click();
	    });
	});
	
			// 관리자에게 반품요청
	<%if ("WORKER".equals(role)) {%>
		document.querySelector('.order2').addEventListener('click', function () {
			// 지움
			document.querySelector('.new_RR').innerHTML = "";
				// 재고 전체
			rs = document.querySelectorAll('.row_RR1');
				for (i = 0; i < rs.length; i++) {
					let item_name = rs[i].querySelector('.item_name').value;
					let count = rs[i].querySelector('.count').value;
					let text_company = rs[i].querySelector('.text_company').value;
					let text_mesId = rs[i].querySelector('.text_mesId').value;
					let text_rr1 = rs[i].querySelector('.text_rr1').innerHTML;
					let text_rr2 = rs[i].querySelector('.text_rr2').innerHTML;
					console.log(item_name);
					// 유저정보 담기
					let userInfo2 = document.querySelector("#workerName").textContent.replace(/\s/g, "");
					userInfo2 = userInfo2.slice(0, 3) + " " + userInfo2.slice(3);
					// 유저정보 담기 끝
					let newRR = document.createElement('div');
					newRR.className = 'result';
					newRR.innerHTML = `
					<input type="text" class="RRN" name = "itemName" value="\${item_name}"> :
					<input type="text" class="RRC" name = "itemCount" value="\${count}" readonly>
						<div style = "display : none;";
		//				팝업창에 따로 정보를 불러와서 submit 하던 것을 본 화면에서 submit하면서 불필요하게된 코드(지워도 됨) 
		// 				<input type="hidden" name = "de_content" value = "\${text_rr1}">
		// 				<input type="hidden" name = "de_etc" value = "\${text_rr2}">
		// 				<input type="hidden" name = "co_number" value = "\${text_company}">
		// 				<input type="hidden" name = "s_number" value = "\${text_mesId}">
		// 				<input type="hidden" name = "userInfo" value = "\${userInfo2}">
				  		</div>
		        `;
					document.querySelector('.new_RR').appendChild(newRR);
					document.getElementById('modal-overlay').style.display = 'flex'; // 오버레이 표시
					document.getElementById('request_result').style.display = 'block'; // 모달 표시
				}
			request_result.style.display = "inline-block";
	    })
	<%}%>

      
	document.querySelector('.cancel_rr').addEventListener('click', function () {
		document.getElementById('modal-overlay').style.display = "none";
		document.getElementById('request_result').style.display = 'none'; // 모달 숨기기
	});
		
		
		// 품목클릭시 팝업
		
	let dto0 = document.querySelectorAll(".dto0");
	console.log(dto0.length);
	for (let i = 0; i < dto0.length; i++) {
	    dto0[i].addEventListener("click", function (event) {
	        document.getElementById('modal-overlay').style.display = 'flex';
	        document.querySelector('.infor_item_box').style.display = 'block';
	
	        let dto = event.target.parentNode.querySelector(".dto0").innerHTML;
	        let dto2 = event.target.parentNode.parentNode.querySelector(".dto2").innerHTML;
	        let dto3 = event.target.parentNode.parentNode.querySelector(".dto3");
	        let dto6 = event.target.parentNode.parentNode.querySelector(".dto6").innerHTML;
	        console.log(dto6);
	        document.querySelector(".infor_item_name").innerHTML = dto;
	        if("null" == dto2){
	        	document.querySelector(".infor_item_index").innerHTML = "";
	        } else{
	        	document.querySelector(".infor_item_index").innerHTML = dto2;
	        }
	        document.querySelector(".infor_item_ta").value = dto3.innerHTML;
	        
	        let url = "/mes_project/fileDownload?fileName=";
	        
	        document.querySelector(".itemImgSrc").src = url+dto6;
	        
	    });
	}
		
        document.querySelector('.infor_com').addEventListener("click", function () {
        document.getElementById('modal-overlay').style.display = 'none';
        document.querySelector('.infor_item_box').style.display = 'none';
        	
        });

		// 업체에 주문요청
	<%if ("ADMIN".equals(role)) {%>
		document.querySelector(".order1").addEventListener("click", function(){
			document.querySelector(".requestD").style.display = "block";
			document.getElementById('modal-overlay').style.display = "block";
			document.querySelector('.new_D').innerHTML = ""
			let row_RAR = document.querySelectorAll(".row_RAR");
			row_RAR.forEach(function(event){
				let checkbox = event.querySelector(".picO");
				if(checkbox != null && checkbox.checked){
					let D0 = event.querySelector(".dto0").innerHTML;
					let D1 = event.querySelector(".dto1").innerHTML;
					let D4 = event.querySelector(".dto4").innerHTML;
					let D5 = event.querySelector(".dto5").innerHTML;
					let newRR = document.createElement('div');
						newRR.className = 'result';
						newRR.innerHTML = `
						<input type="text" class="RRN" name = "itemName" value="\${D0}"> :
						<input type="text" class="RRC" name = "itemCount" value="\${D1}" readonly>
						<input type="hidden" class="RRC" name = "s_number" value="\${D4}">
						<input type="hidden" class="RRC" name = "de_number" value="\${D5}">
						`;
	    			document.querySelector('.new_D').appendChild(newRR);
				}
			});
		});
	<%}%>
		
	// 업체 반품요청에서 취소 클릭
	document.querySelector('.cancel_D').addEventListener('click', function () {
		document.getElementById('modal-overlay').style.display = 'none'; // 오버레이 숨기기
		document.getElementById('request_result').style.display = 'none'; // 모달 숨기기
		document.querySelector(".requestD").style.display = "none";
	});
        
	// 프로젝트2 끝
        
	window.onload = function () {
		<%if ("ADMIN".equals(role)) {%>
		let add_Stock = document.querySelector(".add_Stock");
		<%}%>
		
		let add_img = document.querySelector(".add_img");
		let add_Stock_bar = document.querySelector(".add_Stock_bar");
		let cancel = document.querySelector("#cancel");
		let add_text = document.querySelector("#add_text");
		let cpu1 = document.querySelector(".cpu1");
		let item_name = document.querySelector(".item_name");
		let drop = document.querySelector(".drop");
		let choice_text = document.querySelector(".choice_text");
		let choice_textarea = document.querySelector(".choice_textarea");
		let pic1 = document.querySelector(".pic1");
		let pic2 = document.querySelector(".pic2");
		let pic3 = document.querySelector(".pic3");
		let ta_cpu1 = document.querySelector(".ta_cpu1");
		let ta_cpu2 = document.querySelector(".ta_cpu2");
		let ta_cpu3 = document.querySelector(".ta_cpu3");
		let count = document.querySelector(".count");
		let delete1 = document.querySelector(".delete1");
		let order = document.querySelector(".order");
		let RRN = document.querySelector(".RRN");
		let RRC = document.querySelector(".RRC");
		let modalOverlay = document.getElementById('modal-overlay');
		let requestModal = document.getElementById('request_result');
		let cancel_rr = document.querySelector(".cancel_rr");
		let image_box1 = document.querySelector(".image_box1");
		// let ta = document.querySelector(".ta");
		// let text_rr = document.querySelector(".text_rr");
		
		let lastbtn = 0;
		
		<%if ("WORKER".equals(role)) {%>
		document.querySelector('.add_Stock_bar').addEventListener('click', function () {
		    add_img.style.display = "inline-flex";
		    modalOverlay.style.display = 'flex';
		    lastbtn = this;
		});
		<%}%>

		// add_text를 누르면 ta.value를 text_rr에 전달
		cancel_rr.onclick = function () {
		    request_result.style.display = "none";
		    RRN.value = ""
		    RRC.value = ""
		}
		// 이 위가 window.onload

		// 새로 생성된 팝업창의 추가를 누를 때의 동작
		document.querySelector('.button_ac').addEventListener('click', function (event) {
			if (event.target.id === 'add_text') {
				add_img.style.display = "none";
				modalOverlay.style.display = 'none';
				let choiceValue = choice_text.value;
				
				let item_name = lastbtn.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.querySelector('.item_name');
				item_name.value = choiceValue;
				choice_text.value = "";
				
				// add_text를 누르면 ta.value를 text_rr에 전달
				// let taValue = document.querySelector('.ta').value;
				// let text_rr = lastbtn.parentNode.querySelector('.text_rr');
				let text_rr = lastbtn.closest('.row_RR1').querySelector('.text_rr');
				text_rr.innerText = choice_textarea.value;
				choice_textarea.value = "";

				// text_rr = choice_textarea.value;
				// console.log('눌리긴함');
				// console.log(choice_textarea.value);
				
				// 기존 것만 이미지 삽입 됨
				// sample_img의 src 속성값 가져오기
				let sampleImgSrc1 = document.querySelector('.sample_img').src;
				
				// image_box 요소의 배경 이미지로 설정
				let imageBox1 = lastbtn.parentNode.parentNode.parentNode.parentNode.parentNode.querySelector('.image_box1');
				imageBox1.style.backgroundImage = `url('${sampleImgSrc1}')`;
				imageBox1.style.backgroundSize = 'contain';
				imageBox1.style.backgroundRepeat = 'no-repeat';
				imageBox1.style.backgroundPosition = 'center';
			}
		});

		// 지움 버튼 누르면 재고명에 공백
		document.addEventListener('click', function (event) {
			if (event.target.classList.contains('drop')) {
				item_name = event.target.parentNode.parentNode.parentNode.parentNode.querySelector('.item_name');
				count = event.target.parentNode.parentNode.parentNode.parentNode.querySelector('.count');
				text_rr = event.target.parentNode.parentNode.parentNode.parentNode.querySelector('.text_rr');
				image_box1 = event.target.parentNode.parentNode.parentNode.parentNode.querySelector('.image_box1');
				
				// image_box 요소의 배경 이미지로 설정
				
				item_name.value = "";
				count.value = "0";
				text_rr.innerHTML = "";
				image_box1.style.backgroundImage = `url('')`;
			}
		});
		// 삭제 버튼을 누르면 새로 생성된 div 삭제
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

	// 미디어테그, 네비게이션바 조작
	const section = document.querySelector('section');
	hover.forEach(link => {
	    link.addEventListener("click", function (event) {
	        event.preventDefault();
	        if (nav.classList.contains('active') && window.matchMedia("(max-width: 430px)").matches) {
	            nav.style.height = `${section.offsetHeight}px`
	        }
	    });
	});
	
    // 미디어테그

    // if() {
    // document.querySelector("#mainTitle1").style.display = "block";
    // } else {
	// document.querySelector("#mainTitle2").style.display = "block";
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

	// document.querySelector("#adminTitle").style.display = 'block';
	// document.querySelector("#adminNav").style.display = 'block';
	// document.querySelector(".workerGrade").innerHTML = '작업자<br>';
	// document.querySelector(".workerGrade").innerHTML = '관리자<br>';
	// document.querySelector("#adminTitle").style.display = 'none';
	// document.querySelector("#adminNav").style.display = 'none';

    </script>
</body>

</html>