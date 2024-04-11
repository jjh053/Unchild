<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="fpm.jsp.Fpm_DTO"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Management System</title>
<link rel="stylesheet" href="css/FPM.css">
<style>
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
						<li><a href="ot">재고 현황</a></li>
						<li><a href="SS">재고 신청</a></li>
						<li><a href="fs">완제품 관리</a></li>
						<li><a href="rodi">재고 불량 신고</a>
						</li>
					</ul>
				</div>

			</aside>
			<section>
				<article>
					<div class="all_output">
						<div class="output_font">일일 완제품 현황</div>
						<div class="output_box">
							<br>
							<div class="daily_output">
								<div class="daily_yield">
									<div class="performance_Good">
										<div class="performance">
											<div class="part1">
												퍼포먼스<br>일일<br>완제품
											</div>
										</div>
										<div class="graph-container" title="기준 : 100개">
											<div class="bar_dp" title="기준 : 100개"></div>
										</div>
									</div>
									<div class="entry_Good">
										<div class="entry">
											<div class="part1">
												메인스트림<br>일일<br>완제품
											</div>
										</div>
										<div class="graph-container" title="기준 : 100개">
											<div class="bar_dm" title="기준 : 100개"></div>
										</div>
									</div>
									<div class="main_String_Good">
										<div class="Main_String">
											<div class="part1">
												엔트리<br>일일<br>완제품
											</div>
										</div>
										<div class="graph-container" title="기준 : 100개">
											<div class="bar_de" title="기준 : 100개"></div>
										</div>
									</div>
								</div>
								<div class="daily_defects">
									<div class="performance_Bad">
										<div class="performance">
											<div class="part2">
												퍼포먼스<br>일일<br>불량품
											</div>
										</div>
										<div class="graph-container" title="기준 : 100개">
											<div class="bar_dpx" title="기준 : 100개"></div>
										</div>
									</div>
									<div class="entry_Bad">
										<div class="entry">
											<div class="part2">
												메인스트림<br>일일<br>불량품
											</div>
										</div>
										<div class="graph-container" title="기준 : 100개">
											<div class="bar_dmx" title="기준 : 100개"></div>
										</div>
									</div>
									<div class="main_String_Bad">
										<div class="Main_String">
											<div class="part2">
												엔트리<br>일일<br>불량품
											</div>
										</div>
										<div class="graph-container" title="기준 : 100개">
											<div class="bar_dex" title="기준 : 100개"></div>
										</div>
									</div>
								</div>
							</div>
							<div class="Stock_Request_History">
								<div class="table_SPH">
									<div class="row_SPH">
										<div class="cell_SPH">등급</div>
										<div class="cell_SPH">일일 완제품</div>
										<div class="cell_SPH">일일 불량품</div>
									</div>

									<%
									List list = (List) request.getAttribute("list");
									for (int i = 0; i < list.size(); i++) {

										Fpm_DTO dto = (Fpm_DTO) list.get(i);
									%>

									<div class="row_SPH">
										<div class="cell_SPH"><%=dto.get일일등급()%></div>
										<div class="cell_SPH"><%=dto.get일일완제품()%></div>
										<div class="cell_SPH"><%=dto.get일일불량품()%></div>
									</div>


									<%
									}
									%>


								</div>
							</div>

						</div>
					</div>

					<div class="output_font">주간 완제품 현황</div>
					<div class="output_box">
						<br>
						<div class="daily_output">
							<div class="daily_yield">
								<div class="performance_Good">
									<div class="performance">
										<div class="part1">
											퍼포먼스<br>주간<br>완제품
										</div>
									</div>
									<div class="graph-container" title="기준 : 500개">
										<div class="bar_wp" title="기준 : 500개"></div>
									</div>
								</div>
								<div class="entry_Good">
									<div class="entry">
										<div class="part1">
											메인스트림<br>주간<br>완제품
										</div>
									</div>
									<div class="graph-container" title="기준 : 500개">
										<div class="bar_wm" title="기준 : 500개"></div>
									</div>
								</div>
								<div class="main_String_Good">
									<div class="Main_String">
										<div class="part1">
											엔트리<br>주간<br>완제품
										</div>
									</div>
									<div class="graph-container" title="기준 : 500개">
										<div class="bar_we" title="기준 : 500개"></div>
									</div>
								</div>
							</div>
							<div class="daily_defects">
								<div class="performance_Bad">
									<div class="performance">
										<div class="part2">
											퍼포먼스<br>주간<br>불량품
										</div>
									</div>
									<div class="graph-container" title="기준 : 500개">
										<div class="bar_wpx" title="기준 : 500개"></div>
									</div>
								</div>
								<div class="entry_Bad">
									<div class="entry">
										<div class="part2">
											메인스트림<br>주간<br>불량품
										</div>
									</div>
									<div class="graph-container" title="기준 : 500개">
										<div class="bar_wmx" title="기준 : 500개"></div>
									</div>
								</div>
								<div class="main_String_Bad">
									<div class="Main_String">
										<div class="part2">
											엔트리<br>주간<br>불량품
										</div>
									</div>
									<div class="graph-container" title="기준 : 500개">
										<div class="bar_wex" title="기준 : 500개"></div>
									</div>
								</div>
							</div>
						</div>

						<div class="Stock_Request_History">
							<div class="table_SPH">
								<div class="row_SPH">
									<div class="cell_SPH">등급</div>
									<div class="cell_SPH">주간 완제품</div>
									<div class="cell_SPH">주간 불량품</div>
								</div>

								<%
								List list2 = (List) request.getAttribute("list2");

								for (int i = 0; i < list2.size(); i++) {

									Fpm_DTO dto2 = (Fpm_DTO) list2.get(i);
								%>

								<div class="row_SPH">
									<div class="cell_SPH"><%=dto2.get주간등급()%></div>
									<div class="cell_SPH"><%=dto2.get주간완제품()%></div>
									<div class="cell_SPH"><%=dto2.get주간불량품()%></div>
								</div>

								<%
								}
								%>

							</div>
						</div>
					</div>

					<div class="output_font">월간 완제품 현황</div>
					<div class="output_box">
						<br>
						<div class="daily_output">
							<div class="daily_yield">
								<div class="performance_Good">
									<div class="performance">
										<div class="part1">
											퍼포먼스<br>월간<br>완제품
										</div>
									</div>
									<div class="graph-container" title="기준 : 2,000개">
										<div class="bar_mp" title="기준 : 2,000개"></div>
									</div>
								</div>
								<div class="entry_Good">
									<div class="entry">
										<div class="part1">
											메인스트림<br>월간<br>완제품
										</div>
									</div>
									<div class="graph-container" title="기준 : 2,000개">
										<div class="bar_mm" title="기준 : 2,000개"></div>
									</div>
								</div>
								<div class="main_String_Good">
									<div class="Main_String">
										<div class="part1">
											엔트리<br>월간<br>완제품
										</div>
									</div>
									<div class="graph-container" title="기준 : 2,000개">
										<div class="bar_me" title="기준 : 2,000개"></div>
									</div>
								</div>
							</div>
							<div class="daily_defects">
								<div class="performance_Bad">
									<div class="performance">
										<div class="part2">
											퍼포먼스<br>월간<br>불량품
										</div>
									</div>
									<div class="graph-container" title="기준 : 2,000개">
										<div class="bar_mpx" title="기준 : 2,000개"></div>
									</div>
								</div>
								<div class="entry_Bad">
									<div class="entry">
										<div class="part2">
											메인스트림<br>월간<br>불량품
										</div>
									</div>
									<div class="graph-container" title="기준 : 2,000개">
										<div class="bar_mmx" title="기준 : 2,000개"></div>
									</div>
								</div>
								<div class="main_String_Bad">
									<div class="Main_String">
										<div class="part2">
											엔트리<br>월간<br>불량품
										</div>
									</div>
									<div class="graph-container" title="기준 : 2,000개">
										<div class="bar_mex" title="기준 : 2,000개"></div>
									</div>
								</div>
							</div>
						</div>

						<div class="Stock_Request_History">
							<div class="table_SPH">
								<div class="row_SPH">
									<div class="cell_SPH">등급</div>
									<div class="cell_SPH">월간 완제품</div>
									<div class="cell_SPH">월간 불량품</div>
								</div>

								<%
								List list3 = (List) request.getAttribute("list3");

								for (int i = 0; i < list3.size(); i++) {

									Fpm_DTO dto3 = (Fpm_DTO) list3.get(i);

									System.out.println(list3.size());
								%>

								<div class="row_SPH">
									<div class="cell_SPH"><%=dto3.get월간등급()%></div>
									<div class="cell_SPH"><%=dto3.get월간완제품()%></div>
									<div class="cell_SPH"><%=dto3.get월간불량품()%></div>
								</div>

								<%
								}
								%>

							</div>
						</div>

					</div>
		</div>


		</article>
		</section>
	</div>
	<footer>ⓒ2024 J.company System</footer>
	</div>

	<script>
        // 완제품관리 JS



