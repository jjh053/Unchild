window.addEventListener("load", function () {

    let id = "admin";

    document.querySelector("#admin-change-button")
        .addEventListener("click", function () {
            id = "admin";
            userCheck(id);
        });
    document.querySelector("#user")
        .addEventListener("click", function () {
            id = "user";
            userCheck(id);
        });

    menuHover();
    popup();
    popupRun();
    checkDelete();
    imgAtt();
    userCheck(id);

});

function menuHover() {

    const hover = document.querySelectorAll('a.hover');
    const menuBar = document.querySelector('.menu-bar');
    const nav = document.querySelector('nav');
    const wrap = document.querySelector('.wrap');

    // 모바일 스크립트 코드
    const hamburgerMenu = document.querySelector('.hamburger-menu');
    const myPage = document.querySelector('#myPage');
    const work_safety_list = document.querySelector(".work-safety-list");

    hamburgerMenu.addEventListener('click', function () {
        nav.classList.toggle('active');

        if (nav.classList.contains('active')) {
            nav.prepend(myPage);
            myPage.style.display = 'flex';
            myPage.style.padding = '5px 0';
            myPage.style.backgroundColor = '#dde';

            document.querySelector("#user")
                    .addEventListener("click", function() {
                        for(let i = 0; i < work_safety_list.length; i++) {

                            work_safety_list.style.marginLeft = "10%";
                        }
                    });


            let sectionHeight = section.offsetHeight;
            nav.style.height = `${sectionHeight}px`;
        } else {
            workerTitle.appendChild(myPage);
            myPage.style.display = '';
            nav.style.height = '';

            document.querySelector("#admin-change-button")
                    .addEventListener("click", function() {
                        
                        work_safety_list.style.marginLeft = "0";
                    });
        }
    });

    const section = document.querySelector('section');
    section.addEventListener("click", function () {
        hideMenuBar();
    })




    // if() {
    // document.querySelector("#mainTitle1").style.display = "block";
    // } else {
    document.querySelector("#mainTitle2").style.display = "block";
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



    // document.querySelector("#adminTitle").style.display = 'none';
    // document.querySelector("#adminNav").style.display = 'none';

}

function userCheck(id) {

    const delete_safety_checkbox = document.querySelectorAll(".delete-safety-checkbox");
    const menubarContent = document.querySelector(".menu-bar-content");

    if (id == "user") {
        document.querySelector("#mainTitle2").style.display = "none";
        document.querySelector("#mainTitle1").style.display = "block";
        document.querySelector(".safety-button-div").style.display = "none";
        document.querySelector(".safety-user-button-div").style.display = "block";
        document.querySelector(".work-safety-list-zip").style.width = "100%";
        document.querySelector(".work-safety-list-zip").style.marginLeft = "0%";
        document.querySelector("#adminTitle").style.display = 'none';
        document.querySelector("#adminNav").style.display = 'none';
        document.querySelector(".workerGrade").innerHTML = '작업자<br>';

        for (let i = 0; i < menubarContent.length; i++) {
            menubarContent.classList.add("menu-bar-margin");
        };

        for (let i = 0; i < delete_safety_checkbox.length; i++) {
            delete_safety_checkbox[i].style.display = "none";
        }
    } else if (id == "admin") {
        document.querySelector("#mainTitle2").style.display = "block";
        document.querySelector("#mainTitle1").style.display = "none";
        document.querySelector(".safety-button-div").style.display = "block";
        document.querySelector(".safety-user-button-div").style.display = "none";
        document.querySelector(".work-safety-list-zip").style.width = "80%";
        document.querySelector(".work-safety-list-zip").style.marginLeft = "10%";
        document.querySelector("#adminTitle").style.display = 'block';
        document.querySelector("#adminNav").style.display = 'block';
        document.querySelector(".workerGrade").innerHTML = '관리자<br>';

        for (let i = 0; i < menubarContent.length; i++) {
            menubarContent.classList.remove("menu-bar-margin");
        };

        for (let i = 0; i < delete_safety_checkbox.length; i++) {
            delete_safety_checkbox[i].style.display = "block";
        }
    }

}


function popup() {

    // 품질검사 지침서 팝업
    // 팝업 div 랑 버튼가져오기
    const safety_add_popup = document.getElementById("safety-add-popup");
    const list_add_button = document.getElementById("list-add-button");
    const cancel_apply_button = document.getElementById("cancel-apply-button");


    // 팝업 div 열기
    list_add_button.addEventListener("click", function () {

        document.querySelector("#add-title").value = "";
        document.querySelector("#add-detail").value = "";
        document.querySelector("#add-img").value = "";

        safety_add_popup.style.display = "block";
        // 다른영역 클릭 비활성화
        safety_add_popup.style.pointerEvents = "auto";
    });

    // 팝업 div 닫기 => 닫기버튼누를시
    cancel_apply_button.addEventListener("click", function () {
        safety_add_popup.style.display = "none";
        // 다른영역 클릭 활성화
        safety_add_popup.style.pointerEvents = "none";
    });

    // 팝업 div 닫기버튼 비활성화
    safety_add_popup.addEventListener("click", function (event) {
        event.stopPropagation();
    });

    // 팝업 div 닫기버튼 활성화
    window.addEventListener("click", function (event) {
        if (event.target == safety_add_popup) {
            safety_add_popup.style.display = "none";
            // 다른영역 클릭 활성화
            safety_add_popup.style.pointerEvents = "none";
        }
    });

}


