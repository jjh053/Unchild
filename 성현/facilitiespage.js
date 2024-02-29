
// 공통 스크립트
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
////////////////////////////////////////////////////////////////////////////////////////////////////

updateAllOptions();

document.querySelector('.options-container').addEventListener('change', function (event) {
    if (event.target.classList.contains('cpu-option')) {
        updateOption(event.target);
    }
});

document.querySelector('.options-container').addEventListener('click', function (event) {
    if (event.target.classList.contains('delete-option-btn')) {
        event.target.closest('.lego-option').remove();
    } else if (event.target.classList.contains('change-option')) {
        currentOptionBeingEdited = event.target.closest('.lego-option');
        showOptionPopup(currentOptionBeingEdited);
    }
});


document.getElementById('add-option-btn').addEventListener('click', function () {
    let originalOption = document.querySelector('.lego-option');
    let lineNumber = document.querySelectorAll('.lego-option').length;

    if (lineNumber < 4) {
        let newOption = originalOption.cloneNode(true); // 깊은복사
        document.querySelector('.options-container').appendChild(newOption);

        let productionLine = newOption.querySelector('div:first-child');
        productionLine.textContent = (lineNumber + 1) + '번 생산라인';

        let deleteButton = document.createElement('button');
        deleteButton.type = 'button';
        deleteButton.className = 'delete-option-btn';
        deleteButton.textContent = '삭제';
        newOption.querySelector('div:last-child').appendChild(deleteButton);

        newOption.querySelector('.cpu-option').addEventListener('change', function () {
            updateOption(this);
        });

        deleteButton.addEventListener('click', function () {
            newOption.remove();
        });
    } else {
        alert("4번 생산라인까지만 추가가 가능합니다!");
    }

});

function updateAllOptions() {
    document.querySelectorAll(".cpu-option").forEach(function (select) {
        updateOption(select);
    });
}

function updateOption(selectedOption) {
    let optionContainer = selectedOption.closest('.lego-option');
    let optionValue1 = optionContainer.querySelector(".option-value1");
    let optionValue2 = optionContainer.querySelector(".option-value2");
    let optionValue3 = optionContainer.querySelector(".option-value3");

    if (selectedOption.value == "1") {
        optionValue1.value = '그래픽카드 : RTX 3080ti';
        optionValue2.value = 'SSD : 1TB';
        optionValue3.value = 'RAM : 32GB';
    } else if (selectedOption.value == "2") {
        optionValue1.value = '그래픽카드 : RTX 3070ti';
        optionValue2.value = 'SSD : 500GB';
        optionValue3.value = 'RAM : 16GB';
    } else {
        optionValue1.value = '그래픽카드 : RTX 3060';
        optionValue2.value = 'SSD : 250GB';
        optionValue3.value = 'RAM : 8GB';
    }

}


function showOptionPopup(optionContainer) {
    let parentDivLength = document.querySelectorAll(".parent-div").length;

    for (let i = 1; i <= parentDivLength; i++) {
        try {
            let selectOption = optionContainer.querySelector(`.option-value${i}`).value;
            let selectElement = document.querySelector(`.optionpage-lego-option-select${i}`);

            let [value, text] = selectOption.split(' : ');

            for (let option of selectElement.options) {
                if (option.value === value && option.text === text) {
                    option.selected = true;
                }
            }
        } catch (error) {
            console.log(error);
            continue;
            
        }
    }

    document.querySelector("#optionpage-option-select-page").style.display = "block";
}


document.querySelector('.optionpage-application-btn').addEventListener('click', function () {
    if (currentOptionBeingEdited) {
        applyOption(currentOptionBeingEdited);
        currentOptionBeingEdited = null;
    }
});

function applyOption(optionContainer) {
    let parentDivLength = document.querySelectorAll(".parent-div").length;
    let processOption = optionContainer.querySelector('.processOption');

    // 기존 processOption의 내용을 복사
    let existingOptions = Array.from(processOption.children).filter(child => child.tagName === "INPUT");

    for (let i = 1; i <= parentDivLength; i++) {
        try {
            let selectOption = document.querySelector(`.optionpage-lego-option-select${i}`).value;

            // 기존 input 요소가 있는 경우에는 값을 업데이트
            if (existingOptions[i - 1]) {
                existingOptions[i - 1].value = selectOption;
            } else {
                // 새로운 input 요소를 추가
                let newInput = document.createElement("input");
                newInput.type = "text";
                newInput.value = selectOption;
                newInput.className = `option-value${i}`;
                newInput.readOnly = true;
                processOption.appendChild(newInput);
                processOption.appendChild(document.createElement("br"));
            }
        } catch (error) {
            // 예외가 발생한 경우, 콘솔에 로그 출력 또는 다른 처리를 수행할 수 있음
            console.error(error);
            continue; // 무시하고 계속 진행
        }
    }

    // 삭제된 옵션에 대한 처리
    let remainingOptions = processOption.children.length / 2; // 한 옵션에는 <input>와 <br>이 함께 추가되므로 2로 나눔
    if (remainingOptions > parentDivLength) {
        // 남은 옵션 개수가 더 많으면 삭제 처리
        for (let i = parentDivLength + 1; i <= remainingOptions; i++) {
            processOption.removeChild(processOption.lastChild);
            processOption.removeChild(processOption.lastChild);
        }
    }
    document.querySelector("#optionpage-option-select-page").style.display = "none";
}

