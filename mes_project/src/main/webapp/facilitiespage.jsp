<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="option.GradeDTO"%>
<%@ page import="option.StockDTO"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Facilities Page</title>
<link rel="stylesheet" href="css/facilitiespage.css">

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
	<form action="option" method="GET">
		<div id="workerTitle">
			<div id="workerLogo">
				<a href="#"> <img
					src="${pageContext.request.contextPath}/images/logo.png"
					class="logo">
				</a>
			</div>
			<h1 id="mainTitle">
				<a href="main"><%=displayTitle%></a>
			</h1>
			<div id="myPage">
				<div id="myPageLogo">
					<image
						src="${pageContext.request.contextPath}/images/bee_happy.png"
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
								<li><a href="monitor">공정도</a></li>
								<li><a href="grade">설비 설정</a></li>
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
						<li><a href="monitor">공정도</a></li>
						<li><a href="grade">설비설정</a></li>
					</ul>
				</aside>
				<section>
					<h1 style="text-align: center; font-size: 30px; margin-top: 40px">설비
						설정</h1>
					<div class="options-container">
						<div class="lego-option">
							<div style="padding: 0">
								1번<br>라인<input type="hidden" name="createLine" value="1">
							</div>
							<div>
								<select name="selectGrade" class="cpu-option">
									<%
									try {
										List<GradeDTO> list = (List<GradeDTO>) request.getAttribute("list");
										System.out.println("list.size() : " + list.size()); // 3 정상작동
										for (int i = 0; i < list.size(); i++) {
											GradeDTO grade = (GradeDTO) list.get(i);

											int gradeNum = grade.getGradeNum();
											String gradeName = grade.getGradeName();
									%>
									<option value="<%=gradeNum%>"><%=gradeName%></option>
									<%
									}
									} catch (Exception e) {
									e.printStackTrace();
									}
									%>
								</select>
							</div>
							<div style="position: relative; padding-right: 0">
								<span class="inputCount">개수 : </span><input class="countInput"
									type="number" name="count" max="100" min="0" value="0">
							</div>
							<div class="stockZip">
								<!-- 								<input type="text" value="GPU" readonly> -->
								<!-- 								<input type="text" value="SSD" readonly> -->
								<!-- 								<input type="text" value="RAM" readonly> -->
							</div>
							<div class="processOption">
								<div class="tempOption">옵션을 선택하세요.</div>
							</div>
							<div id="lego_button">
								<button type="button" class="change-option">선택</button>
								<br>
								<button type="button" class="delete-option-btn">삭제</button>
							</div>
						</div>
						<div id="optionpage-option-select-page">
							<h2>옵션 변경 PAGE</h2>
							<div id="optionpage-option-select-box">
								<div class="parent-div">
									<input type="checkbox" class="option-delete-box"> <input
										type="text" readonly value="GPU"
										class="optionpage-lego-option"> <select
										class="optionpage-lego-option-select1">
										<%
										try {
											List<StockDTO> list2 = (List<StockDTO>) request.getAttribute("list2");
											for (int i = 0; i < list2.size(); i++) {
												if ("GPU".equals(list2.get(i).getStockID())) {
											StockDTO stock = (StockDTO) list2.get(i);
											String stockName = stock.getStockName();
											int stockCount = stock.getStockCount();
											String stockID = stock.getStockID();
										%>
										<option value="<%=stockName%>" name="gpu"><%=stockName%></option>
										<%
										}
										}
										} catch (Exception e) {
										e.printStackTrace();
										}
										%>
									</select>
								</div>
								<div class="parent-div">
									<input type="checkbox" class="option-delete-box"> <input
										type="text" readonly value="SSD"
										class="optionpage-lego-option"> <select
										class="optionpage-lego-option-select2">
										<%
										try {
											List<StockDTO> list2 = (List<StockDTO>) request.getAttribute("list2");
											for (int i = 0; i < list2.size(); i++) {
												if ("SSD".equals(list2.get(i).getStockID())) {
											StockDTO stock = (StockDTO) list2.get(i);
											String stockName = stock.getStockName();
											int stockCount = stock.getStockCount();
											String stockID = stock.getStockID();
										%>
										<option value="<%=stockName%>" name="ssd"><%=stockName%></option>
										<%
										}
										}
										} catch (Exception e) {
										e.printStackTrace();
										}
										%>
									</select>
								</div>
								<div class="parent-div">
									<input type="checkbox" class="option-delete-box"> <input
										type="text" readonly value="RAM"
										class="optionpage-lego-option"> <select
										class="optionpage-lego-option-select3">
										<%
										try {
											List<StockDTO> list2 = (List<StockDTO>) request.getAttribute("list2");
											for (int i = 0; i < list2.size(); i++) {
												if ("RAM".equals(list2.get(i).getStockID())) {
											StockDTO stock = (StockDTO) list2.get(i);
											String stockName = stock.getStockName();
											int stockCount = stock.getStockCount();
											String stockID = stock.getStockID();
										%>
										<option value="<%=stockName%>" name="ram"><%=stockName%></option>
										<%
										}
										}
										} catch (Exception e) {
										e.printStackTrace();
										}
										%>
									</select> <select class="optionpage-lego-option-select4"
										style="display: none">
										<%
										try {
											List<StockDTO> list2 = (List<StockDTO>) request.getAttribute("list2");
											for (int i = 0; i < list2.size(); i++) {
												if ("CPU".equals(list2.get(i).getStockID())) {
											StockDTO stock = (StockDTO) list2.get(i);
											String stockName = stock.getStockName();
											int stockCount = stock.getStockCount();
											String stockID = stock.getStockID();
										%>
										<option value="<%=stockName%>" name="cpu"><%=stockName%></option>
										<%
										}
										}
										} catch (Exception e) {
										e.printStackTrace();
										}
										%>
									</select> <select class="optionpage-lego-option-select5"
										style="display: none">
										<%
										try {
											List<StockDTO> list2 = (List<StockDTO>) request.getAttribute("list2");
											for (int i = 0; i < list2.size(); i++) {
												if ("쿨러".equals(list2.get(i).getStockID())) {
											StockDTO stock = (StockDTO) list2.get(i);
											String stockName = stock.getStockName();
											int stockCount = stock.getStockCount();
											String stockID = stock.getStockID();
										%>
										<option value="<%=stockName%>" name="쿨러"><%=stockName%></option>
										<%
										}
										}
										} catch (Exception e) {
										e.printStackTrace();
										}
										%>
									</select> <select class="optionpage-lego-option-select6"
										style="display: none">
										<%
										try {
											List<StockDTO> list2 = (List<StockDTO>) request.getAttribute("list2");
											for (int i = 0; i < list2.size(); i++) {
												if ("메인보드".equals(list2.get(i).getStockID())) {
											StockDTO stock = (StockDTO) list2.get(i);
											String stockName = stock.getStockName();
											int stockCount = stock.getStockCount();
											String stockID = stock.getStockID();
										%>
										<option value="<%=stockName%>" name="메인보드"><%=stockName%></option>
										<%
										}
										}
										} catch (Exception e) {
										e.printStackTrace();
										}
										%>
									</select> <select class="optionpage-lego-option-select7"
										style="display: none">
										<%
										try {
											List<StockDTO> list2 = (List<StockDTO>) request.getAttribute("list2");
											for (int i = 0; i < list2.size(); i++) {
												if ("파워".equals(list2.get(i).getStockID())) {
											StockDTO stock = (StockDTO) list2.get(i);
											String stockName = stock.getStockName();
											int stockCount = stock.getStockCount();
											String stockID = stock.getStockID();
										%>
										<option value="<%=stockName%>" name="파워"><%=stockName%></option>
										<%
										}
										}
										} catch (Exception e) {
										e.printStackTrace();
										}
										%>
									</select>
								</div>
							</div>
							<div class="optionpage-button">
								<button type="button" class="optionpage-add-option-btn">추가</button>
								<button type="button" class="optionpage-delete-option-btn">삭제</button>
								<button type="button" class="optionpage-delete-option-real-btn">삭제</button>
							</div>
							<div class="optionpage-button-zip">
								<button type="button" class="optionpage-application-btn">적용</button>
								<div class="optionpage-spacebar-btn"></div>
								<button type="button" class="optionpage-delete-btn">취소</button>
							</div>
							<div id="detail-option-select" class="modal">
								<div class="modal-content">
									<span id="closeDetailBtn" class="x-button"> 
									
									</span>
									<h2>세부 옵션 선택</h2>
									<p>
										<select class="detail-title-value">
											<option selected>옵션 선택</option>
											<option value="GPU" name="GPU">GPU</option>
											<option value="SSD" name="SSD">SSD</option>
											<option value="RAM" name="RAM">RAM</option>
											<option value="CPU" name="CPU">CPU</option>
											<option value="쿨러" name="쿨러">쿨러</option>
											<option value="메인보드" name="메인보드">메인보드</option>
											<option value="파워" name="파워">파워</option>
										</select> <select class="detail-content-value-gpu">
											<%
											try {
												List<StockDTO> list2 = (List<StockDTO>) request.getAttribute("list2");
												for (int i = 0; i < list2.size(); i++) {
													StockDTO stock = (StockDTO) list2.get(i);
													String stockName = null;
													int stockCount = -1;
													String stockID = null;

													if ("GPU".equals(list2.get(i).getStockID())) {
												stock = (StockDTO) list2.get(i);
												stockName = stock.getStockName();
												stockCount = stock.getStockCount();
												stockID = stock.getStockID();
											%>
											<option value="<%=stockName%>" name="gpu"><%=stockName%></option>
											<%
											}
											}
											} catch (Exception e) {
											e.printStackTrace();
											}
											%>
										</select> <select class="detail-content-value-ssd">
											<%
											try {
												List<StockDTO> list2 = (List<StockDTO>) request.getAttribute("list2");
												for (int i = 0; i < list2.size(); i++) {
													StockDTO stock = (StockDTO) list2.get(i);
													String stockName = null;
													int stockCount = -1;
													String stockID = null;

													if ("SSD".equals(list2.get(i).getStockID())) {
												stock = (StockDTO) list2.get(i);
												stockName = stock.getStockName();
												stockCount = stock.getStockCount();
												stockID = stock.getStockID();
											%>
											<option value="<%=stockName%>" name="ssd"><%=stockName%></option>
											<%
											}
											}
											} catch (Exception e) {
											e.printStackTrace();
											}
											%>
										</select> <select class="detail-content-value-ram">
											<%
											try {
												List<StockDTO> list2 = (List<StockDTO>) request.getAttribute("list2");
												for (int i = 0; i < list2.size(); i++) {
													StockDTO stock = (StockDTO) list2.get(i);
													String stockName = null;
													int stockCount = -1;
													String stockID = null;

													if ("RAM".equals(list2.get(i).getStockID())) {
												stock = (StockDTO) list2.get(i);
												stockName = stock.getStockName();
												stockCount = stock.getStockCount();
												stockID = stock.getStockID();
											%>
											<option value="<%=stockName%>" name="ram"><%=stockName%></option>
											<%
											}
											}
											} catch (Exception e) {
											e.printStackTrace();
											}
											%>
										</select> <select class="detail-content-value-cpu">
											<%
											try {
												List<StockDTO> list2 = (List<StockDTO>) request.getAttribute("list2");
												for (int i = 0; i < list2.size(); i++) {
													StockDTO stock = (StockDTO) list2.get(i);
													String stockName = null;
													int stockCount = -1;
													String stockID = null;

													if ("CPU".equals(list2.get(i).getStockID())) {
												stock = (StockDTO) list2.get(i);
												stockName = stock.getStockName();
												stockCount = stock.getStockCount();
												stockID = stock.getStockID();
											%>
											<option value="<%=stockName%>" name="cpu"><%=stockName%></option>
											<%
											}
											}
											} catch (Exception e) {
											e.printStackTrace();
											}
											%>
										</select> <select class="detail-content-value-쿨러">
											<%
											try {
												List<StockDTO> list2 = (List<StockDTO>) request.getAttribute("list2");
												for (int i = 0; i < list2.size(); i++) {
													StockDTO stock = (StockDTO) list2.get(i);
													String stockName = null;
													int stockCount = -1;
													String stockID = null;

													if ("쿨러".equals(list2.get(i).getStockID())) {
												stock = (StockDTO) list2.get(i);
												stockName = stock.getStockName();
												stockCount = stock.getStockCount();
												stockID = stock.getStockID();
											%>
											<option value="<%=stockName%>" name="cpu"><%=stockName%></option>
											<%
											}
											}
											} catch (Exception e) {
											e.printStackTrace();
											}
											%>
										</select> <select class="detail-content-value-메인보드">
											<%
											try {
												List<StockDTO> list2 = (List<StockDTO>) request.getAttribute("list2");
												for (int i = 0; i < list2.size(); i++) {
													StockDTO stock = (StockDTO) list2.get(i);
													String stockName = null;
													int stockCount = -1;
													String stockID = null;

													if ("메인보드".equals(list2.get(i).getStockID())) {
												stock = (StockDTO) list2.get(i);
												stockName = stock.getStockName();
												stockCount = stock.getStockCount();
												stockID = stock.getStockID();
											%>
											<option value="<%=stockName%>" name="cpu"><%=stockName%></option>
											<%
											}
											}
											} catch (Exception e) {
											e.printStackTrace();
											}
											%>
										</select> <select class="detail-content-value-파워">
											<%
											try {
												List<StockDTO> list2 = (List<StockDTO>) request.getAttribute("list2");
												for (int i = 0; i < list2.size(); i++) {
													StockDTO stock = (StockDTO) list2.get(i);
													String stockName = null;
													int stockCount = -1;
													String stockID = null;

													if ("파워".equals(list2.get(i).getStockID())) {
												stock = (StockDTO) list2.get(i);
												stockName = stock.getStockName();
												stockCount = stock.getStockCount();
												stockID = stock.getStockID();
											%>
											<option value="<%=stockName%>" name="cpu"><%=stockName%></option>
											<%
											}
											}
											} catch (Exception e) {
											e.printStackTrace();
											}
											%>
										</select>
									</p>
									<button type="button" id="detail-select-btn">추가</button>
								</div>
							</div>
						</div>
					</div>
					<button type="button" id="add-option-btn">추가</button>
					<button type="button" id="openModalBtn">설정</button>

					<div id="myModal" class="modal">
						<div class="modal-content">
							<span id="closeModalBtn" class="x-button">
							</span>
							<h3>설비설정을 완료 하시겠습니까?</h3>
							<div class="option-check-botton-zip">
								<input type="hidden" name="nDate" value="">
								<button type="submit" class="okay-btn" id="processGoBtn">확인</button>
								<button type="button" class="nono-btn">취소</button>
							</div>
						</div>
					</div>

				</section>
			</div>
			<footer>ⓒ2024 J.company System</footer>
		</div>          
	</form>
	<script src="js/facilitiespage.js"></script>
	<script>
