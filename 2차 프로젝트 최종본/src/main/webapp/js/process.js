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

    document.querySelector("#mainTitle2").style.display = "block";

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

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////


    // 그림 파트
    // 
    let currentCircle = 1;
    let ExistingCircle;

    // 시간에 따라 공정도 포도알 색깔 바뀌는거 ( DB에 연결해서 currentComputer++ 될때 DB의 개수도++; )
    let currentComputer = 0;
    let wordArray = ["설계 확인", "자재 확인", "그래픽카드 조립", "저장장치 조립", "메모리 조립", "조립 검사", "품질 검사", "포장", "출하"];
    setInterval(() => {
        if (ExistingCircle) {
            const previous = document.querySelector(`.tree-graph-circle${ExistingCircle}`);
            previous.style.backgroundColor = 'rgb(86, 86, 202)';
        }

        const current = document.querySelector(`.tree-graph-circle${currentCircle}`);

        let currentBackgroundColor = current.style.backgroundColor;

        if (currentBackgroundColor === 'skyblue') {
            current.style.backgroundColor = 'rgb(86, 86, 202)';
        } else {
            current.style.backgroundColor = 'skyblue';
        }

        ExistingCircle = currentCircle;
        currentCircle = (currentCircle % 9) + 1;

        let completeComputerProgress = document.querySelector(".completeComputer-progress");
        completeComputerProgress.innerHTML = `${wordArray[currentComputer]}중`;
        currentComputer++;
        if (currentComputer == 9) {
            currentComputer = 0;
        }
    }, 5000);

    // DB에 연결해서 재고는 마이너스처리; 완품은 플러스처리
    // 불량품도 부품과 완품으로 나눠서 DB 연결
    let completComNum = 0;
    let completeComputer = document.querySelector(".completeComputer");
    setInterval(() => {
        completComNum++;
        console.log("completComNum : " + completComNum);
        completeComputer.innerHTML = completComNum;
    }, 45000);


    // 공정 라인 버튼 색깔만 바뀌게 - DB 에는 실제로 라인 4개 형성해서 보여지는 스크립트 추가하기
    document.querySelector('.tree-graph-line-title1').addEventListener("click", () => {
        document.querySelector('.tree-graph-line-title1').style.backgroundColor = "#aaa";
        document.querySelector('.tree-graph-line-title2').style.backgroundColor = "#eee";
        document.querySelector('.tree-graph-line-title3').style.backgroundColor = "#eee";
        document.querySelector('.tree-graph-line-title4').style.backgroundColor = "#eee";
    });
    document.querySelector('.tree-graph-line-title2').addEventListener("click", () => {
        document.querySelector('.tree-graph-line-title1').style.backgroundColor = "#eee";
        document.querySelector('.tree-graph-line-title2').style.backgroundColor = "#aaa";
        document.querySelector('.tree-graph-line-title3').style.backgroundColor = "#eee";
        document.querySelector('.tree-graph-line-title4').style.backgroundColor = "#eee";
    });
    document.querySelector('.tree-graph-line-title3').addEventListener("click", () => {
        document.querySelector('.tree-graph-line-title1').style.backgroundColor = "#eee";
        document.querySelector('.tree-graph-line-title2').style.backgroundColor = "#eee";
        document.querySelector('.tree-graph-line-title3').style.backgroundColor = "#aaa";
        document.querySelector('.tree-graph-line-title4').style.backgroundColor = "#eee";
    });
    document.querySelector('.tree-graph-line-title4').addEventListener("click", () => {
        document.querySelector('.tree-graph-line-title1').style.backgroundColor = "#eee";
        document.querySelector('.tree-graph-line-title2').style.backgroundColor = "#eee";
        document.querySelector('.tree-graph-line-title3').style.backgroundColor = "#eee";
        document.querySelector('.tree-graph-line-title4').style.backgroundColor = "#aaa";
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
                    // ulLi[i].style.margin = '0px';

                }
                menuBar.prepend(myPage);
            }
        });
    });
    document.querySelector("#mainTitle2").style.display = "block";


    // 로그인 따라 표시하는 목록 바뀌게 -> 로그인 완성 후 수정
    function toggle() {
        if (document.querySelector("#adminTitle").style.display != 'block') {
            document.querySelector("#adminTitle").style.display = 'block';
            document.querySelector("#adminNav").style.display = 'block';
            // document.querySelector("#noticeWriteBtn").style.display = 'inline';
            document.querySelector(".workerGrade").innerHTML = '관리자<br>';
            document.querySelector("#mainTitle1").style.display = "none";
            document.querySelector("#mainTitle2").style.display = "block";
        } else {
            // document.querySelector("#noticeWriteBtn").style.display = 'none';
            document.querySelector("#adminTitle").style.display = 'none';
            document.querySelector("#adminNav").style.display = 'none';
            document.querySelector(".workerGrade").innerHTML = '작업자<br>';
            document.querySelector("#mainTitle1").style.display = "block";
            document.querySelector("#mainTitle2").style.display = "none";
        }
    }

    document.querySelector("#toggle").addEventListener('click', toggle);


    // 마이페이지
    document.querySelector("#workerName").addEventListener("click", () => {
        window.open("myPage.html", '_blank', 'width = 630, height = 470, top=100, left=100');
    });
})
