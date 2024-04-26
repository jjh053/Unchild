
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*"%>
<%@ page import="com.mes.project.ldy.dto.BoardDTO"%>
<%@ page import="java.time.LocalDateTime"%>
<%@ page import="java.time.format.DateTimeFormatter"%>


<!DOCTYPE html>

<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Freedom_Table Page</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bt.css">
<style>
#updateFileName {
	font-size: 12px;
}

#fileAddDiv {
	text-align: left;
	margin: 10px;
	margin-left: 35px;
}

#file-button {
	text-align: center;
	display: inline-block;
	background-color: #3498DB;
	width: 80px;
	height: 40px;
	line-height: 40px;
	border-radius: 5px;
	cursor: pointer;
	color: #fff;
	border: 0;
	font-size: 12px;
}

.pagingN a {
	color: #000;
	text-decoration: none;
}

.pagingN a:hover {
	color: blue;
	transition: color 0.2s ease;
}

.pagingGroup {
	list-style-type: none;
	padding: 0;
	margin: 0;
	display: flex;
	justify-content: center;
	align-items: center;
}

.pagingGroup li {
	display: flex;
	justify-content: center;
	align-items: center;
}
</style>

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
		Integer staffnoObj = (Integer) session.getAttribute("empno");
		staffno = (staffnoObj != null) ? staffnoObj.intValue() : 0;
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
				<ul>
					<li><a href="boardTable.do?boardType=자유게시판">자유게시판</a></li>
					<li><a href="boardTable.do?boardType=건의게시판">건의사항</a></li>
					<li><a href="boardTable.do?boardType=QaA게시판">Q&A</a></li>
				</ul>
			</aside>
			<section>
				<div style="text-align: center; margin-top: 30px;">
					<h2>Q & A</h2>
				</div>
				<div class="search-container">
					<input type="text" class="search_text" placeholder="Search...">
					<img width="25" height="25" src="/mes_project/images/search.png"
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
						<c:forEach var="board" items="${list}">
							<tr class="noticeTr">
								<td style="display: none" id="userIdWrite">${board.staffno }</td>
								<td>${board.boardType }</td>
								<td class="tableTdTitle" data-seq="${board.b_sequence }"
									onclick="countPlus(${board.b_sequence })">${board.b_title }</td>
								<td style="display: none;"><textarea class="contentBox">${board.b_content }</textarea></td>
								<td class="writer">${board.sname }</td>
								<td>${board.b_date }</td>
								<td class="viewCount">${board.b_view }</td>
								<td class="hiddenTd">
									<!-- 삭제 버튼 -->
									<button type="button" name="${board.b_sequence }"
										class="deleteBtn" onclick="deletePost(${board.b_sequence })">삭제</button>
								</td>
							</tr>
						</c:forEach>
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
				<div class="pagingNBox">
					<!--  페이징paging -->
					<div class="pagingN" style="text-align: center;">
						<%
						int totalCount = 0;
						int countPerPage = 0;
						int pageNum = 0;

						Integer ttc = (Integer) request.getAttribute("totalCount");
						if (ttc != null) {
							totalCount = ttc;
						}
						Integer cpp = (Integer) request.getAttribute("countPerPage");
						if (cpp != null) {
							countPerPage = cpp;
						}
						Integer pn = (Integer) request.getAttribute("pageNum"); // 현재 페이지
						if (pn != null) {
							pageNum = pn;
						}

						int lastPage = (int) Math.ceil((double) totalCount / countPerPage);

						int countPerSection = 3; // 페이징 그룹 : 한번에 보여줄 페이지의 개수

						int sec_position = (int) Math.ceil((double) pageNum / countPerSection);

						System.out.println("pageNum : " + pageNum); // 현재 페이지
						System.out.println("sec_position : " + sec_position); // 1
						System.out.println("lastPage : " + lastPage); // 6

						int sec_first = (sec_position - 1) * countPerSection + 1;
						int sec_last = sec_position * countPerSection;

						System.out.println("sec_first : " + sec_first); // 1
						System.out.println("sec_last : " + sec_last); // 3

						if (sec_last > lastPage) {
							sec_last = lastPage; //현재페이지가 마지막페이지보다 크다면 그 페이지를 현재페이지가 되게 하겠다
						}
						%>

						<c:set var="lastPage" value="<%=lastPage%>" />
						<c:set var="start" value="<%=sec_first%>" />
						<c:set var="end" value="<%=sec_last%>" />


						<input type="hidden" class="pageNumV" value="${pageNum}">
						<ul class="pagingGroup">
							<c:if test="${pageNum != 1}">
								<li><a
									href="${pageContext.request.contextPath}/boardTable.do?pageNum=${start - 1 }&boardType=자유게시판"">[이전]</a></li>
							</c:if>
							<c:if test="${pageNum == 1}">
								<li>[이전]</li>
							</c:if>


							<c:forEach var="i" begin="${start}" end="${end}">
								<input type="hidden" class="iValue" value="${i}">
								<c:choose>
									<c:when test="${i != pageNum}">
										<li>[
											<div class="ipValue1">
												<a
													href="${pageContext.request.contextPath}/boardTable.do?pageNum=${i}&boardType=자유게시판">${i}</a>
											</div>]
										</li>
									</c:when>
									<c:otherwise>
										<li>[
											<div style="color: blue; font-size: 18px;">
												<u>${i}</u>
											</div>]
										</li>
									</c:otherwise>
								</c:choose>
							</c:forEach>

							<c:if test="${pageNum != lastPage}">
								<ll>
								<a
									href="${pageContext.request.contextPath}/boardTable.do?pageNum=${end + 1}&boardType=자유게시판">[다음]</a></ll>
							</c:if>
							<c:if test="${pageNum == lastPage}">
								<li>[다음]</li>
							</c:if>
						</ul>
					</div>
					<form method="post" action="doi" enctype="multipart/form-data">
						<div id="writeDiv">
							<div class="whiteBoard">
								<div>
									<span style="font-size: 20px; font-weight: bold;">글 작성</span>
								</div>
								<table id="writeTable">
									<tr>
										<td style="display: none"><input type="text"
											name="boardType" value="자유게시판"></td>
										<td style="display: none"><input type="text" name="sname"
											value="<%=userId%>"></td>
										<td style="display: none"><input type="text"
											name="b_view" value="0"></td>
										<td style="display: none"><input type="text"
											name="b_date" valuse="" id="nowTime"></td>
										<td style="display: none"><input type="text"
											name="staffno" value="<%=staffno%>"></td>
									</tr>
									<tr>
										<th>제목</th>
										<td><input type="text" id="writeTitle" name="b_title">
										</td>
									</tr>
									<tr>
										<th>내용</th>
										<td><textarea id="textBox" rows="10" cols="55"
												name="b_content"></textarea></td>
									</tr>
								</table>
								<div id="fileAddDiv">
									<input type="file" name="imgFileName" id="fileAddBtn"
										style="display: none"> <label for="fileAddBtn"
										id="file-button"> 파일 선택 </label> <span id="updateFileName">선택된
										파일 없음</span>
								</div>
								<div class="wrtieBtnZip">
									<button type="submit" id="clearWrite">작성</button>
									<button type="button" id="resetWrite">취소</button>
								</div>
							</div>
						</div>
					</form>

					<form method="GET" action="dou">
						<div id="myModal" class="modal2">
							<div class="modal-content" style="height: 50%;">
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
										<td><textarea id="textContentBox" name="content"
												rows="10" cols="53" readonly></textarea></td>
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
				let seq = event.target.getAttribute('data-seq');
				console.log(seq);
				
				document.querySelector("[name=replyId]").value = seq;
				console.log(document.querySelector("[name=replyId]").value);
				
			})
		}
		document.querySelector("#reflySend").addEventListener("click", () => {
			doAjax();
		})
		
		function doAjax() {
			let xhr = new XMLHttpRequest();
			xhr.open("post", "doi", true);
			xhr.setRequestHeader("Content-Type", "application/json");

			
			let param = {
					b_title : "댓글",
					b_content : document.querySelector("[id=b_content_ajax]").value,
					staffno : document.querySelector("[name=staffno]").value,
					b_view : 0,
					boardType : '댓글',
					replyId : document.querySelector("[name=replyId]").value
			};
			
			console.log(param);
			
			xhr.send(JSON.stringify(param));
			
			xhr.onload = function() {
				let data = xhr.responseText;
				console.log("data : " + data);
			}
		}

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
		
		let fileAddBtn = document.querySelector("#fileAddBtn");
		let fileNameDisplay = document.getElementById('updateFileName');
		
		fileAddBtn.addEventListener('change', function (event) {
	        event.stopPropagation();
	        event.preventDefault();

	        let selectedFile = event.target.files && event.target.files.length > 0 ? event.target.files[0] : null; // 수정된 부분

	        if (selectedFile) {
	            fileNameDisplay.textContent = selectedFile.name;
	            displayImagePreview(selectedFile);
	        } else {
	            fileNameDisplay.textContent = '선택된 파일 없음';
	            img_preview.innerHTML = '이미지 없음';
	        }
	    });

		
	</script>
	<script src="${pageContext.request.contextPath}/js/bt.js"></script>
</body>

</html>