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
#replyToTalZip {
   padding-top: 30px;
   border-bottom: 1px solid #ccc;
}

#reWriter {
   border: 1px solid red;
   border-radius: 5px;
   font-size: 12px;
   padding: 3px;
   margin-left: 10px;
   background-color: red;
   color: #fff;
}

#replyReply {
   background: #3498DB;
   color: #fff;
   border: 0;
   border-radius: 5px;
   width: 60px;
   height: 20px;
   cursor: pointer;
   font-size: 12px;
   margin-left: 5px;
}

#replyReply:hover {
   background-color: blue;
   transition: background-color 0.3s ease;
}

#replyInfo {
   font-size: 20px;
   margin-bottom: 5px;
   display: flex;
}

#replyTime {
   margin-top: 10px;
   margin-bottom: 20px;
   font-size: 12px;
   color: #aaa;
}

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

#replyArea div {
   text-align: left;
}

#replyArea {
   width: 700px;
   display: flex;
   flex-direction: column;
   margin-top: 20px;
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
                     <!--                      <li><a href="facilityMonitoring.html">설비 모니터링</a></li> -->
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
               <h2>자유게시판</h2>
<!--                <button type="button" id="qrAjaxBtn">QR</button> -->
<!--                <input type="text" id="qrText"> -->
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
                        <td style="display: none" id="userIdWrite">${board.staffno}</td>
                        <td>${board.b_sequence }</td>
                        <td class="tableTdTitle" data-seq="${board.b_sequence}">${board.b_title}</td>
                        <td style="display: none;"><textarea class="contentBox">${board.b_content}</textarea></td>
                        <td class="writer">${board.sname}</td>
                        <fmt:formatDate value="${board.b_date}"
                           pattern="yyyy-MM-dd HH:mm:ss" var="formattedDate" />
                        <td>${formattedDate}</td>
                        <td class="viewCount">${board.b_view}</td>
                        <td class="hiddenTd">
                           <!-- 삭제 버튼 -->
                           <button type="button" name="${board.b_sequence}"
                              class="deleteBtn" onclick="deletePost(${board.b_sequence})">삭제</button>
                           <input type="hidden" class="hiddenFile"
                           value="${board.fileName }">
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
                        <ll> <a
                           href="${pageContext.request.contextPath}/boardTable.do?pageNum=${end + 1}&boardType=자유게시판">[다음]</a></ll>
                     </c:if>
                     <c:if test="${pageNum == lastPage}">
                        <li>[다음]</li>
                     </c:if>
                  </ul>
               </div>


            </div>
            <form method="post" action="doi" enctype="multipart/form-data">
               <div id="writeDiv">
                  <div class="whiteBoard">
                     <div>
                        <span style="font-size: 20px; font-weight: bold;">글 작성</span>
                     </div>
                     <table id="writeTable">
                        <tr>
                           <td style="display: none">
                              <input type="text" name="boardType" value="자유게시판">
                           </td>
                           <td style="display: none">
                              <input type="text" name="sname" value="<%=userId%>">
                           </td>
                           <td style="display: none">
                              <input type="text" name="b_view" value="0">
                           </td>
                           <td style="display: none">
                              <input type="text" name="staffno" value="<%=staffno%>">
                           </td>
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

            <div id="myModal" class="modal2">
               <div class="modal-content">
                  <span id="closeModalBtn" class="x-button"></span>
                  <form method="post" action="dou">
                     <table id="readTable">
                        <tr style="display: none">
                           <td><input type="hidden" id="seq" name="b_sequence"
                              value=""> <input type="hidden" name="boardType"
                              value="자유게시판"></td>
                        </tr>
                        <tr>
                           <th>제목</th>
                           <td><input type="text" id="readTitle" name="b_title"
                              readonly></td>
                        </tr>
                        <tr>
                           <th>작성자</th>
                           <td><input type="text" id="writer" name="sname" readonly></td>
                        </tr>
                        <tr>
                           <th>내용</th>
                           <td>
                              <div id="imgDiv"></div> 
                              <textarea id="textContentBox" name="b_content" rows="10" cols="35" readonly>
                              </textarea>
                           </td>
                        </tr>
                     </table>
                     <div class="btnZip">
                        <button type="button" id="crystalBtn">수정</button>
                        <button type="submit" id="jewelerBtn">수정완료</button>
                        <button type="button" id="delBtn">삭제</button>
                     </div>
                  </form>
                  <br> <br>
                  <hr>
                  <div id="reflyTextArea">
                     <h2>댓글</h2>
                     <div id="replyArea"></div>
                     <div style="position: relative" id="replyReplyArea">
                        <input type="hidden" name="staffno" value="<%=staffno %>">
                        <input type="hidden" name="b_view" value="0"> <input
                           type="hidden" name="boardType" value="댓글"> <input
                           type="hidden" name="replyId">
                        <textarea name="b_content" id="b_content_ajax"></textarea>
                        <button type="button" id="reflySend">></button>
                     </div>
                  </div>
               </div>
            </div>
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
            console.log("seq : " + seq);
            
            document.querySelector("[name=replyId]").value = seq;
            console.log(document.querySelector("[name=replyId]").value);
            doReplyAjax(seq);
            
            delBtn2nd.addEventListener("click", () => {
               deletePost(seq);
            })
         })
      }
      
      let replyDom = "";
      function doReply() {
         let replyReply = document.querySelectorAll("#replyReply");
         console.log(replyReply.length); // 0
         
         for (let i = 0; i < replyReply.length; i++) {
             replyReply[i].addEventListener("click", (event) => {
                replyDom = event.target;
                 let html = '';
                 html += '<div style="position: relative" id="replyReplyArea">';
                 html += '   <input type="hidden" name="staffno" value="<%=staffno %>">';
                 html += '   <input type="hidden" name="b_view" value="0">';
                 html += '   <input type="hidden" name="boardType" value="댓글">';
                 html += '   <input type="hidden" name="replyId" value="' + event.target.parentNode.parentNode.querySelector("#replyReId").value + '">';
                 html += '   <textarea name="b_content" id="b_content_ajax"></textarea>';
                 html += '   <button type="button" id="reReflySend">></button>';
                 html += '</div>';
                 console.log(html);
                 
                 let newHeader = "<h3 style='margin-left: 20px;'>ㄴ답글</h3>";
                 let styleTag = "<style> #reflyTextArea textarea {margin: 0; margin-left: 30px;} #reflyTextArea #reReflySend {top: 30px;} </style>";
                 event.target.parentNode.parentNode.insertAdjacentHTML("beforeend", newHeader);
                 event.target.parentNode.parentNode.insertAdjacentHTML("beforeend", styleTag);
                 event.target.parentNode.parentNode.insertAdjacentHTML("beforeend", html);

                 let reReflySend = document.querySelectorAll("#reReflySend"); // 여기서 다시 reReflySend를 선언
                 console.log("?????????????????????" + reReflySend.length); // 이제 1이 나와야 함

                 for(let j=0; j<reReflySend.length; j++) {
                     reReflySend[j].addEventListener("click", (event) => {
                         console.log(event.target.parentNode.parentNode);
                         let param = {
                             b_title : "댓글",
                             b_content : event.target.parentNode.parentNode.querySelector("[id=b_content_ajax]").value,
                             staffno : event.target.parentNode.parentNode.querySelector("[name=staffno]").value,
                             b_view : 0,
                             boardType : '댓글',
                             replyId : event.target.parentNode.parentNode.querySelector("[name=replyId]").value
                         };
                         doAjax(param);
                     });
                 }
             });
         }
      }
      
      
      
      function doReplyAjax(seq) {
         let xhr = new XMLHttpRequest();
         xhr.open("post", "replyList", true);
         xhr.setRequestHeader("Content-Type", "application/json");
         console.log();
         let param = {
               b_sequence : seq
         };
         
         xhr.send(JSON.stringify(param));
         let html = '';
         xhr.onload = function() {
            let json_data = xhr.responseText;
            let data = JSON.parse(json_data);
            console.log(data);
            
            for(let i=0; i<data.replyList.length; i++) {
               
               let writer = document.querySelector("#writer");
               console.log(data.replyList[i].b_date);
               let date = new Date(data.replyList[i].b_date);
               let year = date.getFullYear();
               let month = (date.getMonth() + 1).toString().padStart(2, '0');
               let day = date.getDate().toString().padStart(2, '0');
               let hours = date.getHours().toString().padStart(2, '0');
               let minutes = date.getMinutes().toString().padStart(2, '0');
               let seconds = date.getSeconds().toString().padStart(2, '0');
               let formattedDateTime = year + '-' + month + '-' + day + ' ' + hours + ':' + minutes + ':' + seconds;
               
               html += '<div id="replyToTalZip" style=" padding-left:' + (data.replyList[i].level - 1) * 50 + 'px;">';
               html += '   <input type="hidden" id="replyReId" value=' + data.replyList[i].b_sequence + '>';
               html += '   <div id="replyInfo">';
               html += '      <span id="reName">' + data.nameList[i] + '</span>';
               if(data.nameList[i] == writer.value) {
                  html += '   <span id="reWriter">작성자</span>';
               }
               html += '   </div>';
               html += '   <div id="replyContent">';
               html += '      <span id="reContent">' + data.replyList[i].b_content + '</span>';
               html += '   </div>';
               html += '   <div id="replyTime">';
               html += '      <span id="reDate">' + formattedDateTime + '</span>';
               html += '      <button type="button" id="replyReply">답글쓰기</button>';
               html += '   </div>';
               html += '</div>';
            }
            document.querySelector("#replyArea").innerHTML = document.querySelector("#replyArea").innerHTML + html;
            doReply();
         }
      }
      
      
      
      document.querySelector("#reflySend").addEventListener("click", () => {
         let param = {
                  b_title : "댓글",
                  b_content : document.querySelector("[id=b_content_ajax]").value,
                  staffno : document.querySelector("[name=staffno]").value,
                  b_view : 0,
                  boardType : '댓글',
                  replyId : document.querySelector("[name=replyId]").value
         };
         doAjax(param);
      })
      
      
      function doAjax(param) {
         let xhr = new XMLHttpRequest();
         xhr.open("post", "doii", true);
         xhr.setRequestHeader("Content-Type", "application/json");

         xhr.send(JSON.stringify(param));
         
         xhr.onload = function() {
            let data = xhr.responseText;
            console.log("doAjax > data : " + data);
            if(data == "SUCC") {
               var style = window.getComputedStyle(replyDom);
               var paddingLeft = parseFloat(style.paddingLeft);
               var newPaddingLeft = paddingLeft + 50;
               
               let date = new Date();
               let year = date.getFullYear();
               let month = (date.getMonth() + 1).toString().padStart(2, '0');
               let day = date.getDate().toString().padStart(2, '0');
               let hours = date.getHours().toString().padStart(2, '0');
               let minutes = date.getMinutes().toString().padStart(2, '0');
               let seconds = date.getSeconds().toString().padStart(2, '0');
               let formattedDateTime = year + '-' + month + '-' + day + ' ' + hours + ':' + minutes + ':' + seconds;
               
               html = "";
               html += '<div id="replyToTalZip" style=" padding-left:' + newPaddingLeft + 'px;">';
               html += '   <div id="replyInfo">';
               html += '      <span id="reName">' + document.querySelector("#workerName").textContent.trim().substring(document.querySelector("#workerName").textContent.trim().length-3,document.querySelector("#workerName").textContent.trim().length) + '</span>';
               if(document.querySelector("#workerName").textContent.trim().substring(document.querySelector("#workerName").textContent.trim().length-3,document.querySelector("#workerName").textContent.trim().length) == writer.value) {
                  html += '   <span id="reWriter">작성자</span>';
               }
               html += '   </div>';
               html += '   <div id="replyContent">';
               html += '      <span id="reContent">' + param.b_content + '</span>';
               html += '   </div>';
               html += '   <div id="replyTime">';
               html += '      <span id="reDate">' + formattedDateTime + '</span>';
               html += '      <button type="button" id="replyReply">답글쓰기</button>';
               html += '   </div>';
               html += '</div>';
               replyDom.parentNode.parentNode.querySelector("h3").style.display = "none";
               replyDom.parentNode.parentNode.querySelector("#replyReplyArea").style.display = "none";
               replyDom.parentNode.parentNode.innerHTML += html;
               
            }
         }
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
           event.preventDefault();
           event.stopPropagation();

           let selectedFile = event.target.files && event.target.files.length > 0 ? event.target.files[0] : null; // 수정된 부분

           if (selectedFile) {
               fileNameDisplay.textContent = selectedFile.name;
               displayImagePreview(selectedFile);
           } else {
               fileNameDisplay.textContent = '선택된 파일 없음';
               img_preview.innerHTML = '이미지 없음';
           }
       });
      
      
//       function qrAjax() {
//          let url = "http://192.168.1.62:8001/api/qr/getLastData";
//          let qrText = document.querySelector("#qrText");
         
//          let xhr = new XMLHttpRequest();
//          xhr.open("get", url, true);
//          xhr.setRequestHeader("Content-Type", "application/json");

//          xhr.send();
         
//          xhr.onload = function() {
//             let json_data = xhr.responseText;
//             let data = JSON.parse(json_data);
//             console.log("qrAjax > data : " , data);
            
//             console.log("data.out_data : " + data.out_data);
//             qrText.value = data.out_data;
//          }
//       }
      
//       let qrBtn = document.querySelector("#qrAjaxBtn");
//       qrBtn.addEventListener("click", () => {
//          qrAjax();
//       })
      
      
      
      
      
   </script>
   <script src="${pageContext.request.contextPath}/js/bt.js"></script>
</body>

</html>