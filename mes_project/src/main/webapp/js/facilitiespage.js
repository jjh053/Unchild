document.querySelector(".detail-content-value-gpu").style.display = "none";
document.querySelector(".detail-content-value-ssd").style.display = "none";
document.querySelector(".detail-content-value-ram").style.display = "none";
document.querySelector(".detail-content-value-cpu").style.display = "none";
document.querySelector(".detail-content-value-쿨러").style.display = "none";
document.querySelector(".detail-content-value-메인보드").style.display = "none";
document.querySelector(".detail-content-value-파워").style.display = "none";

document.querySelector(".detail-title-value").addEventListener("change", () => {
   let select1st = document.querySelector(".detail-title-value").value;
   console.log("select1st : " + select1st);
   if (select1st == 'CPU') {
      console.log("cpu 들어옴");
      document.querySelector(".detail-content-value-gpu").style.display = "none";
      document.querySelector(".detail-content-value-ssd").style.display = "none";
      document.querySelector(".detail-content-value-ram").style.display = "none";
      document.querySelector(".detail-content-value-cpu").style.display = "inline-block";
      document.querySelector(".detail-content-value-쿨러").style.display = "none";
      document.querySelector(".detail-content-value-메인보드").style.display = "none";
      document.querySelector(".detail-content-value-파워").style.display = "none";
   } else if (select1st == '쿨러') {
      console.log("쿨러 들어옴");
      document.querySelector(".detail-content-value-gpu").style.display = "none";
      document.querySelector(".detail-content-value-ssd").style.display = "none";
      document.querySelector(".detail-content-value-ram").style.display = "none";
      document.querySelector(".detail-content-value-cpu").style.display = "none";
      document.querySelector(".detail-content-value-쿨러").style.display = "inline-block";
      document.querySelector(".detail-content-value-메인보드").style.display = "none";
      document.querySelector(".detail-content-value-파워").style.display = "none";
   } else if (select1st == '메인보드') {
      console.log("메인보드 들어옴");
      document.querySelector(".detail-content-value-gpu").style.display = "none";
      document.querySelector(".detail-content-value-ssd").style.display = "none";
      document.querySelector(".detail-content-value-ram").style.display = "none";
      document.querySelector(".detail-content-value-cpu").style.display = "none";
      document.querySelector(".detail-content-value-쿨러").style.display = "none";
      document.querySelector(".detail-content-value-메인보드").style.display = "inline-block";
      document.querySelector(".detail-content-value-파워").style.display = "none";
   } else if (select1st == '파워') {
      console.log("파워 들어옴");
      document.querySelector(".detail-content-value-gpu").style.display = "none";
      document.querySelector(".detail-content-value-ssd").style.display = "none";
      document.querySelector(".detail-content-value-ram").style.display = "none";
      document.querySelector(".detail-content-value-cpu").style.display = "none";
      document.querySelector(".detail-content-value-쿨러").style.display = "none";
      document.querySelector(".detail-content-value-메인보드").style.display = "none";
      document.querySelector(".detail-content-value-파워").style.display = "inline-block";
   } else if (select1st == "GPU") {
      console.log("gpu 들어옴");
      document.querySelector(".detail-content-value-gpu").style.display = "inline-block";
      document.querySelector(".detail-content-value-ssd").style.display = "none";
      document.querySelector(".detail-content-value-ram").style.display = "none";
      document.querySelector(".detail-content-value-cpu").style.display = "none";
      document.querySelector(".detail-content-value-쿨러").style.display = "none";
      document.querySelector(".detail-content-value-메인보드").style.display = "none";
      document.querySelector(".detail-content-value-파워").style.display = "none";
   } else if (select1st == "SSD") {
      console.log("ssd 들어옴");
      document.querySelector(".detail-content-value-gpu").style.display = "none";
      document.querySelector(".detail-content-value-ssd").style.display = "inline-block";
      document.querySelector(".detail-content-value-ram").style.display = "none";
      document.querySelector(".detail-content-value-cpu").style.display = "none";
      document.querySelector(".detail-content-value-쿨러").style.display = "none";
      document.querySelector(".detail-content-value-메인보드").style.display = "none";
      document.querySelector(".detail-content-value-파워").style.display = "none";
   } else if (select1st == "RAM") {
      console.log("ram 들어옴");
      document.querySelector(".detail-content-value-gpu").style.display = "none";
      document.querySelector(".detail-content-value-ssd").style.display = "none";
      document.querySelector(".detail-content-value-ram").style.display = "inline-block";
      document.querySelector(".detail-content-value-cpu").style.display = "none";
      document.querySelector(".detail-content-value-쿨러").style.display = "none";
      document.querySelector(".detail-content-value-메인보드").style.display = "none";
      document.querySelector(".detail-content-value-파워").style.display = "none";
   } else if (select1st == "옵션 선택") {
      document.querySelector(".detail-content-value-gpu").style.display = "none";
      document.querySelector(".detail-content-value-ssd").style.display = "none";
      document.querySelector(".detail-content-value-ram").style.display = "none";
      document.querySelector(".detail-content-value-cpu").style.display = "none";
      document.querySelector(".detail-content-value-쿨러").style.display = "none";
      document.querySelector(".detail-content-value-메인보드").style.display = "none";
      document.querySelector(".detail-content-value-파워").style.display = "none";
   }
})

