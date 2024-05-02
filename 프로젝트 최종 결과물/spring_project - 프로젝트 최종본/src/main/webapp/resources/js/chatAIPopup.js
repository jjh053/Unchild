let query = document.querySelector("#AI_userQuery");
		let closeButton = document.querySelector("#AI_closeButton");
		let sendButton = document.querySelector("#AI_sendButton");
		let talkArea = document.querySelector("#AI_talkArea");
		let talkOnceArea = document.querySelector(".AI_talkOnceArea");
		let aiResultArea = document.querySelector(".AI_aiResultArea");
		
		let AI_data = "";
		
		// 질문을 작성 후 엔터를 눌렀을때
		query.addEventListener("keydown", (event) => {
		    if (event.key == "Enter") {
		        // 줄바꿈 방지
		        event.preventDefault();
		
		        console.log("엔터입력 내용 : " + query.value);
		
		        // 새로운 대화 영역 생성
		        let newTalkArea = document.createElement("div");
		        newTalkArea.className = "AI_talkOnceArea";
		
		        let queryDiv = document.createElement("div");
		        queryDiv.className = "AI_queryArea";
		        queryDiv.innerText = query.value;
		
		        let aiResultDiv = document.createElement("div");
		        aiResultDiv.className = "AI_aiResultArea";
		        aiResultDiv.innerText = "답변을 작성하고있습니다...";
		
		        newTalkArea.appendChild(queryDiv);
		        newTalkArea.appendChild(aiResultDiv);
		
		        talkArea.appendChild(newTalkArea);
		
		        AI_doAjax();
		        scrollToBottom();
		        query.value = "";
		    }
		});
		
		
		
		// 전송 버튼을 눌렀을때
		sendButton.addEventListener("click", () => {
			console.log("전송 클릭 내용 : " + query.value);
			// 새로운 대화 영역 생성
	        let newTalkArea = document.createElement("div");
	        newTalkArea.className = "AI_talkOnceArea";
	
	        let queryDiv = document.createElement("div");
	        queryDiv.className = "AI_queryArea";
	        queryDiv.innerText = query.value;
	
	        let aiResultDiv = document.createElement("div");
	        aiResultDiv.className = "AI_aiResultArea";
	        aiResultDiv.innerText = "답변을 작성하고있습니다...";
	
	        newTalkArea.appendChild(queryDiv);
	        newTalkArea.appendChild(aiResultDiv);
	
	        talkArea.appendChild(newTalkArea);
	
	        AI_doAjax();
	        scrollToBottom();
	        query.value = "";
		})

		// 아작스
		function AI_doAjax() {
			let xhr = new XMLHttpRequest();
			xhr.open("post", "chatmain", true);
			xhr.setRequestHeader("Content-Type",
					"application/x-www-form-urlencoded");

			let param = "";
			param += "query=" + encodeURIComponent(query.value);

			xhr.send(param);

			xhr.onload = function() {
				AI_data = xhr.responseText;
				console.log("AI_data : " + AI_data);
				
				// 줄 바꿈 문자를 <br> 태그로 대체
				AI_data = AI_data.replace(/\\n/g, "<br>");
				AI_data = AI_data.replace(/\\/g, "");
				
			    console.log("replace 후 : ", AI_data);

				let aiResultDiv = document.createElement("div");
                aiResultDiv.className = "AI_aiResultArea";
                aiResultDiv.innerHTML = AI_data;
                talkArea.lastChild.replaceChild(aiResultDiv, talkArea.lastChild.lastChild);
                scrollToBottom();
			}
		}
		
		
		// 메시지 영역 스크롤 최하단 고정
		function scrollToBottom() {
			talkArea.scrollTop = talkArea.scrollHeight;
		}