function checkDelete() {

    document.querySelector("#list-delete")
        .addEventListener("click", function () {

            console.log("작동중");

            // 선택된 체크박스들을 선택
            let delete_safety_check = document.querySelectorAll(".delete-safety-check:checked");

            // for(let i = 0; i < div_checked.length; i++) {
            //     div_checked[i].parentNode.remove();
            // }

            // 선택된 리스트 지우기
            delete_safety_check.forEach(function (checkbox) {
                checkbox.closest('.work-safety-list').remove();
            });

        });

};





function popupRun() {

    // 적용하기 버튼
    const add_button = document.querySelector("#add-apply-button");

    // 적용하기 버튼을 누르면 실행
    add_button.addEventListener("click", function () {


        const work_safety_list_zip = document.querySelector(".work-safety-list-zip");
        const add_title = document.querySelector("#add-title");
        const add_detail = document.querySelector("#add-detail");
        const add_img = document.querySelector("#add-img");

        let input_img = "";

        const img_preview = document.querySelector(".img-preview");
        let img_preview_url = "";

        // .img-preview 안에 이미지 요소가 있으면 해당 이미지의 URL을 가져옵니다.
        if (img_preview && img_preview.querySelector('img')) {
            img_preview_url = img_preview.querySelector('img').src;
        }

        // 가져온 URL을 기반으로 input_img를 생성합니다.
        if (img_preview_url) {
            input_img = `<img src="${img_preview_url}">`;
        } else {
            input_img = `<img src="https://cdn.discordapp.com/attachments/1185161279804026893/1202813706736766996/fox.jpg?ex=65ced28e&is=65bc5d8e&hm=7af0e56f9236cf70765bfa1e2f9ad9d2549215854fa0b854c4d4d00ad7af7967&">`;
        }


        let detail = add_detail.value.split("\n");

        let detail_content = "";

        for (let i = 0; i < detail.length; i++) {

            detail_content += `<p>-${detail[i]}</p>`;

        }

        let html = "";
        html += `<div class="work-safety-list">
                    <div class="delete-safety-checkbox">
                        <input type="checkbox" class="delete-safety-check">
                    </div>
                    <div class="work-safety-order">
                        <span>
                            *${add_title.value}
                        </span>
                        ${detail_content}
                    </div>
                    <div class="work-safety-img">
                        ${input_img}
                    </div>
                </div>
                `;

        console.log("클릭됨");
        let add_div = document.createElement("div");
        add_div.innerHTML = html;
        work_safety_list_zip.append(add_div);





    });




};



function imgAtt() {
    let chooseFile = document.getElementById('add-img-button');
    let fileButton = document.getElementById('file-button');
    let imgSelectButton = document.getElementById('img-select-button');
    let fileNameDisplay = document.getElementById('fileName');
    let imgURLInput = document.getElementById('add-img');
    let img_preview = document.querySelector(".img-preview");
    let selectedFile;

    console.log("imgAtt function called");

    chooseFile.addEventListener('change', function (event) {
        event.stopPropagation();
        event.preventDefault();

        console.log("File chosen");

        selectedFile = chooseFile.files && chooseFile.files.length > 0 ? chooseFile.files[0] : null;

        if (selectedFile) {
            fileNameDisplay.textContent = selectedFile.name;
        } else {
            fileNameDisplay.textContent = '선택된 파일 없음';
        }
    });

    fileButton.addEventListener('click', function (event) {
        event.stopPropagation();
        event.preventDefault();

        console.log("File button clicked");
        chooseFile.click();
    });

    imgSelectButton.addEventListener('click', function (event) {
        event.stopPropagation();
        event.preventDefault();

        console.log("Image select button clicked");
        if (selectedFile) {
            displayImagePreview(selectedFile);
        } else if (imgURLInput.value.trim() !== '') {
            displayImagePreview(imgURLInput.value.trim());
        } else {
            alert("파일을 먼저 선택하거나 이미지 URL을 입력해주세요.");
        }
    });

    function displayImagePreview(fileOrUrl) {
        if (typeof fileOrUrl === 'string' || fileOrUrl instanceof String) {
            // It's a URL, display image directly
            img_preview.innerHTML = '';
            const imgPreview = document.createElement('img');
            imgPreview.src = fileOrUrl;
            img_preview.appendChild(imgPreview);
        } else {
            // It's a File object, read and display
            const reader = new FileReader();
            reader.readAsDataURL(fileOrUrl);
            reader.onload = function (event) {
                img_preview.innerHTML = '';
                const imgPreview = document.createElement('img');
                imgPreview.src = event.target.result;
                img_preview.appendChild(imgPreview);
            };
        }
    }
}
