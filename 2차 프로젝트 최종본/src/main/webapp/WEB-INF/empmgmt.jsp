<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>직원 관리</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/empmgmt.css">
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
<body>
	<%
	// 세션에서 권한 정보 가져오기
	session = request.getSession(false);
	String role = null;
	if (session != null) {
		role = (String) session.getAttribute("role");
	}

	if (!"ADMIN".equals(role)) {
		response.sendRedirect("main");
		return;
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
<!--                      <li><a href="facilityMonitoring.html">설비 모니터링</a></li> -->
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
				<!-- aside 영역내에 메뉴 추가 가능함 -->

				<div id="left-nav">
					<ul>
						<li><a href="emp">직원목록</a></li>
						<li><a href="account">권한관리</a></li>
						<li><a href="updateabsent">휴가신청</a></li>
					</ul>
				</div>

			</aside>
			<section>
				<article>
					<h1 class="management">직원목록</h1>
					<div class="buttonBox">
						<div class="searchEmpBox">
							<input type="text" class="search_text" placeholder="직원 검색...">
							<button class="glasses">검색</button>
						</div>
						<div class="buttons">
							<div class="edit_button">목록수정</div>
							<div class="add_button">직원추가</div>
						</div>
					</div>
					<table class="Staff_list">
						<thead>
							<tr>
								<th class="column1">직원번호</th>
								<th class="column2">성명</th>
								<th class="column3">채용날짜</th>
								<th class="column4">직책</th>
								<th class="column5">연봉</th>
								<th class="column6">부서 번호</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="emp" items="${empList}">
								<tr>
									<td><c:out value="${emp.empno}" /></td>
									<td><c:out value="${emp.name}" /></td>
									<td><c:out value="${emp.hiredate}" /></td>
									<td><c:out value="${emp.duty}" /></td>
									<td><c:out value="${emp.sal}" /></td>
									<td><c:out value="${emp.deptno}" /></td>
								</tr>
							</c:forEach>
							<!-- 추가 직원 정보 행 -->
						</tbody>
					</table>
					<div class="editMessage" style="text-align: center;"></div>
					<c:if test="${not empty errorMessage}">
						<div style="color: red; text-align: center;" id="error-message">${errorMessage}</div>
					</c:if>

					<!-- <div class="delete_button2"> 삭제하기 </div> -->

				</article>
			</section>
		</div>
		<footer>ⓒ2024 J.company System</footer>
	</div>
	<%-- 팝업 --%>
	<div class="modal-overlay" id="modal-overlay" style="display: none;">
		<div class="popup">
			<div class="Employee_atomic_information">
				<!-- 상단 : 정보 -->
				<div class="eai">
					<h2>목록 수정</h2>
					<div style="text-align: left;" class="searchBox">
						<label for="SearchEmpNo">직원번호 검색</label> <input type="text"
							id="SearchEmpNo" name="SearchEmpNo">
						<button type="submit" name="action" value="search" class="search"
							onclick="searchEmployee()">조회</button>
						<div class="searchMessage"></div>
					</div>
					<div class="editInput">
						<div>
							<div class="editError"></div>
							<div>
								<label for="editName">성명</label> <input type="text"
									id="editName" name="editName" value="${employee.name}"
									data-original="${employee.name}">
							</div>
							<div>
								<label for="editDuty">직책</label> <input type="text"
									id="editDuty" name="editDuty" value="${employee.duty}"
									data-original="${employee.duty}">
							</div>
							<div>
								<label for="editSal">연봉</label> <input type="text" id="editSal"
									name="editSal" value="${employee.sal}"
									data-original="${employee.sal}">
							</div>
							<div>
								<label for="editDeptno">부서 번호</label> <input type="text"
									id="editDeptno" name="editDeptno" value="${employee.deptno}"
									data-original="${employee.deptno}">
							</div>
						</div>
						<div class="editFailMessage"></div>
						<!-- 하단 : 버튼 -->
						<div class="eaib">
							<div class="Employee_atomic_infor_button">
								<button type="submit" class="edit" name="action" value="edit">수정하기</button>
								<button type="submit" div class="delete" name="action"
									value="delete" onclick="deleteEmployee()">삭제하기</button>
								<div class="cancel">취소하기</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<%-- 팝업2 --%>
		<div class="popup2">
			<div class="Employee_atomic_information2">
				<!-- 상단 : 정보 -->
				<div class="eai2">
					<div class="addStaff">
						<h3>직원 추가</h3>
						<form id="addEmpForm" action="/mes_project/emp" method="POST"
							onsubmit="return validateForm();">
							<div>
								<label for="ename">성명</label> <input type="text" id="ename"
									name="ename">
								<div class="error2"></div>
							</div>
							<div>
								<label for="hireDate"
									class="block text-sm font-medium text-gray-700">채용일자</label> <input
									type="date" id="hireDate" name="hireDate"
									class="mt-1 block w-full border-gray-300 rounded-md shadow-sm">
								<div class="error3"></div>
							</div>
							<div>
								<label for="job">직책</label> <input type="text" id="job"
									name="job">
								<div class="error4"></div>
							</div>
							<div>
								<label for="sal">연봉</label> <input type="text" id="sal"
									name="sal">
								<div class="error5"></div>
							</div>
							<div>
								<label for="deptno">부서 번호</label> <select id="deptno"
									name="deptno">
									<option value="1001">1001</option>
									<option value="2002">2002</option>
									<option value="3003">3003</option>
								</select>
								<div class="error6"></div>
							</div>
							<div class="eaib2">
								<button type="submit" class="add_eaib" name="action" value="add">추가</button>
								<div class="cancel2">취소</div>
							</div>
						</form>
					</div>
					<!-- 하단 : 버튼 -->
				</div>
			</div>
		</div>
	</div>

	<script src="${pageContext.request.contextPath}/js/empmgmt.js"></script>
	<script>
		
	</script>

</body>

</html>