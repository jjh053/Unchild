<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.time.format.DateTimeFormatter"%>
<%@ page import="java.time.LocalDateTime"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Process Page</title>
<link rel="stylesheet" href="css/process.css">

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
					<li><a href="monitor">공정도</a></li>
					<li><a href="grade">설비설정</a></li>
				</ul>
			</aside>
			<section>

				<h1 style="text-align: center; font-size: 30px; margin-top: 40px">공정도</h1>
				<div class="process-chart">
					<form method="GET" action="proc" id="myForm">
						<input type="hidden" name="DBType" value="insert">

						<div id="monitoring">
							<%
						List<List> list = (List<List>) request.getAttribute("list");
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
							<div class="tree-line1"></div>
							<div class="tree-line2"></div>
							<div class="tree-line3"></div>


							<%
// 						System.out.println("list 크기 : " + list.size()); // 3
						List map = null;
						for (int i = 0; i < list.size(); i++) {
							List monitor = list.get(i);

							map = new ArrayList();

// 							System.out.println("monitor 크기 : " + monitor.size()); // 10

							if (monitor.get(0) instanceof Number) {
								map.add(monitor.get(0) + "번 라인 점검");
							}

							if ("1".equals(monitor.get(1))) {
								map.add("퍼포먼스 등급");
							} else if ("2".equals(monitor.get(1))) {
								map.add("메인스트림 등급");
							} else if ("3".equals(monitor.get(1))) {
								map.add("엔트리 등급");
							}

							int count = (int) monitor.get(2);
							map.add("생산개수 : " + count + "개");

							map.add("수정사항 확인");

							String gpu = (String) monitor.get(3);
							if (gpu.indexOf("RTX 4080TI") >= 0) {
								map.add("RTX 4080TI");
							} else if (gpu.indexOf("RX 6800 XT") >= 0) {
								map.add("RX 6800 XT");
							} else if (gpu.indexOf("GTX 1660 Ti") >= 0) {
								map.add("GTX 1660 Ti");
							}

							String ssd = (String) monitor.get(4);
							if (ssd.indexOf("4TB") >= 0) {
								map.add("4TB SSD");
							} else if (ssd.indexOf("1TB") >= 0) {
								map.add("1TB SSD");
							} else if (ssd.indexOf("500GB") >= 0) {
								map.add("500GB SSD");
							}

							String ram = (String) monitor.get(5);
							if (ram.indexOf("32GB") >= 0) {
								map.add("32GB RAM");
							} else if (ram.indexOf("16GB") >= 0) {
								map.add("16GB RAM");
							} else if (ram.indexOf("8GB") >= 0) {
								map.add("8GB RAM");
							}

							String cpu = (String) monitor.get(6);
							if (cpu.indexOf("O9") >= 0) {
								map.add("O9-14900K");
							} else if (cpu.indexOf("O5") >= 0) {
								map.add("O5-14500");
							} else if (cpu.indexOf("O3") >= 0) {
								map.add("O3-14100");
							}

							String cool = (String) monitor.get(7);
							if (cool.indexOf("Noctua NH-D15 Cooler") >= 0) {
								map.add("Noctua NH-D15");
							} else if (cool.indexOf("RGB Platinum Cooler") >= 0) {
								map.add("RGB Platinum");
							} else if (cool.indexOf("Black Edition Cooler") >= 0) {
								map.add("Black Edition");
							}

							String main = (String) monitor.get(8);
							if (main.indexOf("AZUZ") >= 0) {
								map.add("AZUZ Z590-E");
							} else if (main.indexOf("TERABYTE") >= 0) {
								map.add("TERABYTE A520M");
							} else if (main.indexOf("MZI") >= 0) {
								map.add("MZI B550");
							}

							String power = (String) monitor.get(9);
							if (power.indexOf("1000W") >= 0) {
								map.add("1000W 파워");
							} else if (power.indexOf("850W") >= 0) {
								map.add("850W 파워");
							} else if (power.indexOf("550W") >= 0) {
								map.add("550W 파워");
							}

							map.add("조립 검토");
						%>
							<div class="treeProcess<%=i%>">
								<input type="hidden" name="grade<%=i %>"
									value="<%=map.get(1) %>">
								<%
// 							System.out.println("map.size : " + map.size());
							for (int j = 0; j < map.size(); j++) {
								if (!"Default".equals(map.get(j)) || "수정사항 확인".equals(map.get(j)) || "조립 검토".equals(map.get(j))) {
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
							}
							%>
							</div>
							<%
						}
						%>
						</div>


						<%
						for (int i = 0; i < 4; i++) {
							String[] nowDate = {"", ""}; // 변수를 미리 선언하고 초기화
							try {
								String nowTime = (String) list.get(i).get(10);
								if (nowTime != null) {
							nowDate = nowTime.split(" "); // 값을 할당
								}
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
									<td><%=nowDate[0]%><br> <br> 시작시간 : <%=nowDate[1]%>
									</td>
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
						<table class="process-chart-time-table3">
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
					</form>
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
    for (int i = 0; i < 3; i++) {
	%>
	    var makeCount<%=i%> = document.querySelectorAll(".treecircle2");
	    var countNum<%=i%> = [];
	    
	
	    
        console.log("makeCount<%=i%>.length : " + makeCount<%=i%>.length); // 3
        
	        countNum<%=i%>.push(makeCount<%=i%>[<%=i%>].textContent.replace("생산개수 : ", "").replace("개", ""));
	    
	
	        var graph<%=i%> = document.querySelectorAll(".treeProcess<%=i%> [class^=treecircle]");
	        console.log("graph<%=i%>.length : " + graph<%=i%>.length); // 9 10 7 
	        
	        var cursor<%=i%> = 0;
	        
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
		    }, 1000);
	<%
	    }
	%>

    // DB에 연결해서 재고는 마이너스처리; 완품은 플러스처리
    // 불량품도 부품과 완품으로 나눠서 DB 연결
    let isFinished = [false, false, false];
    let isCounted = [false, false, false];
    
    <%
    for (int i = 0; i < 3; i++) {
    %>
	    var completComNum<%=i%> = 0; 	// 통과
	    var failComNum<%=i%> = 0;		// 불량
	    var totalComNum<%=i%> = 0;		// 사이클
	    
	    let completeComputer<%=i%> = document.querySelector(".completeComputer<%=i%>");
	    let comProgress<%=i%> = document.querySelector(".completeComputer-progress<%=i%>");
	    

	    let interval<%=i%> = setInterval(() => {
	    	if(Math.random() > 0.05) {
		        completComNum<%=i%>++;
		        totalComNum<%=i%>++;
		        console.log("completComNum<%=i%> : " + completComNum<%=i%>);
		        completeComputer<%=i%>.innerHTML = completComNum<%=i%>;
		        goodCount<%=i + 1 %>.innerHTML = "통과 : " + completComNum<%=i%>;
		        operations<%=i + 1 %>.innerHTML = "사이클 횟수 : " + totalComNum<%=i%>;
		        console.log("totalComNum<%=i%> : " + totalComNum<%=i%>)
	    	} else {
	    		failComNum<%=i%>++;
	    		totalComNum<%=i%>++;
	    		console.log("불량 : " + failComNum<%=i%>);
		        completeComputer<%=i%>.innerHTML = "<h4 style='color: red'>!!불량!!</hr>";  
		        defectCount<%=i + 1 %>.innerHTML = "불량 : " + failComNum<%=i%>;
		        operations<%=i + 1 %>.innerHTML = "사이클 횟수 : " + totalComNum<%=i%>;
	    	}
	    	
	    	let textElements = document.querySelectorAll(".treecircle2");
	    	let textNums = [];
	    	for (let i = 0; i < textElements.length; i++) {
	    	    let textStr = textElements[i].textContent;
	    	    let textNum = parseInt(textStr.match(/\d+/)[0]);
	    	    textNums.push(textNum);
	    	}
	    	
		    if((completComNum<%=i%> + failComNum<%=i%>) == textNums[<%=i%>]) {
		    	clearInterval(interval<%=i%>);
		    	completeComputer<%=i%>.innerHTML = "통과 : " + completComNum<%=i%> + "<br>불량 : " + failComNum<%=i%>
		    										+ "<input type='hidden' name='pass<%=i%>' value='" + completComNum<%=i%> + "'>" 
		    										+ "<input type='hidden' name='fail<%=i%>' value='" + failComNum<%=i%> + "'>";
		    	comProgress<%=i%>.innerHTML = "종료";
		    	
		    	isFinished[<%=i%>] = true; // interval 종료 상태 변경
		    	
		    	
		    	var nowTime = Date.now(); 

		        // 밀리초를 Date 객체로 변환
		        var currentTime = new Date(nowTime);
		
		        // 원하는 형식의 문자열로 변환
		        var endTime = currentTime.toISOString().replace("T", " ").split(".")[0]; // ISO 형식에서 "T" 제거 및 밀리초 제거
		        console.log(endTime); // 종료시간 출력
		        document.querySelector("input[name='endProTime<%=i%>']").value = endTime;
		        
		    }
		    
		    let allFinish = isFinished.every(function(finished) {
		        return finished; // 각 요소가 true일 때만 true를 반환합니다.
		    });

		    if (allFinish) {
	            document.getElementById("myForm").submit();
		    }
		    
	    }, graph<%=i%>.length*1000);
	<%}%>

    // 공정 라인 버튼 색깔만 바뀌게 - DB 에는 실제로 라인 4개 형성해서 보여지는 스크립트 추가하기
    <%for (int i = 1; i < list.size(); i++) {%>
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
    <%}%>
    
    
    
    
    
   	document.querySelector('.process-chart-time-table0').style.display = "table";
    document.querySelector('.process-chart-time-table1').style.display = "none";
    document.querySelector('.process-chart-time-table2').style.display = "none";
    document.querySelector('.process-chart-time-table3').style.display = "none";
    
    
    document.querySelector('.process1').addEventListener("click", () => {
        
        document.querySelector('.treeProcess0').style.display = "block";
        document.querySelector('.treeProcess1').style.display = "none";
        document.querySelector('.treeProcess2').style.display = "none";
        
        document.querySelector('.process-chart-time-table0').style.display = "table";
        document.querySelector('.process-chart-time-table1').style.display = "none";
        document.querySelector('.process-chart-time-table2').style.display = "none";
        document.querySelector('.process-chart-time-table3').style.display = "none";
        

        
        
        if (graph0.length > 9) {
	    	document.querySelector(".tree-line3").style.display = "block";
	        document.querySelector('.process-chart-time-table0').style.marginTop = "350px";
	   	} else {
	    	document.querySelector(".tree-line3").style.display = "none";
	   	}
        
        if(graph0.length == 0) {
	    	document.querySelector(".tree-line1").style.display = "none";
	    	document.querySelector(".tree-line2").style.display = "none";
        } else {
	    	document.querySelector(".tree-line1").style.display = "block";
	    	document.querySelector(".tree-line2").style.display = "block";
        }
    });
    
    document.querySelector('.process2').addEventListener("click", () => {
        document.querySelector('.treeProcess0').style.display = "none";
        document.querySelector('.treeProcess1').style.display = "block";
        document.querySelector('.treeProcess2').style.display = "none";
        
        document.querySelector('.process-chart-time-table0').style.display = "none";
        document.querySelector('.process-chart-time-table1').style.display = "table";
        document.querySelector('.process-chart-time-table2').style.display = "none";
        document.querySelector('.process-chart-time-table3').style.display = "none";
 
        
        if (graph1.length > 9) {
	    	document.querySelector(".tree-line3").style.display = "block";
	        document.querySelector('.process-chart-time-table1').style.marginTop = "350px";
	   	} else {
	    	document.querySelector(".tree-line3").style.display = "none";
	   	}
        
        if(graph1.length == 0) {
	    	document.querySelector(".tree-line1").style.display = "none";
	    	document.querySelector(".tree-line2").style.display = "none";
        } else {
	    	document.querySelector(".tree-line1").style.display = "block";
	    	document.querySelector(".tree-line2").style.display = "block";
        }
    });
    
    document.querySelector('.process3').addEventListener("click", () => {
        
        document.querySelector('.treeProcess0').style.display = "none";
        document.querySelector('.treeProcess1').style.display = "none";
        document.querySelector('.treeProcess2').style.display = "block";
        
        document.querySelector('.process-chart-time-table0').style.display = "none";
        document.querySelector('.process-chart-time-table1').style.display = "none";
        document.querySelector('.process-chart-time-table2').style.display = "table";
        document.querySelector('.process-chart-time-table3').style.display = "none";
        
    
        if (graph2.length >= 9) {
	    	document.querySelector(".tree-line3").style.display = "block";
	        document.querySelector('.process-chart-time-table2').style.marginTop = "350px";
	   	} else {
	    	document.querySelector(".tree-line3").style.display = "none";
	   	}
        
        if(graph2.length == 0) {
	    	document.querySelector(".tree-line1").style.display = "none";
	    	document.querySelector(".tree-line2").style.display = "none";
        } else {
	    	document.querySelector(".tree-line1").style.display = "block";
	    	document.querySelector(".tree-line2").style.display = "block";
        }
    });
    
    document.querySelector('.process4').addEventListener("click", () => {
        
        document.querySelector('.treeProcess0').style.display = "none";
        document.querySelector('.treeProcess1').style.display = "none";
        document.querySelector('.treeProcess2').style.display = "none";
        
        document.querySelector('.process-chart-time-table0').style.display = "none";
        document.querySelector('.process-chart-time-table1').style.display = "none";
        document.querySelector('.process-chart-time-table2').style.display = "none";
        document.querySelector('.process-chart-time-table3').style.display = "table";
        

        if (graph3.length > 9) {
	    	document.querySelector(".tree-line3").style.display = "block";
	        document.querySelector('.process-chart-time-table3').style.marginTop = "350px";
	   	} else {
	    	document.querySelector(".tree-line3").style.display = "none";
	   	}
        
        if(graph3.length == 0) {
	    	document.querySelector(".tree-line1").style.display = "none";
	    	document.querySelector(".tree-line2").style.display = "none";
        } else {
	    	document.querySelector(".tree-line1").style.display = "block";
	    	document.querySelector(".tree-line2").style.display = "block";
        }
    });

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
    <%for (int i = 1; i <= list.size(); i++) {%>	
		const status<%=i%> = document.getElementById('status<%=i%>'); // 현재상황 영역
		const defectRate<%=i%> = document.getElementById('defectRate<%=i%>'); // 불량률 영역
		const defectCount<%=i%> = document.getElementById('defectCount<%=i%>'); // 불량 영역
		const goodCount<%=i%> = document.getElementById('goodCount<%=i%>'); // 통과 영역
		const operations<%=i%> = document.getElementById('operations<%=i%>'); // 사이클 영역
		
		
		
		const maxIterations<%=i%> = countNum<%=i - 1%>; // 만들개수 설정
		let iteration<%=i%> = completComNum<%=i - 1%> + failComNum<%=i - 1%>; // 현재 생산 개수
		
		let lineCount<%=i%> = 0;
		
		

	<%}%>

	function runProcess() {
		<%for (int i = 1; i <= list.size(); i++) { // 3%>
		console.log("countNum" + countNum<%=i - 1%>)
		    if (iteration<%=i%> < maxIterations<%=i%>) {
		    	
		    
		        let setProC<%=i%> = setInterval(() => {
		            status<%=i%>.textContent = 'Completed';
		            status<%=i%>.style.color = 'green';
	
		            lineCount<%=i%>++;

		        }, 500);
		        
		        let setProC2<%=i%> = setInterval(() => {
			        status<%=i%>.textContent = 'Running';
			        status<%=i%>.style.color = 'red';
			        
			        
			        
		        }, 1000);
		        
		    } else {
		    	clearInterval(setProC<%=i%>);
		    	clearInterval(setProC2<%=i%>);
		    }
	    <%}%>
	}
	runProcess();

})
</script>
</body>
</html>