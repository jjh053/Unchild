window.addEventListener("load", function() {

    document.querySelector("#mainTitle2").style.display = "block";

        const hover = document.querySelectorAll('a.hover');
        const menuBar = document.querySelector('.menu-bar');
        const nav = document.querySelector('nav');
        const wrap = document.querySelector('.wrap');

        let id = "admin";

        document.querySelector("#complete-button")
            .addEventListener("click", function () {
                id = "admin";
                user_check(id);
            });
        document.querySelector("#user")
            .addEventListener("click", function () {
                id = "user";
                user_check(id);
            });


        function user_check(id) {

            if (id == "user") {
                document.querySelector("#mainTitle1").style.display = "block";
                document.querySelector("#mainTitle2").style.display = "none";
                document.querySelector("#article-work-main").style.display = "block";
                document.querySelector("#complete-button-div").style.display = "block";
                document.querySelector("#work-checker").style.display = "block";
                document.querySelector("#add-button-div").style.display = "none";

                let delete_checkbox_div = document.getElementsByClassName("delete-checkbox-div");

                for (let i = 0; i < delete_checkbox_div.length; i++) {
                    delete_checkbox_div[i].style.display = "none";
                }

                let error_checkbox_div = document.getElementsByClassName("error-checkbox-div");

                for (let i = 0; i < error_checkbox_div.length; i++) {
                    error_checkbox_div[i].style.display = "block";
                }

            } else if (id == "admin") {
                document.querySelector("#mainTitle1").style.display = "none";
                document.querySelector("#mainTitle2").style.display = "block";
                document.querySelector("#article-work-main").style.display = "block";
                document.querySelector("#add-button-div").style.display = "block";
                document.querySelector("#work-checker").style.display = "none";
                document.querySelector("#complete-button-div").style.display = "none";

                let delete_checkbox_div = document.getElementsByClassName("delete-checkbox-div");

                for (let i = 0; i < delete_checkbox_div.length; i++) {
                    delete_checkbox_div[i].style.display = "block";
                }

                let error_checkbox_div = document.getElementsByClassName("error-checkbox-div");

                for (let i = 0; i < error_checkbox_div.length; i++) {
                    error_checkbox_div[i].style.display = "none";
                }

            }

        };





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







        // 품질불량 체크사항 삭제하기 --기본사항
        const list_delete = document.getElementById("list-delete");


        list_delete.addEventListener("click", function () {

            const delete_checked = document.querySelectorAll(".delete-checkbox:checked");

            for (let i = 0; i < delete_checked.length; i++) {


                delete_checked[i].closest(".work-check-list").style.display = "none";
            }

        });







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



        // 품질불량 체크사항 추가사항 적용하기

        document.querySelector("#add-apply-button")
            .addEventListener("click", function () {

                const add_title = document.querySelector("#add-title");
                const add_detail = document.querySelector("#add-detail");
                const work_quality = document.querySelector("#work-quality");




                let detail = add_detail.value.split("\n");

                let detail_content = "";

                for (let i = 0; i < detail.length; i++) {

                    detail_content += `<div class="work-check-list-content">
                                        <span>
                                            -${detail[i]}
                                            <div class="error-checkbox-div">
                                                <input type="checkbox" class="error-checkbox">
                                            </div>
                                        </span>
                                    </div>`;

                }


                let html = "";
                html += `<div class="work-check-list">
                            <h3>
                                ${add_title.value}
                                <div class="delete-checkbox-div">
                                    <input type="checkbox" class="delete-checkbox">
                                </div>
                            </h3>
                                ${detail_content}
                        </div>`;

                console.log("클릭됨");
                let add_div = document.createElement("div");
                add_div.innerHTML = html;
                work_quality.append(add_div);

            });

});