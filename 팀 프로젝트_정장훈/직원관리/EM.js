// 직원관리 js


// 팝업 3에 대한 클릭이벤트


let lastbtn = 0;

document.querySelector(".cancel3").addEventListener("click", function () {
    let EAI3 = document.querySelector(".popup3");
    EAI3.style.display = "none";
    let modal_overlay = document.querySelector(".modal-overlay");
    modal_overlay.style.display = "none";
});


document.querySelector(".add_eaib3").addEventListener("click", function () {
    let EAI3 = document.querySelector(".popup3");
    EAI3.style.display = "none";
    let modal_overlay = document.querySelector(".modal-overlay");
    modal_overlay.style.display = "none";
});

document.querySelector(".record").addEventListener("click", function () {
    let EAI = document.querySelector(".popup");
    EAI.style.display = "none";
    let EAI3 = document.querySelector(".popup3");
    EAI3.style.display = "block";
    let modal_overlay = document.querySelector(".modal-overlay");
    modal_overlay.style.display = "flex";

    // 수정 전에 직원 목록에 바뀐 정보가 잘 뜨도록

    // document.querySelector(".eai_img").src = imageLink;
    // document.querySelector(".eais_select").innerHTML = lastbtn.parentNode.parentNode.getAttribute("data-sel");
    // document.querySelector(".eais_name").innerHTML = lastbtn.parentNode.parentNode.getAttribute("data-name");
    // // console.log(e.target.parentNode.parentNode.getAttribute("data-sel"));
    // document.querySelector(".eais_rank").innerHTML = lastbtn.parentNode.parentNode.getAttribute("data-rank");
    // // console.log(eais_name2.value);
    // document.querySelector(".eais_number").innerHTML = lastbtn.parentNode.parentNode.getAttribute("data-number");
    // document.querySelector(".eais_ay").innerHTML = lastbtn.parentNode.parentNode.getAttribute("data-day");
    // document.querySelector(".eais_id").innerHTML = lastbtn.parentNode.parentNode.getAttribute("data-id");
    // document.querySelector(".eais_mail").innerHTML = lastbtn.parentNode.parentNode.getAttribute("data-mail") + e.target.parentNode.parentNode.getAttribute("data-mail-select");
    // document.querySelector(".e_area").innerHTML = lastbtn.parentNode.parentNode.getAttribute("data-area");


    // 버튼 클릭 후에 적었던 기록들 삭제
    let imageLink = "";
    document.querySelector(".eai_img").src = imageLink;
    let eais_sel3 = document.querySelector(".eais_sel3").value = "";
    let eais_name3 = document.querySelector(".name_text3").value = "";
    let eais_rank3 = document.querySelector(".rank_text3").value = "";
    let eais_number3 = document.querySelector(".number_text3").value = "";
    let eais_ay3 = document.querySelector(".day_text3").value = "";
    let eais_id3 = document.querySelector(".id_text3").value = "";
    let eais_mail3 = document.querySelector(".mail_text3").value = "";
    let mail_select3 = document.querySelector(".mail_select3").value = "";
    let e_area3 = document.querySelector(".e_area3").value = "";
    // lastbtn.parentNode.parentNode.parentNode.querySelector(".eais_name").value = "";
    // let name = lastbtn.parentNode.parentNode.parentNode.parentNode.document.querySelector(".name_text3");
    // console.log(name);
});