// 2차 프로젝트//
let total = document.querySelectorAll(".cell_SPH");
let startNum = total[4]; 
let startNum2 = total[7]; 
let startNum3 = total[10]; 
let startNum4 = total[16]; 
let startNum5 = total[19]; 
let startNum6 = total[22]; 
let startNum7 = total[28]; 
let startNum8 = total[31]; 
let startNum9 = total[34]; 


let startbNum = total[5]; 
let startbNum2 = total[8]; 
let startbNum3 = total[11]; 
let startbNum4 = total[17]; 
let startbNum5 = total[20]; 
let startbNum6 = total[23]; 
let startbNum7 = total[29]; 
let startbNum8 = total[32]; 
let startbNum9 = total[35]; 




// 양품 셋인터벌
setInterval(function () {
	document.querySelector(".bar_dp").style.width = startNum.textContent + "%";
	if(parseInt(startNum.innerHTML) < 100) {
		startNum.innerHTML = parseInt(startNum.innerHTML) + 1;		
	} else {
	}
	document.querySelector(".bar_dm").style.width = startNum2.textContent + "%";
	if(parseInt(startNum2.innerHTML) < 100){
		startNum2.innerHTML = parseInt(startNum2.innerHTML) + 1;
	} else {
	}
	document.querySelector(".bar_de").style.width = startNum3.textContent + "%";
	if(parseInt(startNum3.innerHTML) < 100){
		startNum3.innerHTML = parseInt(startNum3.innerHTML) + 1;
	} else {
	}
},10000);

