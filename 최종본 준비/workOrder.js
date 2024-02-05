window.addEventListener("load", function() {

    let id = "admin";

        document.querySelector("#admin-change-button")
                .addEventListener("click", function() {
                    id = "admin";
                    userCheck(id);
                });
        document.querySelector("#user")
                .addEventListener("click", function() {
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

}

function userCheck(id) {

    const delete_checkbox = document.querySelectorAll(".delete-checkbox");

    if(id == "user") {
        document.querySelector("#mainTitle2").style.display = "none";
        document.querySelector("#mainTitle1").style.display = "block";
        document.querySelector(".button-div").style.display = "none";
        document.querySelector(".user-button-div").style.display = "block";

        for(let i = 0; i < delete_checkbox.length; i++) {
            delete_checkbox[i].style.display = "none";
        }
    } else if(id == "admin") {
        document.querySelector("#mainTitle2").style.display = "block";
        document.querySelector("#mainTitle1").style.display = "none";
        document.querySelector(".button-div").style.display = "block";
        document.querySelector(".user-button-div").style.display = "none";     

        for(let i = 0; i < delete_checkbox.length; i++) {
            delete_checkbox[i].style.display = "block";
        }
    }

}


function popup() {

    // 품질검사 지침서 팝업
    // 팝업 div 랑 버튼가져오기
    const order_add_popup = document.getElementById("order-add-popup");
    const list_add_button = document.getElementById("list-add-button");
    const cancel_apply_button = document.getElementById("cancel-apply-button");

    
    // 팝업 div 열기
    list_add_button.addEventListener("click", function () {

        document.querySelector("#add-title").value = "";
        document.querySelector("#add-detail").value = "";
        document.querySelector("#add-img").value = "";

        order_add_popup.style.display = "block";
        // 다른영역 클릭 비활성화
        order_add_popup.style.pointerEvents = "auto";
    });

    // 팝업 div 닫기 => 닫기버튼누를시
    cancel_apply_button.addEventListener("click", function () {
        order_add_popup.style.display = "none";
        // 다른영역 클릭 활성화
        order_add_popup.style.pointerEvents = "none";
    });

    // 팝업 div 닫기버튼 비활성화
    order_add_popup.addEventListener("click", function (event) {
        event.stopPropagation();
    });

    // 팝업 div 닫기버튼 활성화
    window.addEventListener("click", function (event) {
        if (event.target == modal) {
            order_add_popup.style.display = "none";
            // 다른영역 클릭 활성화
            order_add_popup.style.pointerEvents = "none";
        }
    });

}


function checkDelete() {
    
    document.querySelector("#list-delete")
    .addEventListener("click", function() {
    
        console.log("작동중"); 
        
        // 선택된 체크박스들을 선택
        let div_checked = document.querySelectorAll(".delete-check:checked");
    
        // for(let i = 0; i < div_checked.length; i++) {
        //     div_checked[i].parentNode.remove();
        // }
    
        // 선택된 리스트 지우기
        div_checked.forEach(function(checkbox) {
            checkbox.closest('.workList').remove();
        });
    
    });

};





function popupRun() {

    // 적용하기 버튼
    const add_button = document.querySelector("#add-apply-button");

    // 적용하기 버튼을 누르면 실행
    add_button.addEventListener("click", function() {


        const work_list_zip = document.querySelector(".work-list-zip");
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

        for(let i = 0; i < detail.length; i++) {
            
            detail_content += `<p>${detail[i]}</p>`;

        }
        
        
        let html = "";
        html += `<div class="workList">
                    <div class="delete-checkbox">
                        <input type="checkbox" class="delete-check">
                    </div>
                    <div class="workOrder">
                        <span>
                            ${add_title.value}
                        </span>
                        <p>
                            ${detail_content}
                        </p>
                    </div>
                    <div class="workImg">
                        ${input_img}
                    </div>
                </div>
                `;
                
        console.log("클릭됨");
        let add_div = document.createElement("div");
        add_div.innerHTML = html;
        work_list_zip.append(add_div);
        

        


    });

    
    
    
};



function imgAtt() {

    const img_select_button = document.querySelector("#img-select-button");
    
    img_select_button.addEventListener("click", function() {
        
        const add_img = document.querySelector("#add-img");
        const work_content = document.querySelector("#work-content");
        const img_preview = document.querySelector(".img-preview");
        let img_file = document.querySelector("#add-img-button").files[0];

        let input_img = "";

        
        
        
        if(add_img && add_img.value !== "") {
            input_img = `<img src="${add_img.value}">`;
            img_preview.innerHTML = input_img;
        } else if(img_file) {

            const read = new FileReader();

            // FileReader를 사용하여 Blob을 Data URL로 읽어옴
            read.readAsDataURL(img_file);
            
            read.onload = function (event) {
                // 미리보기 이미지를 생성
                const imgPreview = document.createElement('img');
                imgPreview.src = event.target.result;
                console.log(event.target.result);
                
                // 이미지를 표시할 div에 추가
                // const imgDiv = document.querySelector('.workImg');
                img_preview.innerHTML = ''; // 이미지가 이미 있다면 초기화
                img_preview.appendChild(imgPreview);
                

            };
        
        }
        
    
        
    
    
    });

};