document.querySelector(".add_eaib3").addEventListener("click", function (e) {
    let EAI = document.querySelector(".popup");
    EAI.style.display = "none";
    let EAI3 = document.querySelector(".popup3");
    EAI3.style.display = "none";
    let modal_overlay = document.querySelector(".modal-overlay");
    modal_overlay.style.display = "none";

    let eais_sel3 = document.querySelector(".eais_sel3").value;
    let eais_name3 = document.querySelector(".name_text3").value;
    let eais_rank3 = document.querySelector(".rank_text3").value;
    let eais_number3 = document.querySelector(".number_text3").value;
    let eais_ay3 = document.querySelector(".day_text3").value;
    let eais_id3 = document.querySelector(".id_text3").value;
    let eais_mail3 = document.querySelector(".mail_text3").value;
    let mail_select3 = document.querySelector(".mail_select3").value;
    let e_area3 = document.querySelector(".e_area3").value;

    // console.log(eais_sel3);
    // console.log(eais_name3);
    // console.log(eais_rank3);
    // console.log(eais_number3);
    // console.log(eais_ay3);
    // console.log(eais_id3);
    // console.log(eais_mail3);
    // console.log(mail_select3);
    // console.log(e_area3);
    // 상세정보 버튼이 클릭되면
    // 어떤 상세정보 버튼인지 저장해놓고
    // 추가하기 버튼을 누르면
    // date-id 등으로 만든 곳에 모든 내용을 덮어쓰기 (콘솔에 나온거 덮어쓰기)
    lastbtn.parentNode.parentNode.setAttribute("data-sel", eais_sel3);
    lastbtn.parentNode.parentNode.setAttribute("data-name", eais_name3);
    lastbtn.parentNode.parentNode.setAttribute("data-rank", eais_rank3);
    lastbtn.parentNode.parentNode.setAttribute("data-number", eais_number3);
    lastbtn.parentNode.parentNode.setAttribute("data-day", eais_ay3);
    lastbtn.parentNode.parentNode.setAttribute("data-id", eais_id3);
    lastbtn.parentNode.parentNode.setAttribute("data-mail", eais_mail3);
    lastbtn.parentNode.parentNode.setAttribute("data-mail-select", mail_select3);
    lastbtn.parentNode.parentNode.setAttribute("data-area", e_area3);

    // 라스트
    // data-sel="${eais_sel}" data-name="${eais_name2}" data-rank="${eais_rank}" data-number="${eais_number2}" 
    //                         data-day="${eais_ay2}" data-id = "${eais_id2}" data-mail = "${eais_mail2}" data-mail-select = "${mail_select}"
    //                         data-area="${e_area2}">
    // setAttribute("date-sel", 읽어온 값)로 첫번째 전달인자
    // Employee_name : 팀장, 이름
    // Employee_ad_bum : 이메일 br 연락처
    lastbtn.parentNode.parentNode.parentNode.querySelector(".Employee_name").innerText = eais_rank3 + " " + eais_name3;
    // lastbtn.parentNode.parentNode.parentNode.querySelector(".Employee_ad_bum").innerText = eais_mail3 + mail_select3 + `<br>` + eais_number3;
    lastbtn.parentNode.parentNode.parentNode.querySelector(".Employee_ad_bum").innerHTML = `${eais_mail3} ${mail_select3} <br> ${eais_number3}`;
    // lastbtn.parentNode.parentNode.parentNode.querySelector(".Employee_name").innerText = eais_rank3 + " " + eais_name3;
    // 수정 전에 직원 목록에 바뀐 정보가 잘 뜨도록
});


// 팝업 2에 대한 클릭이벤트
document.querySelector(".add_button").addEventListener("click", function () {
    let EAI2 = document.querySelector(".popup2");
    let modal_overlay = document.querySelector(".modal-overlay");
    modal_overlay.style.display = "flex";
    EAI2.style.display = "inline-block";
})

// 팝업 2에 대한 취소하기
document.querySelector(".cancel2").addEventListener("click", function () {
    let EAI2 = document.querySelector(".popup2");
    EAI2.style.display = "none";
    let modal_overlay = document.querySelector(".modal-overlay");
    modal_overlay.style.display = "none";
    let imageLink = "";
    document.querySelector(".eai_img2").src = imageLink;
    // document.querySelector(".eais_sel").value.innerHTML = "";
    document.querySelector(".name_text").value.innerHTML = "";
    document.querySelector(".number_text").value.innerHTML = "";
    document.querySelector(".day_text").value.innerHTML = "";
    document.querySelector(".id_text").value.innerHTML = "";
    document.querySelector(".mail_text").value.innerHTML = "";
    // document.querySelector(".mail_select").innerHTML = "";
    document.querySelector(".e_area2").innerHTML = "";
});

