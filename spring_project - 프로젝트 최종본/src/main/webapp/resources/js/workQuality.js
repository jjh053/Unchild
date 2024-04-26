window.addEventListener("load", function () {

qualityPopup(role);
addPopup(role);
retouchPopup(role);
sendError(role);
console.log(role);
//    document.querySelector("#mainTitle2").style.display = "block";
//
    const hover = document.querySelectorAll('a.hover');
    const menuBar = document.querySelector('.menu-bar');
    const nav = document.querySelector('nav');

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
    
    const wrap = document.querySelector('.wrap');

    const section = document.querySelector('section');
    section.addEventListener("click", function () {
        hideMenuBar();
    })
//
//    let id = "admin";
//
//    document.querySelector("#complete-button")
//        .addEventListener("click", function () {
//            id = "admin";
//            user_check(id);
//        });
//    document.querySelector("#user")
//        .addEventListener("click", function () {
//            id = "user";
//            user_check(id);
//        });


//    function user_check(id) {
//
//        if (id == "user") {
//            document.querySelector("#mainTitle1").style.display = "block";
//            document.querySelector("#mainTitle2").style.display = "none";
//            document.querySelector("#article-work-main").style.display = "block";
//            document.querySelector("#complete-button-div").style.display = "block";
//            document.querySelector("#work-checker").style.display = "block";
//            document.querySelector("#add-button-div").style.display = "none";
//
//            let delete_checkbox_div = document.getElementsByClassName("delete-checkbox-div");
//
//            for (let i = 0; i < delete_checkbox_div.length; i++) {
//                delete_checkbox_div[i].style.display = "none";
//            }
//
//            let error_checkbox_div = document.getElementsByClassName("error-checkbox-div");
//
//            for (let i = 0; i < error_checkbox_div.length; i++) {
//                error_checkbox_div[i].style.display = "block";
//            }
//            
//            let error_quantity = document.getElementsByClassName("error-quantity");
//            
//            for (let i = 0; i < error_quantity.length; i++) {
//                error_quantity[i].style.display = "block";
//            }
//
//        } else if (id == "admin") {
//            document.querySelector("#mainTitle1").style.display = "none";
//            document.querySelector("#mainTitle2").style.display = "block";
//            document.querySelector("#article-work-main").style.display = "block";
//            document.querySelector("#add-button-div").style.display = "block";
//            document.querySelector("#work-checker").style.display = "none";
//            document.querySelector("#complete-button-div").style.display = "none";
//
//            let delete_checkbox_div = document.getElementsByClassName("delete-checkbox-div");
//
//            for (let i = 0; i < delete_checkbox_div.length; i++) {
//                delete_checkbox_div[i].style.display = "block";
//            }
//
//            let error_checkbox_div = document.getElementsByClassName("error-checkbox-div");
//
//            for (let i = 0; i < error_checkbox_div.length; i++) {
//                error_checkbox_div[i].style.display = "none";
//            }
//            
//            let error_quantity = document.getElementsByClassName("error-quantity");
//            
//            for (let i = 0; i < error_quantity.length; i++) {
//                error_quantity[i].style.display = "none";
//                console.log(error_quantity[i]);
//            }
//
//        }
//
//    };





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

    





//    // 품질불량 체크사항 삭제하기 --기본사항
//    const list_delete = document.getElementById("list-delete");
//
//
//    list_delete.addEventListener("click", function () {
//
//        const delete_checked = document.querySelectorAll(".delete-checkbox:checked");
//
//        for (let i = 0; i < delete_checked.length; i++) {
//
//
//            delete_checked[i].closest(".work-check-list").style.display = "none";
//        }
//
//    });







    

	

    // 품질불량 체크사항 추가사항 적용하기

//    document.querySelector("#add-apply-button")
//        .addEventListener("click", function () {
//
//            const add_title = document.querySelector("#add-title");
//            const add_detail = document.querySelector("#add-detail");
//            const work_quality = document.querySelector("#work-quality");
//
//
//
//
//            let detail = add_detail.value.split("\n");
//
//            let detail_content = "";
//
//            for (let i = 0; i < detail.length; i++) {
//
//                detail_content += `<div class="work-check-list-content">
//                                        <span>
//                                            -${detail[i]}
//                                            <div class="error-checkbox-div">
//                                                <input type="checkbox" class="error-checkbox">
//                                            </div>
//                                        </span>
//                                    </div>`;
//
//            }
//
//
//            let html = "";
//            html += `<div class="work-check-list">
//                            <h3>
//                                ${add_title.value}
//                                <div class="delete-checkbox-div">
//                                    <input type="checkbox" class="delete-checkbox">
//                                </div>
//                            </h3>
//                                ${detail_content}
//                        </div>`;
//
//            console.log("클릭됨");
//            let add_div = document.createElement("div");
//            add_div.innerHTML = html;
//            work_quality.append(add_div);
//
//        });

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

//    document.querySelector("#adminTitle").style.display = 'block';
//    document.querySelector("#adminNav").style.display = 'block';
//    document.querySelector(".workerGrade").innerHTML = '작업자<br>';
    // document.querySelector(".workerGrade").innerHTML = '관리자<br>';

    // document.querySelector("#adminTitle").style.display = 'none';
    // document.querySelector("#adminNav").style.display = 'none';

});