setInterval(function () {
	document.querySelector(".bar_wp").style.width = ((startNum4.textContent/500)*100) + "%";
	if(parseInt(startNum4.innerHTML) < 500) {
		startNum4.innerHTML = parseInt(startNum4.innerHTML) + 1;		
	} else {
	}
	document.querySelector(".bar_wm").style.width = ((startNum5.textContent/500)*100) + "%";
	if(parseInt(startNum5.innerHTML) < 500){
		startNum5.innerHTML = parseInt(startNum5.innerHTML) + 1;
	} else {
	}
	document.querySelector(".bar_we").style.width = ((startNum6.textContent/500)*100) + "%";
	if(parseInt(startNum6.innerHTML) < 500){
		startNum6.innerHTML = parseInt(startNum6.innerHTML) + 1;
	} else {
	}
},10000);

setInterval(function () {
	document.querySelector(".bar_mp").style.width = ((startNum7.textContent/2000)*100) + "%";
	if(parseInt(startNum7.innerHTML) < 2000) {
		startNum7.innerHTML = parseInt(startNum7.innerHTML) + 1;		
	} else {
	}
	document.querySelector(".bar_mm").style.width = ((startNum8.textContent/2000)*100) + "%";
	if(parseInt(startNum8.innerHTML) < 2000){
		startNum8.innerHTML = parseInt(startNum8.innerHTML) + 1;
	} else {
	}
	document.querySelector(".bar_me").style.width = ((startNum9.textContent/2000)*100) + "%";
	if(parseInt(startNum9.innerHTML) < 2000){
		startNum9.innerHTML = parseInt(startNum9.innerHTML) + 1;
	} else {
	}
},10000);


// 불량 셋인터벌


if(parseInt(startbNum.innerHTML) == 0){
	document.querySelector(".bar_dpx").style.display ="none";
	} 
if(parseInt(startbNum2.innerHTML) == 0){
	document.querySelector(".bar_dmx").style.display ="none";
	} 
if(parseInt(startbNum3.innerHTML) == 0){
	document.querySelector(".bar_dex").style.display ="none";
	} 