// 팝업 2에 대한 수정하기
document.querySelector(".add_eaib").addEventListener("click", function () {
    let EAI2 = document.querySelector(".popup2");
    EAI2.style.display = "none";
    let modal_overlay = document.querySelector(".modal-overlay");
    modal_overlay.style.display = "none";
    let imageLink = "";
});

// 직원 추가
document.querySelector(".add_eaib").addEventListener("click", function () {
    let eais_sel = document.querySelector(".eais_sel").value;
    let eais_name2 = document.querySelector(".name_text").value;
    let eais_rank = document.querySelector(".rank_text").value;
    let eais_number2 = document.querySelector(".number_text").value;
    let eais_ay2 = document.querySelector(".day_text").value;
    let eais_id2 = document.querySelector(".id_text").value;
    let eais_mail2 = document.querySelector(".mail_text").value;
    let mail_select = document.querySelector(".mail_select").value;
    let e_area2 = document.querySelector(".e_area2").value;
    let newRow = document.createElement('div');
    newRow.className = 'Employee';
    newRow.innerHTML = `
                        <div class="Employee_img"><img
                                src="#">
                        </div>
                        <div class="Employee_infor" data-sel="${eais_sel}" data-name="${eais_name2}" data-rank="${eais_rank}" data-number="${eais_number2}" 
                        data-day="${eais_ay2}" data-id = "${eais_id2}" data-mail = "${eais_mail2}" data-mail-select = "${mail_select}"
                        data-area="${e_area2}">
                            <div class="Employee_name"> ${eais_rank} ${eais_name2}</div>
                            <div class="Employee_ad_bum">
                                이메일 : ${eais_mail2} ${mail_select} <br> 연락처 : ${eais_number2}
                            </div>
                            <div class="Employee_atomic">
                                <div class="atomic_button">상세정보</div>
                            </div>
                    </div>
`;
    document.querySelector('.Staff_list_box').appendChild(newRow);
    // 추가된 직원의 atomic_button에 대한 이벤트 처리
    newRow.querySelector(".atomic_button").addEventListener("click", function (e) {
        let EAI = document.querySelector(".popup");
        let modal_overlay = document.querySelector(".modal-overlay");
        modal_overlay.style.display = "flex";
        EAI.style.display = "inline-block";
        // 라스트비티엔 디스
        lastbtn = this;
        // let eais_select = document.querySelector(".eais_select").value;
        let eais_sel = document.querySelector(".eais_sel");
        let eais_name2 = document.querySelector(".name_text");
        let eais_rank2 = document.querySelector(".rank_text");
        let eais_number2 = document.querySelector(".number_text");
        let eais_ay2 = document.querySelector(".day_text");
        let eais_id2 = document.querySelector(".id_text");
        let eais_mail2 = document.querySelector(".mail_text");
        let mail_select = document.querySelector(".mail_select");
        let e_area2 = document.querySelector(".e_area2");
        let imageLink = "#";

        document.querySelector(".eai_img").src = imageLink;
        document.querySelector(".eais_select").innerHTML = e.target.parentNode.parentNode.getAttribute("data-sel");
        document.querySelector(".eais_name").innerHTML = e.target.parentNode.parentNode.getAttribute("data-name");
        // console.log(e.target.parentNode.parentNode.getAttribute("data-sel"));
        document.querySelector(".eais_rank").innerHTML = e.target.parentNode.parentNode.getAttribute("data-rank");
        // console.log(eais_name2.value);
        document.querySelector(".eais_number").innerHTML = e.target.parentNode.parentNode.getAttribute("data-number");
        document.querySelector(".eais_ay").innerHTML = e.target.parentNode.parentNode.getAttribute("data-day");
        document.querySelector(".eais_id").innerHTML = e.target.parentNode.parentNode.getAttribute("data-id");
        document.querySelector(".eais_mail").innerHTML = e.target.parentNode.parentNode.getAttribute("data-mail") + e.target.parentNode.parentNode.getAttribute("data-mail-select");
        document.querySelector(".e_area").innerHTML = e.target.parentNode.parentNode.getAttribute("data-area");
        // document.querySelector('.eais_select').innerHTML = "정규직";
        // 삭제 버튼 이벤트 처리
        document.querySelector(".delete_button").addEventListener("click", function () {
            modal_overlay.style.display = "none";
            EAI.style.display = "none";
            newRow.remove();
        });
    });
});


