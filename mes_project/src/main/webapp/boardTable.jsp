<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="board.free.BoardDTO"%>
<%@ page import="java.time.LocalDateTime"%>
<%@ page import="java.time.format.DateTimeFormatter"%>


<!DOCTYPE html>

<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Freedom_Table Page</title>
<link rel="stylesheet" href="css/bt.css">

</head>

<body>
	<%
	// 세션에서 권한 정보 가져오기
	session = request.getSession(false);
	String role = null;
	String userId = null;
	int staffno = 0;
	if (session != null) {
		role = (String) session.getAttribute("role");
		userId = (String) session.getAttribute("user");
		staffno = (int) session.getAttribute("empno");
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
			<a href="#"> 
				<img src="${pageContext.request.contextPath}/images/logo.png" class="logo">
			</a>
		</div>
		<h1 id="mainTitle">
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
					<li><a href="#" class="hover"
						title="품질검사">설비</a></li>
					<li><a href="#" class="hover" title="건의사항">재고관리</a></li>
					<%
					if ("ADMIN".equals(role)) {
					%>
					<li id="adminTitle"><a href="#"
						class="hover" title="직원관리">직원관리</a></li>
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
							<li><a href="dot?boardType=건의게시판"">건의사항</a></li>
							<li><a href="dot?boardType=QaA게시판"">Q&A</a></li>
						</ul>
					</div>
				</div>
			</nav>
		</div>	
		
		
		<div class="aside-section-container">
			<aside>
				<ul>
					<li><a href="dot?boardType=자유게시판">자유게시판</a></li>
					<li><a href="dot?boardType=건의게시판">건의사항</a></li>
					<li><a href="dot?boardType=QaA게시판">Q&A</a></li>
				</ul>
			</aside>
			<section>
				<div style="text-align: center; margin-top: 30px;">
					<h2>자유게시판</h2>
				</div>
				<div class="search-container">
					<input type="text" class="search_text" placeholder="Search...">
					<img width="25" height="25"
						src="/mes_project/images/search.png"
						alt="Search" class="glasses">
				</div>
				<table id="boardTable">
					<thead>
						<tr style="background-color: #ddd;">
							<th width="50">No.</th>
							<th width="330">제목</th>
							<th width="85">작성자</th>
							<th width="170">작성일</th>
							<th width="76">조회수</th>
							<th id="deleteTH" border="0">삭제</th>
						</tr>
					</thead>
					<tbody id="tableBody">
						<%
						try {
							List list = (List) request.getAttribute("list");
							System.out.println("list.size() : " + list.size());
							for (int i = 0; i < list.size(); i++) {
								BoardDTO board = (BoardDTO) list.get(i);

								String boardType = board.getBoardType();
								int seq = board.getSeq();
								String userDBId = board.getUserId();
								String title = board.getTitle();
								String content = board.getContent();
								String writer = board.getWriter();
								Date wDate = board.getWdate();
								int viewCount = board.getHits();
						%>
						<tr class="noticeTr">
							<td style="display: none" id="userIdWrite"><%=userDBId%></td>
							<td><%=boardType.replace("게시판", "")%></td>
							<td class="tableTdTitle" data-seq="<%=seq%>"
								onclick="countPlus(<%=seq%>)"><%=title%></td>
							<td style="display: none;"><textarea class="contentBox"><%=content%></textarea></td>
							<td class="writer"><%=writer%></td>
							<td><%=wDate%></td>
							<td class="viewCount"><%=viewCount%></td>
							<td class="hiddenTd">
								<!-- 삭제 버튼 -->
								<button type="button" name="<%=seq%>" class="deleteBtn"
									onclick="deletePost(<%=seq%>)">삭제</button>
							</td>
						</tr>
						<%
						}
						} catch (Exception e) {
						System.out.println("에러");
						e.printStackTrace();
						}
						%>
					</tbody>
				</table>
				<div class="button-zip">
					<%
					if ("ADMIN".equals(role)) {
					%>
					<button type="button" id="deleteWriteBtn">글삭제</button>
					<button type="button" id="deleteWriteBtn2">취소</button>
					<%
					}
					%>
					<button type="button" id="writeBtn">글쓰기</button>
				</div>
				<div id="directBtnZip">
					<button type="button" class="directBtn">&lt;&lt;</button>
					<button type="button" class="directBtn">&lt;</button>
					<button type="button" class="numberBtn" style="margin-left: 20px;">1</button>
					<button type="button" class="numberBtn" style="margin-right: 20px;">2</button>
					<button type="button" class="directBtn">&gt;</button>
					<button type="button" class="directBtn">&gt;&gt;</button>
				</div>
				<form method="GET" action="doi">
					<div id="writeDiv">
						<div class="whiteBoard">
							<div>
								<span style="font-size: 20px; font-weight: bold;">글 작성</span>
							</div>
							<table id="writeTable">
								<tr>
									<td style="display: none"><input type="text" name="boardType"
										value="자유게시판"></td>
									<td style="display: none"><input type="text" name="writer"
										value="${sessionScope.staffno}"></td>
									<td style="display: none"><input type="text" name="hits"
										value="0"></td>
									<td style="display: none"><input type="text" name="wdate"
										value="" id="nowTime"></td>
									<td style="display: none"><input type="text" name="userId"
										value="<%=userId%>"></td>
								</tr>
								<tr>
									<th width="100">제목</th>
									<td><input type="text" id="writeTitle" name="title"></td>
								</tr>
								<tr>
									<th>내용</th>
									<td><textarea id="textBox" rows="10" cols="60"
											name="content"></textarea></td>
								</tr>
							</table>
							<div class="wrtieBtnZip">
								<button type="submit" id="clearWrite">작성</button>
								<button type="button" id="resetWrite">취소</button>
							</div>
						</div>
					</div>
				</form>

				<form method="GET" action="dou">
					<div id="myModal" class="modal">
						<div class="modal-content">
							<span id="closeModalBtn" class="x-button"></span>
							<table id="readTable">
								<tr style="display: none">
									<td><input type="hidden" id="seq" name="seq" value=""></td>
								</tr>
								<tr>
									<th width="70">제목</th>
									<td><input type="text" id="readTitle" name="title"
										readonly></td>
								</tr>
								<tr>
									<th height="30">작성자</th>
									<td><input type="text" id="writer" name="writer" readonly></td>
								</tr>
								<tr>
									<th>내용</th>
									<td><textarea id="textContentBox" name="content" rows="10"
											cols="35" readonly></textarea></td>
								</tr>
							</table>
							<div class="btnZip">
								<button type="button" id="crystalBtn">수정</button>
								<button type="submit" id="jewelerBtn">수정완료</button>
								<button type="button" id="delBtn">삭제</button>
							</div>
						</div>
					</div>
				</form>
			</section>
		</div>
		<footer>ⓒ2024 J.company System</footer>
	</div>
	<script>
		let userRole = '<%=role%>';
		let writeId = '<%=userId%>';

		let ttr = document.querySelectorAll(".tableTdTitle");
		let delBtn2nd = document.querySelector("#delBtn");
		
		for(let i=0; i<ttr.length; i++) {
			ttr[i].addEventListener("click", (event) => {
				let userId = event.currentTarget.closest("tr").querySelector("#userIdWrite").innerText;

				console.log("userId : " + userId);
				let seqValue = event.target.getAttribute('data-seq');
				if(userId == writeId && userId != null) {
					document.querySelector("#delBtn").style.display = "inline";
				} else {
					document.querySelector("#delBtn").style.display = "none";
				}
	            console.log("seqValue : " + seqValue);
	            console.log("delBtn2nd : " + delBtn2nd.parentNode.innerHTML);
				
	            delBtn2nd.onclick = function() {
	            	console.log("seqValue2 : " + seqValue);
	            	let boardTypeName = document.querySelector('input[name="boardType"]');
	            	let boardType = boardTypeName.value;
	            	window.location.href = "dod?seq=" + seqValue + "&boardType=" + boardType;
	            	console.log("seqValue2 : " + seqValue);
	            };
			})
		}
		if(userRole != null && userRole == "ADMIN") {
			document.querySelector("#deleteWriteBtn").addEventListener("click", () => {
				document.querySelector("#deleteWriteBtn").style.display = "none";
				document.querySelector("#deleteWriteBtn2").style.display = "inline";
	
				let hiddenTd = document.querySelectorAll(".hiddenTd");
				document.querySelector("#deleteTH").style.display = "table-cell";
				for (let i = 0; i < hiddenTd.length; i++) {
					hiddenTd[i].style.display = "table-cell";
				}
			});
	
			document.querySelector("#deleteWriteBtn2").addEventListener("click", () => {
				document.querySelector("#deleteWriteBtn").style.display = "inline";
				document.querySelector("#deleteWriteBtn2").style.display = "none";
	
				let hiddenTd = document.querySelectorAll(".hiddenTd");
				document.querySelector("#deleteTH").style.display = "none";
				for (let i = 0; i < hiddenTd.length; i++) {
					hiddenTd[i].style.display = "none";
				}
			})
			
		}

		
	</script>
	<script src="js/bt.js"></script>
</body>

</html>