function qualityPopup(userRole) {
	
	if(userRole == "WORKER") {
		
		// 품질검사 지침서 팝업
	    // 팝업 div 랑 버튼가져오기
	    const work_popup = document.getElementById("work-popup");
	    const work_button = document.getElementById("work-checker-button");
	    const close_btn = document.getElementById("close-popup-btn");
	
	    // 팝업 div 열기
	    work_button.addEventListener("click", function () {
	        work_popup.style.display = "block";
	        // 다른영역 클릭 비활성화
	        work_popup.style.pointerEvents = "auto";
	    });
	
	    // 팝업 div 닫기 => 닫기버튼누를시
	    close_btn.addEventListener("click", function () {
	        work_popup.style.display = "none";
	        // 다른영역 클릭 활성화
	        work_popup.style.pointerEvents = "none";
	    });
	
	    // 팝업 div 닫기버튼 비활성화
	    work_popup.addEventListener("click", function (event) {
	        event.stopPropagation();
	    });
	
	    // 팝업 div 닫기버튼 활성화
	    window.addEventListener("click", function (event) {
	        if (event.target == work_popup) {
	            work_popup.style.display = "none";
	            // 다른영역 클릭 활성화
	            work_popup.style.pointerEvents = "none";
	        }
	    });
	}
}

function addPopup(role) {
	
	if(role == "ADMIN") {
		
		// 품질불량 체크사항 추가하기 팝업
	    const add_popup = document.getElementById("quality-add-popup");
	    
	    const list_add_button = document.getElementById("list-add-button");
	 
	    const add_apply_button = document.getElementById("add-apply-button");
	    const cancel_apply_button = document.getElementById("cancel-apply-button");
	
	    // 팝업 div 열기
	    list_add_button.addEventListener("click", function () {
	
	        const add_title = document.querySelector("#add-title");
	        const add_detail = document.querySelector("#add-detail");
	        add_title.value = "";
	        add_detail.value = "";
	
	        add_popup.style.display = "block";
	
	        // 다른영역 클릭 비활성화
	        add_popup.style.pointerEvents = "auto";
	    });
	
	    // 팝업 div 닫기 => 적용,취소버튼누를시
	    add_apply_button.addEventListener("click", function () {
	        add_popup.style.display = "none";
	        // 다른영역 클릭 활성화
	        add_popup.style.pointerEvents = "none";
	    });
	
	    cancel_apply_button.addEventListener("click", function () {
	        add_popup.style.display = "none";
	        // 다른영역 클릭 활성화
	        add_popup.style.pointerEvents = "none";
	    });
	
	    // 팝업 div 닫기버튼 비활성화
	    add_popup.addEventListener("click", function (event) {
	        event.stopPropagation();
	    });
	
	    // 팝업 div 닫기버튼 활성화
	    window.addEventListener("click", function (event) {
	
	        if (event.target == add_popup) {
	            add_popup.style.display = "none";
	            // 다른영역 클릭 활성화
	            add_popup.style.pointerEvents = "none";
	        }
	    });
	}
}