// 위까지 직원추가에 쓰일 폼

// 삭제

document.querySelectorAll(".atomic_button").forEach(function (event) {
    event.addEventListener("click", function (e) {
        let EAI = document.querySelector(".popup");
        let modal_overlay = document.querySelector(".modal-overlay");
        modal_overlay.style.display = "flex";
        EAI.style.display = "inline-block";
        let Employee = e.target.closest('.Employee');
        // console.log(e.target.parentNode.parentNode.getAttribute("data-sel"));
        document.querySelector(".delete_button").addEventListener("click", function () {
            let EAI = document.querySelector(".popup");
            let modal_overlay = document.querySelector(".modal-overlay");
            modal_overlay.style.display = "none";
            EAI.style.display = "none";
            Employee.remove();
        })
    })
})

for (let i = 0; i < document.querySelectorAll(".atomic_button").length; i++) {
    document.querySelectorAll(".atomic_button")[i].addEventListener("click", function (event) {
        let EAI = document.querySelector(".popup");
        if (i == 0) {
            let modal_overlay = document.querySelector(".modal-overlay");
            modal_overlay.style.display = "flex";
            EAI.style.display = "inline-block";
            let imageLink = "https://cdn.discordapp.com/attachments/1186454147558551552/1203899552482988072/KakaoTalk_20240129_145354467.jpg?ex=65d2c5d4&is=65c050d4&hm=e9efcec30a9c74591f72b14de6d988ce7bb130295847bcc1d11d2e0f9bb26629&";
            document.querySelector(".eai_img").src = imageLink;
            document.querySelector(".eais_select").innerHTML = "정규직";
            document.querySelector(".eais_name").innerHTML = "팀장";
            document.querySelector(".eais_rank").innerHTML = "정장훈";
            document.querySelector(".eais_number").innerHTML = "010-2933-8001";
            document.querySelector(".eais_ay").innerHTML = "2014-09-15";
            document.querySelector(".eais_id").innerHTML = "wkdgns14";
            document.querySelector(".eais_mail").innerHTML = "wkdgns14@naver.com";
            document.querySelector(".e_area").innerHTML =
                document.querySelector(".e_area").innerHTML =
                "경력사항 : 10년\n" +
                "부서 : 품질관리팀\n" +
                "직위 : 팀장\n" +
                "기타 : 딴데서 일하다가 온 늙은이\n";
        } else if (i == 1) {
            let modal_overlay = document.querySelector(".modal-overlay");
            modal_overlay.style.display = "flex";
            EAI.style.display = "inline-block";
            let imageLink = "https://cdn.discordapp.com/attachments/1186454147558551552/1203955694747918366/image.png?ex=65d2fa1e&is=65c0851e&hm=a2244822ee56e5b93b762d27fe9dc7c1c9345811664e59b8634d5e59d6802081&";
            document.querySelector(".eai_img").src = imageLink;
            document.querySelector(".eais_select").innerHTML = "정규직";
            document.querySelector(".eais_name").innerHTML = "김태원";
            document.querySelector(".eais_rank").innerHTML = "차장";
            document.querySelector(".eais_number").innerHTML = "010-2654-6541";
            document.querySelector(".eais_ay").innerHTML = "2020-01-09";
            document.querySelector(".eais_id").innerHTML = "taewean";
            document.querySelector(".eais_mail").innerHTML = "taewean@naver.com";
            document.querySelector(".e_area").innerHTML =
                "경력사항 : 4년\n" +
                "부서 : 품질관리팀\n" +
                "직위 : 차장\n" +
                "기타 : 비선실세\n";
        } else if (i == 2) {
            let modal_overlay = document.querySelector(".modal-overlay");
            modal_overlay.style.display = "flex";
            EAI.style.display = "inline-block";
            let imageLink = "https://media.discordapp.net/attachments/1186454147558551552/1204215611329089567/image.png?ex=65d3ec2e&is=65c1772e&hm=78b0f94ea376abd4607ea1bd638ab205e80cf2fbf734f22a67c0dce3722013f1&=&format=webp&quality=lossless";
            document.querySelector(".eai_img").src = imageLink;
            document.querySelector(".eais_select").innerHTML = "정규직";
            document.querySelector(".eais_name").innerHTML = "서효림";
            document.querySelector(".eais_rank").innerHTML = "부장";

            document.querySelector(".eais_number").innerHTML = "010-2987-7895";
            document.querySelector(".eais_ay").innerHTML = "2021-03-19";
            document.querySelector(".eais_id").innerHTML = "hyolim";
            document.querySelector(".eais_mail").innerHTML = "hyolim@naver.com";
            document.querySelector(".e_area").innerHTML =
                "경력사항 : 3년\n" +
                "부서 : 품질관리팀\n" +
                "직위 : 부장\n" +
                "기타 : 부상투혼 오짐 \n";
        } else if (i == 3) {
            let modal_overlay = document.querySelector(".modal-overlay");
            modal_overlay.style.display = "flex";
            EAI.style.display = "inline-block";
            let imageLink = "https://cdn.discordapp.com/attachments/1186454147558551552/1203947754850885724/image.png?ex=65d2f2b9&is=65c07db9&hm=0e904a6c94e2546c974233c6d1289c7bf138e3ec1787a0534435d1c32e0d1663&";
            document.querySelector(".eai_img").src = imageLink;
            document.querySelector(".eais_select").innerHTML = "정규직";
            document.querySelector(".eais_name").innerHTML = "이도연";
            document.querySelector(".eais_rank").innerHTML = "대리";
            document.querySelector(".eais_number").innerHTML = "010-7324-1894";
            document.querySelector(".eais_ay").innerHTML = "2022-07-21";
            document.querySelector(".eais_id").innerHTML = "doyean";
            document.querySelector(".eais_mail").innerHTML = "doyean@naver.com";
            document.querySelector(".e_area").innerHTML =
                "경력사항 : 2년\n" +
                "부서 : 품질관리팀\n" +
                "직위 : 대리\n" +
                "기타 : 장유유서없음 \n";
        } else if (i == 4) {
            let modal_overlay = document.querySelector(".modal-overlay");
            modal_overlay.style.display = "flex";
            EAI.style.display = "inline-block";
            let imageLink = "https://media.discordapp.net/attachments/1186454147558551552/1203947811654074430/b525b7fb529992f7.jpg?ex=65d2f2c6&is=65c07dc6&hm=594005fd10466b45392d6cf947c27056299b71a36d50920d9283fb6d24ec207d&=&format=webp&width=468&height=468";
            document.querySelector(".eai_img").src = imageLink;
            document.querySelector(".eais_select").innerHTML = "정규직";
            document.querySelector(".eais_name").innerHTML = "이성현";
            document.querySelector(".eais_rank").innerHTML = "대리";

            document.querySelector(".eais_number").innerHTML = "010-3456-3456";
            document.querySelector(".eais_ay").innerHTML = "2021-03-19";
            document.querySelector(".eais_id").innerHTML = "sunghyan";
            document.querySelector(".eais_mail").innerHTML = "sunghyan@naver.com";
            document.querySelector(".e_area").innerHTML =
                "경력사항 : 3년\n" +
                "부서 : 품질관리팀\n" +
                "직위 : 대리\n" +
                "기타 : 술은 나쁘니깐 먹어서 없애야함 \n";
        } else if (i == 5) {
            let modal_overlay = document.querySelector(".modal-overlay");
            modal_overlay.style.display = "flex";
            EAI.style.display = "inline-block";
            let imageLink = "https://cdn.discordapp.com/attachments/1186454147558551552/1203947754850885724/image.png?ex=65d2f2b9&is=65c07db9&hm=0e904a6c94e2546c974233c6d1289c7bf138e3ec1787a0534435d1c32e0d1663&";
            document.querySelector(".eai_img").src = imageLink;
            document.querySelector(".eais_select").innerHTML = "정규직";
            document.querySelector(".eais_name").innerHTML = "이도연";
            document.querySelector(".eais_number").innerHTML = "010-7324-1894";
            document.querySelector(".eais_ay").innerHTML = "2022-07-21";
            document.querySelector(".eais_id").innerHTML = "doyean";
            document.querySelector(".eais_mail").innerHTML = "doyean@naver.com";
            document.querySelector(".e_area").innerHTML =
                "경력사항 : 2년\n" +
                "부서 : 품질관리팀\n" +
                "직위 : 대리\n" +
                "기타 : 장유유서없음 \n";
        }
    });
}