// 공통 스크립트
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
const hover = document.querySelectorAll('a.hover');
const menuBar = document.querySelector('.menu-bar');
const nav = document.querySelector('nav');

const wrap = document.querySelector('.wrap');
// 모바일 스크립트 코드
const hamburgerMenu = document.querySelector('.hamburger-menu');
const myPage = document.querySelector('#myPage');

hamburgerMenu.addEventListener('click', function() {
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
   link.addEventListener("click", function(event) {
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

wrap.addEventListener("mouseleave", function() {
   if (!isHovered) {
      hideMenuBar();
   }
});
menuBar.addEventListener("mouseenter", function() {
   isHovered = true;
});

menuBar.addEventListener("mouseleave", function() {
   hideMenuBar();
});

section.addEventListener("click", function() {
   hideMenuBar();
})

function showMenuBar() {
   nav.classList.add('active');
}

function hideMenuBar() {
   nav.classList.remove('active');
}
////////////////////////////////////////////////////////////////////////////////////////////////////

let currentOption = null;

document.querySelector('.options-container').addEventListener('change', function(event) {
   if (event.target.classList.contains('cpu-option')) {
      updateOption(event.target);
   }
});

document.querySelector('.options-container').addEventListener('click', function(event) {
   if (event.target.classList.contains('delete-option-btn')) {
      event.target.closest('.lego-option').remove();
   } else if (event.target.classList.contains('change-option')) {
      currentOption = event.target.closest('.lego-option');
   }
});

function crystal() {
    let changeOpBtn = document.querySelectorAll(".change-option");
    console.log("changeOpBtn.length : " + changeOpBtn.length);
    for (let i = 0; i < changeOpBtn.length; i++) {
        let btn = changeOpBtn[i];
        btn.addEventListener("click", (event) => {
            event.currentTarget.parentNode.parentNode.querySelector(".cpu-option").style.display = "inline-block";
            document.querySelector("#optionpage-option-select-page").style.display = "block";
            let inputCount = document.querySelectorAll(".inputCount");
            let countInput = document.querySelectorAll(".countInput");
            for (let i = 0; i < inputCount.length; i++) {
                inputCount[i].style.display = "none";
                countInput[i].style.display = "none";
            }
        });
    }
}


document.addEventListener("DOMContentLoaded", () => {
   addOption();
   crystal();
})

document.getElementById('add-option-btn').addEventListener('click', function() {
   let originalOption = document.querySelector('.lego-option');
   let lineNumber = document.querySelectorAll('.lego-option').length;

   if (lineNumber < 4) {
      let newOption = originalOption.cloneNode(true); // 깊은복사
      document.querySelector('.options-container').appendChild(newOption);

      let productionLine = newOption.querySelector('div:first-child');
      productionLine.innerHTML = (lineNumber + 1) + '번<br>라인 <input type="hidden" name="createLine" value="' + (lineNumber + 1) + '">';

      newOption.querySelector(".stockZip").innerHTML = "";
      newOption.querySelector(".processOption").innerHTML = `
         <div class="tempOption">
            옵션을 선택하세요.
         </div>
      `;
      
      if(window.innerWidth <= 430) {
         newOption.querySelector(".cpu-option").style.display = "inline-block";
      } else {
         newOption.querySelector(".cpu-option").style.display = "none";
      }

      console.log(newOption.querySelector(".processOption").innerHTML);

      newOption.querySelector('.cpu-option').addEventListener('change', function() {
         updateOption(this);
      });

   } else {
      alert("4번 생산라인까지만 추가가 가능합니다!");
   }
   crystal();

});

// 설비 설정페이지에서 컴퓨터 등급에따라서 인풋박스 내용이 바뀜
function updateOption(selectedOption) {
   let optionContainer = selectedOption.closest('.lego-option');
   let optionValue1 = optionContainer.querySelector(".option-value1");
   let optionValue2 = optionContainer.querySelector(".option-value2");
   let optionValue3 = optionContainer.querySelector(".option-value3");

   if (selectedOption.value == "1") {
      optionValue1.value = 'Nvibia GoForce RTX 4080TI';
      optionValue2.value = 'Foursung 970 EVO Plus 4TB NVMe SSD';
      optionValue3.value = '32GB DDD5-4500';
   } else if (selectedOption.value == "2") {
      optionValue1.value = 'AMB Radoon RX 6800 XT';
      optionValue2.value = 'Crocial MX500 1TB SATA SSD';
      optionValue3.value = '16GB DDD4-3200';
   } else {
      optionValue1.value = 'Nvibia GoForce GTX 1660 Ti';
      optionValue2.value = 'Eastern Digital Blue 500GB NVMe SSD';
      optionValue3.value = '8GB DDD4-2666';
   }

}


document.querySelector('.optionpage-application-btn').addEventListener('click', function() {
   if (currentOption) {
      applyOption(currentOption);
      currentOption = null;
   }

   let inputCount = document.querySelectorAll(".inputCount");
   let countInput = document.querySelectorAll(".countInput");
   for (let i = 0; i < inputCount.length; i++) {
      inputCount[i].style.display = "inline-block";
      countInput[i].style.display = "inline-block";
   }


});

let selectNum = 0;
function applyOption(optionContainer) {
   let parentDivLength = document.querySelectorAll(".parent-div").length;
   let processOption = optionContainer.querySelector('.processOption');

   optionContainer.querySelector(".stockZip").innerHTML = "";
   optionContainer.querySelector(".processOption").innerHTML = document.querySelector('#optionpage-option-select-box').innerHTML;
   let olo = document.querySelectorAll('.optionpage-lego-option');
   for(let i=0; i<olo.length; i++) {
      olo[i].style.width = '60px';   
   }
   selectNum++;

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

openModalBtn.addEventListener("click", function() {
   modal.style.display = "block";
   modal.style.pointerEvents = "auto";

    let todayTime = new Date();
   let wdate = "";
   let nowYear = todayTime.getFullYear();
   let nowMonth = ('0' + (todayTime.getMonth() + 1)).slice(-2);
   let nowDate = ('0' + todayTime.getDate()).slice(-2);
   
   let nowHour = ('0' + todayTime.getHours()).slice(-2);
   let nowMin = ('0' + todayTime.getMinutes()).slice(-2);
   
   wdate = nowYear + "-" + nowMonth + "-" + nowDate + " " + nowHour + ":" + nowMin;
   document.querySelector("input[name=nDate]").value = wdate;
   console.log("wdate : " + wdate)
});

closeModalBtn.addEventListener("click", function() {
   modal.style.display = "none";
   modal.style.pointerEvents = "none";
});

closebtn.addEventListener("click", function() {
   modal.style.display = "none";
   modal.style.pointerEvents = "none";
});

modal.addEventListener("click", function(event) {
   event.stopPropagation();
});

window.addEventListener("click", function(event) {
   if (event.target == modal) {
      modal.style.display = "none";
      modal.style.pointerEvents = "none";
   }
});

document.querySelector('.optionpage-delete-btn').addEventListener('click', function() {
   document.querySelector("#optionpage-option-select-page").style.display = "none";
   let inputCount = document.querySelectorAll(".inputCount");
   let countInput = document.querySelectorAll(".countInput");
   for (let i = 0; i < inputCount.length; i++) {
      inputCount[i].style.display = "inline-block";
      countInput[i].style.display = "inline-block";
   }
});

var detailOption = document.querySelector("#detail-option-select");
var openDetailBtn = document.querySelector(".optionpage-add-option-btn");
var closeDetailBtn = document.querySelector("#closeDetailBtn");


closeDetailBtn.addEventListener("click", function() {
   detailOption.style.display = "none";
   detailOption.style.pointerEvents = "none";
});

detailOption.addEventListener("click", function(event) {
   event.stopPropagation();
});

window.addEventListener("click", function(event) {
   if (event.target == modal) {
      detailOption.style.display = "none";
      detailOption.style.pointerEvents = "none";
   }
});


openDetailBtn.addEventListener("click", function(event) {
   detailOption.style.display = "block";
   detailOption.style.pointerEvents = "auto";

   let legoOp = document.querySelectorAll('.optionpage-lego-option');
   let titleValOptions = document.querySelectorAll(".detail-title-value option");
   console.log("legoOp 길이" + legoOp.length);
   console.log("titleValOptions 길이" + titleValOptions.length); // 8

   for (let i = 0; i < legoOp.length; i++) {
      let legoOption = legoOp[i].value;
      let foundMatch = false; // 해당 legoOption에 대해 일치하는 요소를 찾았는지 여부를 나타내는 플래그

      for (let j = 0; j < titleValOptions.length; j++) {
         let titleVal = titleValOptions[j].value;
         if (legoOption == titleVal) {
            console.log("legoOption : " + legoOption);
            titleValOptions[j].style.display = "none";
            foundMatch = true; // 일치하는 요소를 찾았음을 표시
         }
      }

      // 해당 legoOption에 대해 일치하는 요소를 찾지 못했을 경우, 모든 요소를 보이도록 설정
      if (!foundMatch) {
         for (let j = 0; j < titleValOptions.length; j++) {
            titleValOptions[j].style.display = "inline-block";
         }
      }
   }
});


function addOption() {
   let selectBox = document.querySelector("#optionpage-option-select-box");
   let selectBoxContent = selectBox.innerHTML;
   let indexNumber = document.querySelectorAll('[class^="optionpage-lego-option-select"]').length + 1;
   
   document.querySelector("#detail-select-btn").addEventListener("click", function() {
      let inputTitleValue = document.querySelector(".detail-title-value").value;
      let inputContentValue = null;
      if (inputTitleValue == 'CPU') {
         inputContentValue = document.querySelector(".detail-content-value-cpu").value;
         console.log("inputContentValue : " + inputContentValue);
      } else if (inputTitleValue == '쿨러') {
         inputContentValue = document.querySelector(".detail-content-value-쿨러").value;
         console.log("inputContentValue : " + inputContentValue);
      } else if (inputTitleValue == '메인보드') {
         inputContentValue = document.querySelector(".detail-content-value-메인보드").value;
         console.log("inputContentValue : " + inputContentValue);
      } else if (inputTitleValue == '파워') {
         inputContentValue = document.querySelector(".detail-content-value-파워").value;
         console.log("inputContentValue : " + inputContentValue);
      } else if (inputTitleValue == 'GPU') {
         inputContentValue = document.querySelector(".detail-content-value-gpu").value;
         console.log("inputContentValue : " + inputContentValue);
      } else if (inputTitleValue == 'SSD') {
         inputContentValue = document.querySelector(".detail-content-value-ssd").value;
         console.log("inputContentValue : " + inputContentValue);
      } else if (inputTitleValue == 'RAM') {
         inputContentValue = document.querySelector(".detail-content-value-ram").value;
         console.log("inputContentValue : " + inputContentValue);
      }
      console.log("inputContentValue 이게 2번돔: " + inputContentValue);
   
      let optionCast =
            `<div class='parent-div'>
                   <input type="checkbox" class="option-delete-box">
                   <input type='text' readonly value='${inputTitleValue.toUpperCase()}' class='optionpage-lego-option'>
                   <select class='optionpage-lego-option-select${indexNumber}' name='add-option'>
                       <option value='${inputContentValue}' selected>
                           ${inputContentValue}
                       </option>
                   </select>
               </div>`;
      document.querySelector("#optionpage-option-select-box").innerHTML = document.querySelector("#optionpage-option-select-box").innerHTML + optionCast;
   
      document.querySelector(".detail-title-value").selectedIndex = 0;
      document.querySelector(".detail-content-value-gpu").style.display = "none";
      document.querySelector(".detail-content-value-ssd").style.display = "none";
      document.querySelector(".detail-content-value-ram").style.display = "none";
      document.querySelector(".detail-content-value-cpu").style.display = "none";
      document.querySelector(".detail-content-value-쿨러").style.display = "none";
      document.querySelector(".detail-content-value-메인보드").style.display = "none";
      document.querySelector(".detail-content-value-파워").style.display = "none";
   
      detailOption.style.display = "none";
      detailOption.style.pointerEvents = "none";
   });
}


document.querySelector(".optionpage-delete-option-btn").addEventListener("click", function() {
   let legoOp = document.querySelectorAll('.optionpage-lego-option');
   let titleValOptions = document.querySelectorAll(".detail-title-value option");
   console.log("legoOp 길이" + legoOp.length);
   console.log("titleValOptions 길이" + titleValOptions.length); // 8

   for (let i = 0; i < legoOp.length; i++) {
      let legoOption = legoOp[i].value;
      let foundMatch = false; // 해당 legoOption에 대해 일치하는 요소를 찾았는지 여부를 나타내는 플래그

      for (let j = 0; j < titleValOptions.length; j++) {
         let titleVal = titleValOptions[j].value;
         if (legoOption != titleVal) {
            console.log("legoOption : " + legoOption);
            titleValOptions[j].style.display = "inline-block";
            foundMatch = true; // 일치하는 요소를 찾았음을 표시
         }
      }

      // 해당 legoOption에 대해 일치하는 요소를 찾지 못했을 경우, 모든 요소를 보이도록 설정
      if (!foundMatch) {
         for (let j = 0; j < titleValOptions.length; j++) {
            titleValOptions[j].style.display = "inline-block";
         }
      }
   }
   
   let elements = document.querySelectorAll(".option-delete-box");
   for (let i = 0; i < elements.length; i++) {
      elements[i].style.display = "inline-block";
   }
   let deleteBtn = document.querySelector(".optionpage-delete-option-real-btn").style.display = "inline-block";
   let deleteRealBtn = document.querySelector(".optionpage-delete-option-btn").style.display = "none";

});

document.querySelector(".optionpage-delete-option-real-btn").addEventListener("click", function() {
   let checkedBoxes = document.querySelectorAll(".option-delete-box:checked");
   checkedBoxes.forEach(function(checkbox) {
      let parentDiv = checkbox.closest('.parent-div');
      if (parentDiv) {
         parentDiv.remove();
      }
   });
   let deleteBtn = document.querySelector(".optionpage-delete-option-real-btn").style.display = "none";
   let deleteRealBtn = document.querySelector(".optionpage-delete-option-btn").style.display = "inline-block";
   let elements = document.querySelectorAll(".option-delete-box");
   for (let i = 0; i < elements.length; i++) {
      elements[i].style.display = "none";
   }
});


// 마이페이지
document.querySelector("#workerName").addEventListener("click", () => {
   window.open("myPage.html", '_blank', 'width = 630, height = 470, top=100, left=100');
});



hover.forEach(link => {
   link.addEventListener("click", function(event) {
      let myPage = document.querySelector("#myPage");
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