var modal = document.getElementById("myModal");
var openModalBtn = document.getElementById("openModalBtn");
var closeModalBtn = document.getElementById("closeModalBtn");
let closebtn = document.querySelector(".nono-btn");
let okaybtn = document.querySelector(".okay-btn");

openModalBtn.addEventListener("click", function () {
    modal.style.display = "block";
    modal.style.pointerEvents = "auto";
});

closeModalBtn.addEventListener("click", function () {
    modal.style.display = "none";
    modal.style.pointerEvents = "none";
});

closebtn.addEventListener("click", function () {
    modal.style.display = "none";
    modal.style.pointerEvents = "none";
});

okaybtn.addEventListener("click", function () {
    location.reload();
})

modal.addEventListener("click", function (event) {
    event.stopPropagation();
});

window.addEventListener("click", function (event) {
    if (event.target == modal) {
        modal.style.display = "none";
        modal.style.pointerEvents = "none";
    }
});

document.querySelector('.optionpage-delete-btn').addEventListener('click', function () {
    document.querySelector("#optionpage-option-select-page").style.display = "none";
});

var detailOption = document.querySelector("#detail-option-select");
var openDetailBtn = document.querySelector(".optionpage-add-option-btn");
var closeDetailBtn = document.querySelector("#closeDetailBtn");

openDetailBtn.addEventListener("click", function () {
    detailOption.style.display = "block";
    detailOption.style.pointerEvents = "auto";
});

closeDetailBtn.addEventListener("click", function () {
    detailOption.style.display = "none";
    detailOption.style.pointerEvents = "none";
});

detailOption.addEventListener("click", function (event) {
    event.stopPropagation();
});

window.addEventListener("click", function (event) {
    if (event.target == modal) {
        detailOption.style.display = "none";
        detailOption.style.pointerEvents = "none";
    }
});

document.querySelector(".optionpage-add-option-btn").addEventListener("click", function () {
    let selectBox = document.querySelector("#optionpage-option-select-box");
    let selectBoxContent = selectBox.innerHTML;

    let indexNumber = document.querySelectorAll('[class^="optionpage-lego-option-select"]').length + 1;

    document.querySelector("#detail-select-btn").addEventListener("click", function () {
        let inputTitleValue = document.querySelector(".detail-title-value").value;
        let inputContentValue = document.querySelector(".detail-content-value").value;
        let optionCast =
            `<div class='parent-div'>
                <input type="checkbox" class="option-delete-box">
                <input type='text' readonly value='${inputTitleValue}' class='optionpage-lego-option'>
                <select class='optionpage-lego-option-select${indexNumber}' name='add-option'>
                    <option value='${inputTitleValue} : ${inputContentValue}' selected>
                        ${inputContentValue}
                    </option>
                </select>
            </div>`;
        document.querySelector("#optionpage-option-select-box").innerHTML = selectBoxContent + optionCast;
        detailOption.style.display = "none";
        detailOption.style.pointerEvents = "none";
    });
});

document.querySelector(".optionpage-delete-option-btn").addEventListener("click", function () {
    let elements = document.querySelectorAll(".option-delete-box");
    for (let i = 0; i < elements.length; i++) {
        elements[i].style.display = "inline-block";
    }
    let deleteBtn = document.querySelector(".optionpage-delete-option-real-btn").style.display = "inline-block";
    let deleteRealBtn = document.querySelector(".optionpage-delete-option-btn").style.display = "none";

    document.querySelector(".optionpage-delete-option-real-btn").addEventListener("click", function () {
        let checkedBoxes = document.querySelectorAll(".option-delete-box:checked");
        checkedBoxes.forEach(function (checkbox) {
            let parentDiv = checkbox.closest('.parent-div');
            if (parentDiv) {
                parentDiv.remove();
            }
        });
        let deleteBtn = document.querySelector(".optionpage-delete-option-real-btn").style.display = "none";
        let deleteRealBtn = document.querySelector(".optionpage-delete-option-btn").style.display = "inline-block";
        for (let i = 0; i < elements.length; i++) {
            elements[i].style.display = "none";
        }
    });
});

// 마이페이지
document.querySelector("#workerName").addEventListener("click", () => {
    window.open("myPage.html", '_blank', 'width = 630, height = 470, top=100, left=100');
});

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

            // //네비4
            // for (let i = 0; i < ulLi.length; i++) {
            //     // ulLi[i].style.padding = '10px';
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