document.querySelector(".cancel").addEventListener("click", function () {
    let EAI = document.querySelector(".popup");
    EAI.style.display = "none";
    let modal_overlay = document.querySelector(".modal-overlay");
    modal_overlay.style.display = "none";
    let imageLink = "";
    document.querySelector(".eai_img").src = imageLink;
    document.querySelector(".eais_select").innerHTML = "";
    document.querySelector(".eais_name").innerHTML = "";
    document.querySelector(".eais_number").innerHTML = "";
    document.querySelector(".eais_ay").innerHTML = "";
    document.querySelector(".eais_id").innerHTML = "";
    document.querySelector(".eais_mail").innerHTML = "";
    document.querySelector(".e_area").innerHTML =
        ""
});


// document.querySelector(".record").addEventListener("click", function () {
//     let EAI = document.querySelector(".popup");
//     EAI.style.display = "none";
//     // let modal_overlay = document.querySelector(".modal-overlay");
//     // modal_overlay.style.display = "none";
//     let imageLink = "";
//     document.querySelector(".eai_img").src = imageLink;
//     document.querySelector(".eais_select").innerHTML = "";
//     document.querySelector(".eais_name").innerHTML = "";
//     document.querySelector(".eais_number").innerHTML = "";
//     document.querySelector(".eais_ay").innerHTML = "";
//     document.querySelector(".eais_id").innerHTML = "";
//     document.querySelector(".eais_mail").innerHTML = "";
//     document.querySelector(".e_area").innerHTML =
//         ""
// });








// 달력


// 달력



// 직원관리 여기까지




const hover = document.querySelectorAll('a.hover');
const menuBar = document.querySelector('.menu-bar');
const nav = document.querySelector('nav');
const wrap = document.querySelector('.wrap');
// 미디어테그, 네비게이션바 조작
const section = document.querySelector('section');

hover.forEach(link => {
    link.addEventListener("click", function (event) {
        event.preventDefault();
        if (nav.classList.contains('active') && window.matchMedia("(max-width: 430px)").matches) {
            nav.style.height = `${section.offsetHeight}px`
        }
    });
});

// 미디어테그 끝




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

section.addEventListener('click', function () {
    hideMenuBar();
})

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

        // 네비4
        for (let i = 0; i < ulLi.length; i++) {
            ulLi[i].style.padding = '10px';
            ulLi[i].style.margin = '0px';
        }

        // 네비5
        for (let i = 0; i < ulLi.length; i++) {
            ulLi[i].style.padding = '0px';
            ulLi[i].style.margin = '10px';
        }

        event.preventDefault();
        if (nav.classList.contains('active') && window.matchMedia("(max-width: 430px)").matches) {
            nav.style.height = `${section.offsetHeight}px`

            menuBar.prepend(myPage);
        }
    });
});