if(parseInt(startbNum4.innerHTML) == 0){
	document.querySelector(".bar_wpx").style.display ="none";
	} 
if(parseInt(startbNum5.innerHTML) == 0){
	document.querySelector(".bar_wmx").style.display ="none";
	} 
if(parseInt(startbNum6.innerHTML) == 0){
	document.querySelector(".bar_wex").style.display ="none";
	} 

if(parseInt(startbNum7.innerHTML) == 0){
	document.querySelector(".bar_mpx").style.display ="none";
	} 
if(parseInt(startbNum8.innerHTML) == 0){
	document.querySelector(".bar_mmx").style.display ="none";
	} 
if(parseInt(startbNum9.innerHTML) == 0){
	document.querySelector(".bar_mex").style.display ="none";
	} 
	
	
	

setInterval(function () {
	document.querySelector(".bar_dpx").style.width = startbNum.textContent + "%";
	if(parseInt(startbNum.innerHTML) < 100) {
	document.querySelector(".bar_dpx").style.display ="block";
		startbNum.innerHTML = parseInt(startbNum.innerHTML) + 1;		
	} else {
	}
	
	
	document.querySelector(".bar_dmx").style.width = startbNum2.textContent + "%";
	if(parseInt(startbNum2.innerHTML) < 100){
	document.querySelector(".bar_dmx").style.display ="block";
		startbNum2.innerHTML = parseInt(startbNum2.innerHTML) + 1;
	} else {
	}
	document.querySelector(".bar_dex").style.width = startbNum3.textContent + "%";
	if(parseInt(startbNum3.innerHTML) < 100){
	document.querySelector(".bar_dex").style.display ="block";
		startbNum3.innerHTML = parseInt(startbNum3.innerHTML) + 1;
	} else {
	}
},10000);

setInterval(function () {
	document.querySelector(".bar_wpx").style.width = ((startbNum4.textContent/500)*100) + "%";
	if(parseInt(startbNum4.innerHTML) < 500) {
	document.querySelector(".bar_wpx").style.display ="block";
		startbNum4.innerHTML = parseInt(startbNum4.innerHTML) + 1;		
	} else {
	}
	document.querySelector(".bar_wmx").style.width = ((startbNum5.textContent/500)*100) + "%";
	if(parseInt(startbNum5.innerHTML) < 500){
	document.querySelector(".bar_wmx").style.display ="block";
		startbNum5.innerHTML = parseInt(startbNum5.innerHTML) + 1;
	} else {
	}
	document.querySelector(".bar_wex").style.width = ((startbNum6.textContent/500)*100) + "%";
	if(parseInt(startbNum6.innerHTML) < 500){
	document.querySelector(".bar_wex").style.display ="block";
		startbNum6.innerHTML = parseInt(startbNum6.innerHTML) + 1;
	} else {
	}
},10000);

setInterval(function () {
	document.querySelector(".bar_mpx").style.width = ((startbNum7.textContent/2000)*100) + "%";
	if(parseInt(startbNum7.innerHTML) < 2000) {
	document.querySelector(".bar_mpx").style.display ="block";
		startbNum7.innerHTML = parseInt(startbNum7.innerHTML) + 1;		
	} else {
	}
	document.querySelector(".bar_mmx").style.width = ((startbNum8.textContent/2000)*100) + "%";
	if(parseInt(startbNum8.innerHTML) < 2000){
	document.querySelector(".bar_mmx").style.display ="block";
		startbNum8.innerHTML = parseInt(startbNum8.innerHTML) + 1;
	} else {
	}
	document.querySelector(".bar_mex").style.width = ((startbNum9.textContent/2000)*100) + "%";
	if(parseInt(startbNum9.innerHTML) < 2000){
	document.querySelector(".bar_mex").style.display ="block";
		startbNum9.innerHTML = parseInt(startbNum9.innerHTML) + 1;
	} else {
	}
},10000);




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

        document.querySelector("#adminTitle").style.display = 'block';
        document.querySelector("#adminNav").style.display = 'block';
        // document.querySelector(".workerGrade").innerHTML = '작업자<br>';
        document.querySelector(".workerGrade").innerHTML = '관리자<br>';

        // document.querySelector("#adminTitle").style.display = 'none';
        // document.querySelector("#adminNav").style.display = 'none';

    </script>
</body>

</html>