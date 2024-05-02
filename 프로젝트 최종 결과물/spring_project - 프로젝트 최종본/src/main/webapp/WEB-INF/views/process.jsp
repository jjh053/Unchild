<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.mes.project.ldy.dto.SD_DTO"%>
<%@ page import="com.mes.project.ldy.dto.StockDTO"%>
<%@ page import="java.util.*"%>
<%@ page import="java.time.format.DateTimeFormatter"%>
<%@ page import="java.time.LocalDateTime"%>
<%@ page import="java.sql.Timestamp "%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Process Page</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/process.css">
<style>
#stockZipTable button:hover {
	transition: 0.3s ease;
	background-color: blue;
}

#stockZipTable button {
	background-color: #3498DB;
	color: #fff;
	border: 0;
	border-radius: 10px;
	width: 100px;
	height: 50px;
	cursor: pointer;
	margin-right: 20px;
	margin-bottom: 20px;
}

[id^=stockLineCheck] {
	display: none;
}

.lineNumberButtonZip {
	display: flex;
	width: 100%;
	justify-content: space-evenly;
	margin-bottom: 20px;
}

[id^=lineNumberButton] {
	background-color: #3498DB;
	color: #fff;
	border: 0;
	border-radius: 10px;
	width: 120px;
	height: 40px;
	cursor: pointer;
}

[id^=lineNumberButton]:hover {
	transition: 0.3s ease;
	background-color: blue;
}

#stockZipTable {
	text-align: right;
}

.modal-content a {
	color: #000;
	text-decoration: none;
}

