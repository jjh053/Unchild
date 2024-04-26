// 공통 스크립트 파일
///////////////////////////////////////////////////////////////////////////////////////////////
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
////////////////////////////////////////////////////////////////////////////////////////////////////


// 모니터링 인터페이스 스크립트 페이지
document.addEventListener('DOMContentLoaded', function () {
    const cpuStatus = document.getElementById('cpu-status');
    const cpuOperations = document.getElementById('cpu-operations');
    const gpuStatus = document.getElementById('gpu-status');
    const gpuOperations = document.getElementById('gpu-operations');
    const caseStatus = document.getElementById('case-status');
    const caseOperations = document.getElementById('case-operations');
    const cpuDefectRateElement = document.getElementById('cpu-defect-rate');
    const gpuDefectRateElement = document.getElementById('gpu-defect-rate');
    const caseDefectRateElement = document.getElementById('case-defect-rate');
    const cpuDefectCountElement = document.getElementById('cpu-defect-count');
    const gpuDefectCountElement = document.getElementById('gpu-defect-count');
    const caseDefectCountElement = document.getElementById('case-defect-count');
    const cpuGoodCountElement = document.getElementById('cpu-good-count');
    const gpuGoodCountElement = document.getElementById('gpu-good-count');
    const caseGoodCountElement = document.getElementById('case-good-count');
    const totalDefectRateElement = document.getElementById('total-defect-rate');


    //////////////////////// DB 연결해서 결과값 보내기 ////////////////////////////
    let cpuOperationsCount = 0;
    let gpuOperationsCount = 0;
    let caseOperationsCount = 0;
    let cpuDefectCount = 0;
    let gpuDefectCount = 0;
    let caseDefectCount = 0;
    let iteration = 0;
    const maxIterations = 50;

    function simulateDefects(defectRate) {
        return Math.random() < defectRate ? 1 : 0;
    }

    function calculateDefectRate(operationsCount, defectCount) {
        if (operationsCount === 0) return "0.00";
        const rate = (defectCount / operationsCount) * 100;
        return rate.toFixed(2);
    }

    function calculateTotalDefectRate() {
        const totalOperations = cpuOperationsCount + gpuOperationsCount + caseOperationsCount;
        const totalDefects = cpuDefectCount + gpuDefectCount + caseDefectCount;
        if (totalOperations === 0) return "0.00";
        const rate = (totalDefects / totalOperations) * 100;
        return rate.toFixed(2);
    }

    function updateCountsAndRates() {
        // CPU
        cpuOperations.textContent = `사이클 횟수: ${cpuOperationsCount}`;
        cpuDefectCountElement.textContent = `불량: ${cpuDefectCount}`;
        cpuGoodCountElement.textContent = `통과: ${Math.max(0, cpuOperationsCount - cpuDefectCount)}`;
        cpuDefectRateElement.textContent = `불량률: ${calculateDefectRate(cpuOperationsCount, cpuDefectCount)}%`;

        // GPU
        gpuOperations.textContent = `사이클 횟수: ${gpuOperationsCount}`;
        gpuDefectCountElement.textContent = `불량: ${gpuDefectCount}`;
        gpuGoodCountElement.textContent = `통과: ${Math.max(0, gpuOperationsCount - gpuDefectCount)}`;
        gpuDefectRateElement.textContent = `불량률: ${calculateDefectRate(gpuOperationsCount, gpuDefectCount)}%`;

        // Case
        caseOperations.textContent = `사이클 횟수: ${caseOperationsCount}`;
        caseDefectCountElement.textContent = `불량: ${caseDefectCount}`;
        caseGoodCountElement.textContent = `통과: ${Math.max(0, caseOperationsCount - caseDefectCount)}`;
        caseDefectRateElement.textContent = `불량률: ${calculateDefectRate(caseOperationsCount, caseDefectCount)}%`;

        // total
        totalDefectRateElement.textContent = `총 불량률: ${calculateTotalDefectRate()}%`;

        const cpuDefectRate = calculateDefectRate(cpuOperationsCount, cpuDefectCount);
        const gpuDefectRate = calculateDefectRate(gpuOperationsCount, gpuDefectCount);
        const caseDefectRate = calculateDefectRate(caseOperationsCount, caseDefectCount);

        document.getElementById('cpu-bar').style.height = `${cpuDefectRate}%`;
        document.getElementById('gpu-bar').style.height = `${gpuDefectRate}%`;
        document.getElementById('case-bar').style.height = `${caseDefectRate}%`;

        document.getElementById('cpu-bar').textContent = `1번라인 : ${cpuDefectRate}%`;
        document.getElementById('gpu-bar').textContent = `2번라인 : ${gpuDefectRate}%`;
        document.getElementById('case-bar').textContent = `3번라인 : ${caseDefectRate}%`;

    }

    function runProcess() {
        if (iteration < maxIterations) {
            cpuStatus.textContent = 'Running';
            cpuStatus.style.color = 'red';
            gpuStatus.textContent = 'Running';
            gpuStatus.style.color = 'red';
            caseStatus.textContent = 'Running';
            caseStatus.style.color = 'red';

            setTimeout(() => {
                cpuStatus.textContent = 'Completed';
                cpuStatus.style.color = 'green';
                gpuStatus.textContent = 'Completed';
                gpuStatus.style.color = 'green';
                caseStatus.textContent = 'Completed';
                caseStatus.style.color = 'green';
                cpuOperationsCount++;
                cpuDefectCount += simulateDefects(0.01);  // 1번 라인 불량률 1%
                gpuOperationsCount++;
                gpuDefectCount += simulateDefects(0.03);  // 2번 라인 불량률 3%
                caseOperationsCount++;
                caseDefectCount += simulateDefects(0.05);  // 3번 라인 불량률 5%
                updateCountsAndRates();

                setTimeout(() => {
                    iteration++;
                    runProcess();
                }, 3000);
            }, 3000);
        }
    }
    runProcess();
});

// 마이페이지
document.querySelector("#workerName").addEventListener("click", () => {
    window.open("myPage.html", '_blank', 'width = 630, height = 470, top=100, left=100');
});

// 모바일 화면
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

            // 네비5
            for (let i = 0; i < ulLi.length; i++) {
                ulLi[i].style.padding = '7px';
            }
            menuBar.prepend(myPage);
        }
    });
});

// 로그인받은거에 따라서 화면에 출력내용을 다르게
document.querySelector("#mainTitle2").style.display = "block";
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
