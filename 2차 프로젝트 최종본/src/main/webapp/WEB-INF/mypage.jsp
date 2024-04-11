<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="board.free.BoardDTO"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>마이페이지</title>
</head>
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
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/mypage.css">
<body>
	<%
	// 세션에서 권한 정보 가져오기
	session = request.getSession(false);
	String role = null;
	if (session != null) {
		role = (String) session.getAttribute("role");
	}
	%>
	<div class="myBox">
		<div id="myprofile">
			<div id="myprofliePic">
				<image src="${pageContext.request.contextPath}/images/bee_happy.png"
					class="mypic"></image>
				<div></div>
			</div>
			<div id="myprofilecard">
				<div id="mycard"></div>
				<span id="modify-profile">수정하기</span>
			</div>
			<div id="myprofilecontent">
				<div id="todayWork">
					<div class="absentTitle">
						휴가신청
						<button class="absentInfo" type="button">상세</button>
					</div>
					<table id="vacationTable">
						<thead>
							<tr>
								<th style="display: none;">직원번호</th>
								<th>기간</th>
								<th>사유</th>
								<th>상태</th>
							</tr>
						</thead>
						<tbody id="vacationTableBody">
							<%-- JavaScript를 통해 동적으로 채워질 부분 --%>
						</tbody>
					</table>
				</div>
				<div class="suggestBox">
					<div class="suggestTitle">
						건의사항
						<button class="suggestInfo" type="button">상세</button>
					</div>
					<div class="card-content">
						<div class="list">
							<!-- row는 행임 제목 영역에 제목 -->
							<div class="row">
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
								<div class="cell"><%=title%></div>
								<div class="cell"><%=formattedDate%></div>
								<div class="cell">X</div>
							</div>
							<%
							}
							%>
						</div>
					</div>
					<div id="vacationSchedule"></div>
				</div>
			</div>
		</div>
		<div class="calendar">
			<div class="header">
				<button class="calendar_btn" onclick="prevCal();">&lt;</button>
				<div class="title">
					<span class="year"></span><span class="month"></span>
				</div>
				<button class="calendar_btn" onclick="nextCal();">&gt;</button>
			</div>
			<div class="day">
				<div>S</div>
				<div>M</div>
				<div>T</div>
				<div>W</div>
				<div>T</div>
				<div>F</div>
				<div>S</div>
			</div>
			<div class="dates"></div>
		</div>
	</div>
	<button type="button" id="close-btn">닫기</button>
	<div class="vacation-word"></div>
	<button type="button" id="vacation-btn">휴가신청</button>

	<!-- 메일 팝업 -->
	<div id="mailPage" class="modal4">
		<div class="modal-content">
			<span id="closeMailBtn" class="x-button"></span>
			<div id="mailTable">
				<h3 style="text-align: center;">건의사항</h3>
				<table class="suggestTable">
					<thead>
						<tr>
							<th>제목</th>
							<th>작성일</th>
							<th>답변</th>
						</tr>
					</thead>
					<tbody>
						<%
						List<BoardDTO> list2 = (List<BoardDTO>) request.getAttribute("list");
						for (int i = 0; i < list2.size(); i++) {
							BoardDTO board = (BoardDTO) list2.get(i);

							int seq = board.getSeq();
							String title = board.getTitle();
							Date wDate = board.getWdate();
						%>
						<tr>
							<td><%=title%></td>
							<td><%=wDate%></td>
							<td>X</td>
						</tr>
					</tbody>
					<%
					}
					%>
				</table>
			</div>
		</div>
	</div>

	<!-- 메일 쓰기 팝업 -->
	<div id="mailWrite" class="modal5">
		<div class="modal-content" style="position: relative;">
			<span id="closeWriteBtn" class="close"><img
				src="https://cdn.discordapp.com/attachments/1185161279804026893/1201735089197957160/15287.png?ex=65cae604&is=65b87104&hm=e986c916b65b591d57dfc74b65c46d3425de849f447a26132c493960a55a129b&"></span>
			<img width="30" height="30"
				src="https://cdn.discordapp.com/attachments/1185161279804026893/1202848629878956052/mail-99218_640.png?ex=65cef315&is=65bc7e15&hm=42c1b645ea72a9b7e4a824c362af1060465ffd76b04acf05af7c6faa0b0c9420&">
			<div style="display: inline-block; position: absolute; top: 25px;">&nbsp;&nbsp;메일
				쓰기</div>

			<div id="mailWritePage">
				받는사람 : <input type="text"><br> <span
					style="display: inline-block; width: 30px;"></span>제목 : <input
					type="text"><br> <span
					style="display: inline-block; width: 30px;"></span>내용 : <br>
				<textarea type="text" cols="50" rows="10"></textarea>
			</div>
			<div class="write-btn-zip">
				<button type="button" id="apply-write-btn">쓰기</button>
				<button type="reset" id="delete-write-btn">취소</button>
			</div>
		</div>
	</div>


	<!-- 명함 수정 팝업 -->
	<div id="myModal" class="modal">
		<div class="modal-content">
			<span id="closeModalBtn" class="x-button"></span>
			<h2>정보 수정</h2>
			<div class="editList">
				<div>아이디</div>
				<input type="text" id="userId" placeholder="아이디 중복 불가">
				<div>비밀번호</div>
				<input type="text" id="password">
				<div>전화번호</div>
				<input type="text" id="tel" placeholder="ex)010-1234-5678">
				<div>이메일</div>
				<input type="text" id="email" placeholder="ex)jcompany@naver.com">
			</div>
			<div class="errorMessage"></div>
			<div class="btn-zip">
				<button type="button" id="apply-btn" name="action" value="update"
					onclick="updateAccount()">적용</button>
				<button type="reset" id="delete-btn">취소</button>
			</div>
		</div>
	</div>

	<!-- 오늘 할일 팝업 -->
	<div id="todayWorkPage" class="modal3">
		<div class="modal-content">
			<h3 style="text-align: center;">휴가 신청 내역</h3>
			<span id="closeWorkBtn" class="x-button"></span>
			<div class="todayWorkTable">
				<table id="vacationTable2">
					<thead>
						<tr>
							<th style="display: none;">직원번호</th>
							<th>기간</th>
							<th>사유</th>
							<th>상태</th>
						</tr>
					</thead>
					<tbody id="vacationTableBody2">
						<%-- JavaScript를 통해 동적으로 채워질 부분 --%>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<!-- 휴가 신청 팝업 -->
	<div id="vacationCard" class="modal2">
		<div class="modal-content">
			<span id="closeVacationBtn" class="x-button"></span>
			<h2>휴가 신청</h2>
			<div id="reasonZip">
				<div class="vacationReason">연차</div>
				<div class="vacationReason">월차</div>
				<div class="vacationReason">반차</div>
				<div class="vacationReason">포상</div>
				<div class="vacationReason">외출</div>
				<div class="vacationReason">기타</div>
			</div>
			<div id="vacationWeek"
				style="margin-left: 100px; width: 300px; text-align: left;"></div>
			<div style="margin-left: 100px">
				사유 : <input type="text" class="reasonBox">
			</div>
			<div class="vacation-btn-zip">
				<button type="button" id="applyVacationBtn">신청</button>
				<button type="reset" id="deleteVacationBtn">취소</button>
			</div>
		</div>
	</div>

	<!-- 지시 사항 팝업 -->
	<div id="orderPage" class="modal">
		<div class="modal-content">
			<span id="closeOrderBtn" class="x-button"></span>


		</div>
	</div>

	<!-- 지시 사항 작성 팝업 -->
	<div id="orderWritePage" class="modal6">
		<div class="modal-content">
			<span id="closeOrderWriteBtn" class="close"><img
				src="https://cdn.discordapp.com/attachments/1185161279804026893/1201735089197957160/15287.png?ex=65cae604&is=65b87104&hm=e986c916b65b591d57dfc74b65c46d3425de849f447a26132c493960a55a129b&"></span>
			<div>
				<span style="width: 30px; display: inline-block;"></span>제목 : <input
					type="text" class="orderWriteTitle"><br> 지시사항 : <br>
				<textarea cols="50" rows="10"></textarea>
			</div>
			<div class="orderWriteZip">
				<button type="button" id="orderWriteApplyBtn">적용</button>
				<button type="reset" id="orderWriteCancelbtn">취소</button>
			</div>
		</div>
	</div>
	<div id="modal-background2" class="modal-background2"
		style="display: none;">
		<!-- 모달 컨텐츠 -->
		<div class="modal-content2">
			<p id="modal-text2"></p>
			<span class="close-button2">&times;</span>
		</div>
	</div>
</body>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"
	charset="UTF-8"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/mypage.js" charset="UTF-8"></script>

</html>