.modal-content a:hover {
	color: blue;
	transition: color 0.3s ease;
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
				<img src="${pageContext.request.contextPath}/images/bee_happy.png"
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
		<div id="myModal" class="modal">
			<div class="modal-content">
				<div>
					<span id="closeModalBtn" class="x-button"> </span>
					<h2>공정 부품 사용</h2>
					<div class="lineNumberButtonZip">
						<% for(int i=1; i<=4; i++) { %>
						<button type="button" id="lineNumberButton<%=i %>"><%=i %>번
							라인
						</button>
						<% } %>
					</div>
				</div>
				<c:if test="${not empty stockList }">
					<div class="totalStockZip">
						<c:forEach var="stockList1" items="${stockList }">
							<c:forEach var="stockList2" items="${stockList1 }">
								<c:if test="${not empty stockList2.lineNum}">
									<div id="stockLineCheck${stockList2.lineNum }">
										<br> 부품 타입 : ${stockList2.stockType }<br> 부품 이름 :
										${stockList2.stockName }<br> 필요 개수 :
										${stockList2.stockCount }<br>
										<c:forEach var="mesList" items="${mesList }">
											<c:if test="${mesList.mesName == stockList2.stockName }">
											창고 재고 : ${mesList.mesCount}<br>
											</c:if>
										</c:forEach>
										<br>
										<hr>
									</div>
								</c:if>
							</c:forEach>
						</c:forEach>
					</div>
				</c:if>
				<c:if test="${empty stockList }">
					설비설정을 완료해주세요.
					ㄴ<a href="">설비 설정 이동</a>
				</c:if>
			</div>
		</div>
		<div class="aside-section-container">
			<aside>
				<ul>
					<li><a href="process">공정도</a></li>
					<li><a href="facility">설비설정</a></li>
				</ul>
			</aside>
			<section>
				<h1 style="text-align: center; font-size: 30px; margin-top: 40px">공정도</h1>
				<div id="stockZipTable">
					<button type="button" id="stockZipButton">조회</button>
				</div>
				<div class="process-chart">
					<input type="hidden" name="DBType" value="insert">

					<div id="monitoring">
						<%
						System.out.println("----------------------------------------------------");
						System.out.println("--------------------process.jsp---------------------");
						System.out.println("----------------------------------------------------");
						
						for (int i = 1; i <= 4; i++) {
						%>
						<div class="process<%=i %>">
							<h4><%=i %>번 라인
							</h4>
							<div id="status<%=i %>" class="status">Pending</div>
							<div id="defectRate<%=i %>" class="operations">불량률 : 0%</div>
							<div id="defectCount<%=i %>" class="operations">불량 : 0</div>
							<div id="goodCount<%=i %>" class="operations">통과 : 0</div>
							<div id="operations<%=i %>" class="operations">사이클 횟수 : 0</div>
						</div>
						<%
						}
						%>
					</div>

					<div id="treeLine">
						<c:if test="${not empty stockList }">
							<div class="tree-line1"></div>
							<div class="tree-line2"></div>
							<div class="tree-line3"></div>
						</c:if>


						<%
						List<List<SD_DTO>> stockList = null;
						List<List<StockDTO>> endNullList = null;
						try {
						stockList = (List<List<SD_DTO>>) request.getAttribute("stockList");
						endNullList = (List<List<StockDTO>>) request.getAttribute("endNullList");
						
						System.out.println("stockList >> " + stockList.size());
						System.out.println("endNullList >> " + endNullList.size());
						%>
						<%
						List map = null;
						for (int i = 0; i < endNullList.size(); i++) {
							map = new ArrayList();
							List monitor = stockList.get(i);
							System.out.println("-------------------------------" + monitor);
							map.add(((SD_DTO)monitor.get(0)).getLineNum() + "번 라인 점검");
							map.add("생산 개수 : " + ((SD_DTO)monitor.get(0)).getStockCount());
							for(int j=0; j<monitor.size(); j++) {
								SD_DTO dto = (SD_DTO)monitor.get(j);
								map.add(dto.getStockType() + " 결합");
							}
							map.add("조립 검토");
							map.add("출하");
						%>
						<div class="treeProcess<%=i%>">
							<input type="hidden" name="grade<%=i %>" value="<%=map.get(1) %>">
							<%
// 							System.out.println("map.size : " + map.size());
							for (int j = 0; j < map.size(); j++) {
								if (j < 3) {
									%>
							<div class="treecircle<%=j%>"
								style="line-height: 150px; background-color: #4c54cb; width: 150px; height: 150px; border-radius: 50%; text-align: center; position: absolute; color: #fff; top: -14%; left: calc(<%=(j + 1) * 30%>% - 150px) "><%=map.get(j)%></div>
							<div class="treeGo<%=j%>"
								style="font-size: 30px; position: absolute; top: -1.5%; left: <%=(j + 1) * 29 + 4%>%">
								>>></div>
							<%
								} else if (j >= 3 && j < 6) {
								%>
							<div class="treecircle<%=j%>"
								style="line-height: 150px; background-color: #4c54cb; width: 150px; height: 150px; border-radius: 50%; text-align: center; position: absolute; color: #fff; top: 34%; left: calc(<%=180 - (j * 30)%>% - 150px)"><%=map.get(j)%></div>
							<div class="treeGo<%=j%>"
								style="font-size: 30px; position: absolute; top: 46.5%; left: <%=182 - ((j + 1) * 30)%>%">
								<<<</div>
							<%
								} else if (j >= 6 && j < 9) {
								%>
							<div class="treecircle<%=j%>"
								style="line-height: 150px; background-color: #4c54cb; width: 150px; height: 150px; border-radius: 50%; text-align: center; position: absolute; color: #fff; top: 82%; left: calc(<%=(j - 5) * 30%>% - 150px)"><%=map.get(j)%></div>
							<%
									if (j < (map.size() - 1)) {
									%>
							<div class="treeGo<%=j%>"
								style="font-size: 30px; position: absolute; top: 94%; left: <%=(j - 5) * 30 + 2%>%">
								>>></div>
							<%
									}
								} else {
								%>
							<div class="treecircle<%=j%>"
								style="line-height: 150px; background-color: #4c54cb; width: 150px; height: 150px; border-radius: 50%; text-align: center; position: absolute; color: #fff; top: 129%; left: calc(<%=180 - ((j - 7) * 30)%>% - 385px)"><%=map.get(j)%></div>
							<%
									if (j < (map.size() - 1)) {
									%>
							<div class="treeGo<%=j%>"
								style="font-size: 30px; position: absolute; top: 134%; left: <%=100 - ((j - 5) * 30)%>%">
								<<<</div>
							<%
									}
								}
							}
							%>
						</div>
						<%
						}
						}catch(Exception e) {
							
						}
						%>
					</div>


					<%
						List<StockDTO> list2 = null;
						try {
						list2 = (List<StockDTO>)request.getAttribute("endNullList");
						} catch(Exception e) {
							
						}
						for (int i = 0; i < 4; i++) {
							String[] nowDate = {"", ""}; // 변수를 미리 선언하고 초기화
							try {
								String nowTime = "" + list2.get(i).getStartTime();
								if (nowTime != null) {
									nowDate = nowTime.split(" "); // 값을 할당
								}
								String time = nowDate[1].substring(0, nowDate[1].indexOf("."));
								
								%>
					<table class="process-chart-time-table<%=i%>">
						<thead>
							<tr>
								<th>일시</th>
								<th>완성된 컴퓨터 수</th>
								<th>진행상황</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><%=nowDate[0]%><br> <br> 시작시간 : <%=time%></td>
								<td class="completeComputer<%=i%>">0</td>
								<td class="completeComputer-progress<%=i%>"><%=i + 1%>번 라인
									<br>숙지사항 확인</td>
								<input type="hidden" name="endProTime<%=i %>">
							</tr>
						</tbody>
					</table>
					<%
							} catch (Exception e) {
							%>
					<table class="process-chart-time-table-none">
						<thead>
							<tr>
								<th>일시</th>
								<th>완성된 컴퓨터 수</th>
								<th>진행상황</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>-</td>
								<td>-</td>
								<td>-</td>
							</tr>
						</tbody>
					</table>
					<%
							}
						}
						%>
				</div>
			</section>
		</div>
		<footer>ⓒ2024 J.company System</footer>
	</div>


	<script>
//현재 로그인한 등급( 작업자 / 관리자 )
let userRole = '<%=role%>'; 

document.addEventListener("DOMContentLoaded", function () {
	
    // 공통 스크립트 : 나중에 공동파일로 관리할 예정
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
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
    let currentOptionBeingEdited = null;

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

	
<%
try {
    for (int i = 0; i < endNullList.size(); i++) {
%>
	    var makeCount<%=i%> = document.querySelectorAll(".treecircle1");
	    var countNum<%=i%> = [];
	    try {
	        countNum<%=i%>.push(makeCount<%=i%>[<%=i%>].textContent.replace("생산 개수 : ", ""));
	    } catch(error) {
	    	
	    }
    

        var graph<%=i%> = document.querySelectorAll(".treeProcess<%=i%> [class^=treecircle]");
        console.log("graph<%=i%>.length : " + graph<%=i%>.length); // 9 10 7 
        
        var cursor<%=i%> = 0;
        
        try {
		    let interNum<%=i%> = setInterval(() => {
	    		let allTreecircle = document.querySelectorAll(".treeProcess<%=i%> [class*=treecircle]");
	            let now = allTreecircle[allTreecircle.length - 1];
	            now.style.backgroundColor = "#4c54cb";
	    	
	            let current = document.querySelector(".treeProcess<%=i %> .treecircle" + cursor<%=i %>);
		    	document.querySelector(".completeComputer-progress<%= i%>").innerHTML = current.innerHTML;
	            current.style.backgroundColor = "#00ffbb";
	
	            if (cursor<%=i%> > 0) {
	                let origin = document.querySelector(".treeProcess<%=i%> .treecircle" + ( cursor<%=i%> - 1 ));
	                origin.style.backgroundColor = "#4c54cb";
	            }
		    	cursor<%=i%>++; 
		    	if (cursor<%=i%> >= graph<%=i%>.length) {
		            cursor<%=i%> = 0; 
		        }
		    }, 2000);
        } catch(error) {
        	
        }
<%
    }
}catch(Exception e) {
	
}
%>

    // DB에 연결해서 재고는 마이너스처리; 완품은 플러스처리
    // 불량품도 부품과 완품으로 나눠서 DB 연결
    let isFinished = [false, false, false, false];
    let isCounted = [false, false, false, false];
    <%
   	try {
    for (int i = 0; i < endNullList.size(); i++) {
    %>
	    var completComNum<%=i%> = 0; 	// 통과
	    var failComNum<%=i%> = 0;		// 불량
	    var totalComNum<%=i%> = 0;		// 사이클
	    
	    let completeComputer<%=i%> = document.querySelector(".completeComputer<%=i%>");
	    let comProgress<%=i%> = document.querySelector(".completeComputer-progress<%=i%>");
	    

	    let interval<%=i%> = setInterval(() => {
	    	if(Math.random() > 0.03) {
		        completComNum<%=i%>++;
		        totalComNum<%=i%>++;
		        console.log("completComNum<%=i%> : " + completComNum<%=i%>);
		        completeComputer<%=i%>.innerHTML = completComNum<%=i%>;
		        goodCount<%=i + 1 %>.innerHTML = "통과 : " + completComNum<%=i%>;
		        operations<%=i + 1 %>.innerHTML = "사이클 횟수 : " + totalComNum<%=i%>;
		        
		        let jsonData<%=i%> = {
		        		lineNum : <%=i + 1%>,
		        		pass : completComNum<%=i%>
		        }
		        
		        doAjax("option_pass", jsonData<%=i%>);
		        
		        console.log("totalComNum<%=i%> : " + totalComNum<%=i%>)
	    	} else {
	    		failComNum<%=i%>++;
	    		totalComNum<%=i%>++;
	    		console.log("불량 : " + failComNum<%=i%>);
		        completeComputer<%=i%>.innerHTML = "<h4 style='color: red'>!!불량!!</hr>";  
		        defectCount<%=i + 1 %>.innerHTML = "불량 : " + failComNum<%=i%>;
		        operations<%=i + 1 %>.innerHTML = "사이클 횟수 : " + totalComNum<%=i%>;
		        
		        let jsonData<%=i%> = {
		        		lineNum : <%=i + 1%>,
		        		fail : failComNum<%=i %>
		        }
		        
		        doAjax("option_fail", jsonData<%=i%>);
		        
	    	}
	    	
	    	let textElements = document.querySelectorAll(".treecircle1");
	    	let textNums = [];
	    	for (let i = 0; i < textElements.length; i++) {
	    	    let textStr = textElements[i].textContent;
	    	    let textNum = parseInt(textStr.match(/\d+/)[0]);
	    	    textNums.push(textNum);
	    	}
	    	
		    if((completComNum<%=i%> + failComNum<%=i%>) == textNums[<%=i%>]) {
		    	clearInterval(interval<%=i%>);
		    	var nowTime = Date.now(); 
		    	console.log(nowTime);

		        // 밀리초를 Date 객체로 변환
		        var currentTime = new Date(nowTime);
		        var hours = currentTime.getHours();
		        var minutes = currentTime.getMinutes();
		        var seconds = currentTime.getSeconds();
		        var timeString = hours.toString().padStart(2, '0') + ':' + minutes.toString().padStart(2, '0') + ':' + seconds.toString().padStart(2, '0');

		    	completeComputer<%=i%>.innerHTML = "통과 : " + completComNum<%=i%> + 
		    									   "<br>불량 : " + failComNum<%=i%> + "<br>종료시간 : " + timeString
		    										+ "<input type='hidden' name='pass<%=i%>' value='" + completComNum<%=i%> + "'>" 
		    										+ "<input type='hidden' name='fail<%=i%>' value='" + failComNum<%=i%> + "'>";
		    	comProgress<%=i%>.innerHTML = "종료";
		    	
		    	isFinished[<%=i%>] = true; // interval 종료 상태 변경
		    	
		    	
		
		        let jsonData<%=i%> = {
		        		lineNum : <%=i + 1%>,
		        		pass : completComNum<%=i%>,
		        		fail : failComNum<%=i%>,
		        		endTime : currentTime
		        }
		        
		    	doAjax("option_end", jsonData<%=i%>);
		        
		    }
		    
		    let allFinish = isFinished.every(function(finished) {
		        return finished; // 각 요소가 true일 때만 true를 반환합니다.
		    });

		    if (allFinish) {
		    	doAjaxEnd("option_totalEnd");
		    }
		    
	    }, graph<%=i%>.length*2000);
	<%
		}
   	}catch(Exception e) {
   		
   	}
	%>
	
	
	function doAjax(url, param) {
		let xhr = new XMLHttpRequest();
		xhr.open("post", url, true);
		xhr.setRequestHeader("Content-Type", "application/json");
		
		xhr.send(JSON.stringify(param));

		xhr.onload = function() {
			let data = xhr.responseText;
			console.log("data : " + data);
		};
	}
	
	function doAjaxEnd(url) {
		let xhr = new XMLHttpRequest();
		xhr.open("post", url, true);
		xhr.setRequestHeader("Content-Type", "application/json");
		
		xhr.send();

		xhr.onload = function() {
			let data = xhr.responseText;
			console.log("data : " + data);
		};
	}

    // 공정 라인 버튼 색깔만 바뀌게 - DB 에는 실제로 라인 4개 형성해서 보여지는 스크립트 추가하기
    <%
    try {
    for (int i = 1; i < endNullList.size(); i++) {%>
    	document.querySelector('.treeProcess<%=i%>').style.display = "none";
    <%}%>
    
    
    <%for (int i = 0; i < 4; i++) {%>
	    graph<%=i%> = document.querySelectorAll(".treeProcess<%=i%> [class^=treecircle]");
	    
	    for (let i = 0; i < graph<%=i%>.length; i++) {
			if (i % 3 == 2) {
	    		for(let j = 0; j < document.querySelectorAll(".treeGo" + i).length; j++) {
	    			document.querySelectorAll(".treeGo" + i)[j].style.display = "none";
	    		}
		    }
		}
    <%}
    } catch(Exception e) {
    	
    }%>
    
    
    const processButtons = document.querySelectorAll('[class^=process]');
    let processTable = document.querySelectorAll('[class^=process-chart-time-table]');
    for(let i=0; i<processTable.length; i++) {
    	processTable[i].style.display = "none";
    }
   	processTable[0].style.display = "table";
	
   	const process1Button = document.querySelector('.process1');
   	const process2Button = document.querySelector('.process2');
   	const process3Button = document.querySelector('.process3');
   	const process4Button = document.querySelector('.process4');

   	process1Button.addEventListener("click", () => {
   	    showProcess(0);
   	});

   	process2Button.addEventListener("click", () => {
   	    showProcess(1);
   	});

   	process3Button.addEventListener("click", () => {
   	    showProcess(2);
   	});

   	process4Button.addEventListener("click", () => {
   	    showProcess(3);
   	});

   	function showProcess(index) {
   	    const treeProcesses = document.querySelectorAll('[class^=treeProcess]');
   	    const timeTables = document.querySelectorAll('[class^=process-chart-time-table]');
   	    const graphLength = [graph0.length, graph1.length, graph2.length, graph3.length];
	
   	    for(let i=0; i < treeProcesses.length ; i++) {
   	    	treeProcesses[i].style.display = "none";
   	    }
   	    for(let i=0; i < timeTables.length ; i++) {
   	     	timeTables[i].style.display = "none";
   	    }
   	    try {
	 	    treeProcesses[index].style.display = "block";
   	    } catch(error) {
   	    	console.log("없");
   	    }
   	    try {
	 	    timeTables[index].style.display = "table";
   	    } catch(error) {
   	    	console.log("없");
   	    }

        if (graphLength[index] > 9) {
            document.querySelector(".tree-line3").style.display = "block";
            timeTables[index].style.marginTop = "350px";
        } else {
            document.querySelector(".tree-line3").style.display = "none";
        }
       
        if (graphLength[index] == 0) {
            document.querySelector(".tree-line1").style.display = "none";
            document.querySelector(".tree-line2").style.display = "none";
        } else {
            document.querySelector(".tree-line1").style.display = "block";
            document.querySelector(".tree-line2").style.display = "block";
        }
   	}


    // 모바일 대응 스크립트
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

                // 관리자
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
    

    // 라인 각 값
    // i == 라인 번호
    <%
    try {
    for (int i = 1; i <= endNullList.size(); i++) {%>	
		const status<%=i%> = document.getElementById('status<%=i%>'); // 현재상황 영역
		const defectRate<%=i%> = document.getElementById('defectRate<%=i%>'); // 불량률 영역
		const defectCount<%=i%> = document.getElementById('defectCount<%=i%>'); // 불량 영역
		const goodCount<%=i%> = document.getElementById('goodCount<%=i%>'); // 통과 영역
		const operations<%=i%> = document.getElementById('operations<%=i%>'); // 사이클 영역
		
		console.log("----------------??<%=i - 1%>" + countNum<%=i - 1%>);
		
		const maxIterations<%=i%> = countNum<%=i - 1%>; // 만들개수 설정
		let iteration<%=i%> = completComNum<%=i - 1%> + failComNum<%=i - 1%>; // 현재 생산 개수
		let lineCount<%=i%> = 0;
	<%}
    }catch(Exception e) {
    
    }
	%>

	function runProcess() {
		<%for (int i = 1; i <= endNullList.size(); i++) { // 3%>
		    if (iteration<%=i%> < maxIterations<%=i%>) {
		        let setProC<%=i%> = setInterval(() => {
		            status<%=i%>.textContent = 'Completed';
		            status<%=i%>.style.color = 'green';
		            lineCount<%=i%>++;
		        }, 1000);
		        let setProC2<%=i%> = setInterval(() => {
			        status<%=i%>.textContent = 'Running';
			        status<%=i%>.style.color = 'red';
		        }, 2000);
		    } else {
		    	clearInterval(setProC<%=i%>);
		    	clearInterval(setProC2<%=i%>);
		    }
	    <%}%>
	}

	runProcess();
	
	let stockLineAllCheck = document.querySelectorAll("[id^=stockLineCheck]");
	<%for(int i=1; i<=4; i++) { %>
	let lineNumberButton<%=i %> = document.querySelector("#lineNumberButton<%=i %>");
	let stockLineCheck<%=i %> = document.querySelectorAll("#stockLineCheck<%=i %>");
	
	
	lineNumberButton<%=i %>.addEventListener("click", () => {
		for(let i=0; i<stockLineAllCheck.length; i++) {
			stockLineAllCheck[i].style.display = "none";
		}		
		for(let i=0; i<stockLineCheck<%=i %>.length; i++) {
			stockLineCheck<%=i %>[i].style.display = "block";
		}
	})
	<%} %>
	
	let stockZipButton = document.querySelector("#stockZipButton");
	let modal = document.getElementById("myModal");
	let closeModalBtn = document.getElementById("closeModalBtn");
	
	stockZipButton.addEventListener("click", () => {
	   modal.style.display = "block";
	   modal.style.pointerEvents = "auto";
		
	})
	
	closeModalBtn.addEventListener("click", function() {
	   modal.style.display = "none";
	   modal.style.pointerEvents = "none";
	});
})
</script>
</body>
</html>