function retouchPopup(role) {
	
	if(role == "ADMIN") {
		
		// 품질불량 체크사항 수정하기 팝업
	    const retouch_popup = document.getElementById("quality-retouch-popup");
	    const list_retouch_button = document.getElementById("list-retouch-button");
	    const retouch_apply_button = document.getElementById("retouch-apply-button");
	    const retouch_cancel_apply_button = document.getElementById("retouch-cancel-apply-button");
	
	    // 팝업 div 열기
	    list_retouch_button.addEventListener("click", function () {
	
	        const retouch_title = document.querySelector("#retouch-title");
	        const retouch_detail = document.querySelector("#retouch-detail");
	        retouch_title.value = "";
	        retouch_detail.value = "";
	
	        retouch_popup.style.display = "block";
	
	        // 다른영역 클릭 비활성화
	        retouch_popup.style.pointerEvents = "auto";
	        
	        // 체크된 체크박스 가져오기
	        let checked = document.querySelectorAll(".delete-checkbox:checked");
	        
	        // 폼에 추가할 데이터 넣어주기
	        let form = document.querySelector(".retouch-note");       
	        console.log(form + "수정폼");
	//        checked.forEach(function(checkbox) {
	//			
	//		    let input = document.createElement("input");
	//		    input.type = "hidden";
	//		    input.name = "w_bord_seq";
	//		    input.value = checkbox.value;
	//		    console.log(checkbox.value);
	//		    form.appendChild(input);
	//		});
	
	//		checked.forEach(function(checkbox) {
	//		    let hiddenInput = '<input type="hidden" name="w_bord_seq" value="' + checkbox.value + '">';
	//		    form.insertAdjacentHTML('beforeend', hiddenInput);
	//		});
	
			checked.forEach(function(checkbox) {
				
			    // 체크된 요소의 부모 요소인 workList 가져옴
				let workList = checkbox.closest('.work-check-list');
				
				// workList 내의 workOrder 요소에서 내용을 가져옴
	//		    let title = workList.querySelector('.w_title').innerText;
	//		    let detail = workList.querySelector('.w_detail').innerText;
	//			console.log("detail : " + detail)
	
	//			document.querySelector("#retouch-title").value = title;
	//	        document.querySelector("#retouch-detail").value = detail;
				
			    let input = document.createElement("input");
			    input.type = "hidden";
			    input.name = "w_bord_seq";
			    input.value = checkbox.value;
				console.log("seq : " + checkbox.value)
			    form.appendChild(input);
			});
	    });
	
	    // 팝업 div 닫기 => 적용,취소버튼누를시
	    retouch_apply_button.addEventListener("click", function () {
	        retouch_popup.style.display = "none";
	        // 다른영역 클릭 활성화
	        retouch_popup.style.pointerEvents = "none";
	    });
	
	    retouch_cancel_apply_button.addEventListener("click", function () {
	        retouch_popup.style.display = "none";
	        // 다른영역 클릭 활성화
	        retouch_popup.style.pointerEvents = "none";
	    });
	
	    // 팝업 div 닫기버튼 비활성화
	    retouch_popup.addEventListener("click", function (event) {
	        event.stopPropagation();
	    });
	
	    // 팝업 div 닫기버튼 활성화
	    window.addEventListener("click", function (event) {
	
	        if (event.target == retouch_popup) {
	            retouch_popup.style.display = "none";
	            // 다른영역 클릭 활성화
	            retouch_popup.style.pointerEvents = "none";
	        }
	    });
	}
}

function sendError(role) {
	
	if(role == "WORKER") {
		
		document.querySelector("#send-button")
				.addEventListener("click", function () {
					
					let select = document.querySelector("#facility");
					let selectIndex = select.selectedIndex;
					let selectValue = select.options[selectIndex].value;
					let passNum = select.options[selectIndex].getAttribute("data-type");
					console.log("selectValue"+selectValue);
					console.log("passnum" + passNum);
					
					let errorCheck = document.querySelectorAll(".error-checkbox:checked");
					let checkMsg = "";
					
					errorCheck.forEach(function(checkbox) {
						
						// 형제요소를 찾아줌
						let hiddenInput = checkbox.previousElementSibling;
						let value = hiddenInput.value;
						checkMsg += value;
					}); 
					
					let errorQuantity = document.getElementsByClassName("error-quantity");
					let value = 0;
					
					for (let i = 0; i < errorQuantity.length; i++) {
						if (!isNaN(parseInt(errorQuantity[i].value))) {
	    					value += parseInt(errorQuantity[i].value);
					console.log("errorQuantity[i].value" + errorQuantity[i].value);
						}
					}
					console.log("value" + value);
					
	//				let time = new Date();
	//				
	//				let year = time.getFullYear();
	//				let month = time.getMonth() + 1;
	//				let date = time.getDate();
	//				let hours = time.getHours();
	//				let minutes = time.getMinutes();
	//				let sendTime = `${year}-${String(month).padStart(2, '0')}-${String(date).padStart(2, '0')} ${String(hours).padStart(2, '0')}:${String(minutes).padStart(2, '0')}`;
	
					let form = document.createElement("form");
					form.setAttribute("method", "post");
					form.setAttribute("action", "workQuality/send");
					
					let seqInput = document.createElement("input");
					seqInput.setAttribute("type", "text");
					seqInput.setAttribute("name", "procid");
					seqInput.setAttribute("value", selectValue);
					form.appendChild(seqInput);
					
					let detailInput = document.createElement("input");
					detailInput.setAttribute("type", "text");
					detailInput.setAttribute("name", "quality_detail");
					detailInput.setAttribute("value", checkMsg);
					form.appendChild(detailInput);
					
	//				let timeInput = document.createElement("input");
	//				timeInput.setAttribute("type", "text");
	//				timeInput.setAttribute("name", "end_time");
	//				timeInput.setAttribute("value", sendTime);
	//				form.appendChild(timeInput);
					
					let workerId = document.querySelector("#workerId");
					let workerInput = document.createElement("input");
					workerInput.setAttribute("type", "text");
					workerInput.setAttribute("name", "staffno");
					workerInput.setAttribute("value", workerId.value);
					form.appendChild(workerInput);
					
					let passInput = document.createElement("input");
					passInput.setAttribute("type", "text");
					passInput.setAttribute("name", "pass");
					passInput.setAttribute("value", passNum);
					form.appendChild(passInput);
					
					let unclearInput = document.createElement("input");
					unclearInput.setAttribute("type", "text");
					unclearInput.setAttribute("name", "unclear_num");
					unclearInput.setAttribute("value", value);
					form.appendChild(unclearInput);
	
					document.body.appendChild(form);
					
					form.submit();
				});
	}
}