// 	let processGoBtn = document.querySelector("#processGoBtn"); // submit 버튼
	
// 	let comValue = document.querySelectorAll("[name=selectGrade]"); // 등급( 모든라인 )
// 	let comCount = document.querySelectorAll("[name=count]"); // 개수( 모든라인 )
// 	let comStock = document.querySelectorAll("[class^=optionpage-lego-option-select]"); // 부품( 한 라인 당 )

	
// 	processGoBtn.addEventListener("click", (event) => {
// 		event.preventDefault();
// 		let createLine = document.querySelectorAll(".lego-option"); // 생산라인( 모든 )
// 		for(let i = 0; i < createLine.length; i++) {
// 			console.log(createLine[i]);
// 			let stockCount = createLine[i].querySelectorAll(".parent-div");
// 			for(let j = 0; j < stockCount.length; j++) {
// 				console.log(stockCount[i]);
// 			}
// 		}
		
// 		let j = [];
		
// 		for(let i = 0; i < createLine.length; i++) {
// 			console.log(createLine[i].value + "번 라인");
// 			let jsonData = {
// 						"grade" : comValue[0].value,
// 						"count" : comCount[0].value,
// 						"stock" : {
// 							"gpu" : comStock[0].value,
// 						},
// 						stock: [
// 							{
// 								name: "gpu",
// 								data: "5GB"
// 							},
// 							{
// 								name: "gpu",
// 								data: "5GB"
// 							},
// 							{
// 								name: "gpu",
// 								data: "5GB"
// 							},
// 							{
// 								name: "gpu",
// 								data: "5GB"
// 							}
// 						]
// 					}
// 			j.push(jsonData);
// 		}
// 		console.log(jsonData);
// 	})
	
	
	function doAjax() {
		let xhr = new XMLHttpRequest();
		xhr.open("post", "option", true);
	    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	    
		let param = "";
		xhr.send(param);
		
	    xhr.onload = function() {
	        let data = xhr.responseText;
	        console.log("data : " + data);
        };
	}
	</script>
</body>

</html>