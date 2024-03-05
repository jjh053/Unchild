
    var CDate = new Date();
    var today = new Date();
    var selectCk = 0;

    var buildcalendar = function () {
        var htmlDates = '';
        var prevLast = new Date(CDate.getFullYear(), CDate.getMonth(), 0);
        var thisFirst = new Date(CDate.getFullYear(), CDate.getMonth(), 1);
        var thisLast = new Date(CDate.getFullYear(), CDate.getMonth() + 1, 0);
        document.querySelector(".year").innerHTML = CDate.getFullYear() + "년";
        document.querySelector(".month").innerHTML = (CDate.getMonth() + 1) + "월";
        const dates = [];
        if (thisFirst.getDay() != 0) {
            for (var i = 0; i < thisFirst.getDay(); i++) {
                dates.unshift(prevLast.getDate() - i);
            }
        }
        for (var i = 1; i <= thisLast.getDate(); i++) {
            dates.push(i);
        }
        // Calculate the next month's dates correctly
        var nextMonthStart = 1;
        for (var i = thisFirst.getDay() + thisLast.getDate(); i < 42; i++) {
            dates.push(nextMonthStart++);
        }

        for (var i = 0; i < 42; i++) {
            var classList = 'date';
            // Add weekend classes for the current month
            if (i % 7 === 0) classList += ' red'; // Sunday
            if (i % 7 === 6) classList += ' blue'; // Saturday

            // Dates from the previous month
            if (i < thisFirst.getDay()) {
                htmlDates += '<div class="' + classList + ' last">' + dates[i] + '</div>';
            }
            // Dates from the current month
            else if (i < thisFirst.getDay() + thisLast.getDate()) {
                if (today.getDate() === dates[i] && today.getMonth() === CDate.getMonth() && today.getFullYear() === CDate.getFullYear()) {
                    htmlDates += '<div id="date_' + dates[i] + '" class="' + classList + ' current-month today" style="background-color: lightblue;">' + dates[i] + '</div>';
                } else {
                    htmlDates += '<div id="date_' + dates[i] + '" class="' + classList + ' current-month" onclick="fn_selectDate(' + dates[i] + ');">' + dates[i] + '</div>';
                }
            }
            // Dates from the next month
            else {
                if (i % 7 === 0 || i % 7 === 6) {
                    // Make the weekends gray for the next month
                    htmlDates += '<div class="' + classList + ' next-month gray">' + dates[i] + '</div>';
                } else {
                    htmlDates += '<div class="' + classList + ' next-month">' + dates[i] + '</div>';
                }
            }
        }
        document.querySelector(".dates").innerHTML = htmlDates;
    }

    function prevCal() {
        CDate.setMonth(CDate.getMonth() - 1);
        buildcalendar();
    }
    function nextCal() {
        CDate.setMonth(CDate.getMonth() + 1);
        buildcalendar();
    }

    function fn_selectDate(date) {
        var clickedDateElement = document.getElementById('date_' + date);
        var monthAttribute = clickedDateElement.getAttribute('data-month');

        if (monthAttribute !== 'current') {
            return;
        }

        var year = CDate.getFullYear();
        var month = CDate.getMonth() + 1;
        var date_txt = "";
        if (CDate.getMonth() + 1 < 10) {
            month = "0" + (CDate.getMonth() + 1);
        }
        if (date < 10) {
            date_txt = "0" + date;
        }

        if (selectCk == 0) {
            $(".date.current-month").css("background-color", "");
            $(".date.current-month").css("color", "");
            $("#date_" + date + ".current-month").css("background-color", "red");
            $("#date_" + date + ".current-month").css("color", "white");

            $("#period_1").val(year + "-" + month + "-" + date);
            $("#period_2").val("");
            selectCk = date;
        } else {
            $("#date_" + date + ".current-month").css("background-color", "red");
            $("#date_" + date + ".current-month").css("color", "white");
            for (var i = selectCk + 1; i < date; i++) {
                $("#date_" + i + ".current-month").css("background-color", "#FFDDDD");
            }

            $("#period_2").val(year + "-" + month + "-" + date);
            selectCk = 0;
        }
    }

    // 프로필 수정
    let openModalBtn = document.querySelector("#modify-profile");
    var modal = document.getElementById("myModal");
    var closeModalBtn = document.getElementById("closeModalBtn");
    let deleteBtn = document.querySelector("#delete-btn");

    // Open the modal
    openModalBtn.addEventListener("click", function () {
        modal.style.display = "block";
        modal.style.pointerEvents = "auto";
    });

    closeModalBtn.addEventListener("click", function () {
        modal.style.display = "none";
        modal.style.pointerEvents = "none";
    });

    deleteBtn.addEventListener("click", function () {
        modal.style.display = "none";
        modal.style.pointerEvents = "none";
    });

    modal.addEventListener("click", function (event) {
        event.stopPropagation();
    });

    // Enable closing the modal by clicking outside of it
    window.addEventListener("click", function (event) {
        if (event.target == modal) {
            modal.style.display = "none";
            // Re-enable the click event on other shadow parts
            modal.style.pointerEvents = "none";
        }
    });

    buildcalendar();

    document.querySelector("#apply-btn").addEventListener("click", () => {
        let myName = document.querySelector("#myName").value;
        let myNumber = document.querySelector("#myNumber").value;
        let myMail = document.querySelector("#myMail").value;
        let myPax = document.querySelector("#myPax").value;

        console.log("myName : " + myName);
        console.log("myNumber : " + myNumber);
        console.log("myMail : " + myMail);

        let firstNumber = myNumber.substr(0, 3);
        let secondNumber = myNumber.substr(3, 4);
        let thirdNumber = myNumber.substr(7);

        let firstPaxNumber = myPax.substr(0, 3);
        let secondPaxNumber = myPax.substr(3, 4);
        let thirdPaxNumber = myPax.substr(7);

        document.querySelector("#mycard").innerHTML =
            `이름 : ${myName}<br>
        전화번호 : ${firstNumber} - ${secondNumber} - ${thirdNumber}<br>
        이메일 : ${myMail}<br>
        PAX : ${firstPaxNumber} - ${secondPaxNumber} - ${thirdPaxNumber}`;

        modal.style.display = 'none';
        modal.style.pointerEvents = "none";
    });




    let openVacationPopup = document.querySelector("#vacationCard");
    let closeVacationPopup = document.querySelector("#closeVacationBtn");
    let deleteVacationPopup = document.querySelector("#deleteVacationBtn");
    let vacationWeek = document.querySelector("#vacationWeek");

    closeVacationPopup.addEventListener("click", () => {
        openVacationPopup.style.display = "none";
        openVacationPopup.style.pointerEvents = "none";
    })

    deleteVacationPopup.addEventListener("click", () => {
        openVacationPopup.style.display = "none";
        // Re-enable the click event on other shadow parts
        openVacationPopup.style.pointerEvents = "none";
    })


    let vacationSchedule = document.querySelector("#vacationSchedule");

    // 휴가신청
    document.querySelector("#vacation-btn").addEventListener("click", function (event) {
        let selectedStartDate = null;

        function resetSelection() {
            selectedStartDate = null;
            document.querySelectorAll(".date.current-month.selected").forEach(function (element) {
                element.style.backgroundColor = "#fc5555";
                element.classList.remove("selected");
            });
            document.querySelector(".vacation-word").innerHTML = "휴가 신청일을 선택해주세요.";
        }

        resetSelection();

        document.querySelector(".dates").addEventListener("click", function (event) {
            let clickedDate = event.target;
            if (clickedDate.classList.contains("current-month")) {
                if (!selectedStartDate) {
                    // Select start date
                    selectedStartDate = clickedDate;
                    selectedStartDate.classList.add("selected");
                    document.querySelector(".vacation-word").innerHTML = "휴가 복귀일을 선택해주세요.";
                } else {
                    // Select return date
                    let currentDate = parseInt(clickedDate.innerText);
                    let startDate = parseInt(selectedStartDate.innerText);

                    if (currentDate >= startDate) {
                        for (let i = startDate; i <= currentDate; i++) {
                            let dateElement = document.getElementById('date_' + i);
                            if (dateElement) {
                                dateElement.style.borderRadius = "0px"
                                dateElement.style.backgroundColor = "#fc5555";
                                document.querySelector(`#date_${startDate}`).style.borderTopLeftRadius = "20px";
                                document.querySelector(`#date_${startDate}`).style.borderBottomLeftRadius = "20px";
                                document.querySelector(`#date_${currentDate}`).style.borderTopRightRadius = "20px";
                                document.querySelector(`#date_${currentDate}`).style.borderBottomRightRadius = "20px";
                            }
                        }
                    }
                    resetSelection();
                    document.querySelector(".vacation-word").innerHTML = '';
                    openVacationPopup.style.display = 'inline-block';
                    vacationWeek.innerHTML = `휴가 : ${document.querySelector(".month").innerText} ${startDate}일 ~ 
                    ${document.querySelector(".month").innerText} ${currentDate}일`;
                    document.querySelector("#applyVacationBtn").addEventListener("click", () => {
                        openVacationPopup.style.display = "none";
                        openVacationPopup.style.pointerEvents = "none";
                        vacationSchedule.style.display = 'block';
                        vacationSchedule.innerHTML = `휴가 기간 : ${document.querySelector(".month").innerText} ${startDate}일 ~ 
                    ${document.querySelector(".month").innerText} ${currentDate}일<br>휴가 사유 : ${reasonBox.value}`;
                    })
                }
            }

        });
    });

    let reasonBtn = document.querySelectorAll(".vacationReason");
    let reasonBox = document.querySelector(".reasonBox");

    reasonBtn[0].addEventListener("click", function (event) {
        console.log(event.target);
        reasonBtn[0].style.backgroundColor = "#999";
        reasonBtn[1].style.backgroundColor = "#ccc";
        reasonBtn[2].style.backgroundColor = "#ccc";
        reasonBtn[3].style.backgroundColor = "#ccc";
        reasonBtn[4].style.backgroundColor = "#ccc";
        reasonBtn[5].style.backgroundColor = "#ccc";
        reasonBox.value = "연차";
        reasonBox.readOnly = true;
    });

    reasonBtn[1].addEventListener("click", function (event) {
        console.log(event.target);
        reasonBtn[1].style.backgroundColor = "#999";
        reasonBtn[0].style.backgroundColor = "#ccc";
        reasonBtn[2].style.backgroundColor = "#ccc";
        reasonBtn[3].style.backgroundColor = "#ccc";
        reasonBtn[4].style.backgroundColor = "#ccc";
        reasonBtn[5].style.backgroundColor = "#ccc";
        reasonBox.value = "월차";
        reasonBox.readOnly = true;
    });

    reasonBtn[2].addEventListener("click", function (event) {
        console.log(event.target);
        event.target.style.backgroundColor = "#999";
        reasonBtn[1].style.backgroundColor = "#ccc";
        reasonBtn[0].style.backgroundColor = "#ccc";
        reasonBtn[3].style.backgroundColor = "#ccc";
        reasonBtn[4].style.backgroundColor = "#ccc";
        reasonBtn[5].style.backgroundColor = "#ccc";
        reasonBox.value = "반차";
        reasonBox.readOnly = true;
    });

    reasonBtn[3].addEventListener("click", function (event) {
        console.log(event.target);
        event.target.style.backgroundColor = "#999";
        reasonBtn[1].style.backgroundColor = "#ccc";
        reasonBtn[2].style.backgroundColor = "#ccc";
        reasonBtn[0].style.backgroundColor = "#ccc";
        reasonBtn[4].style.backgroundColor = "#ccc";
        reasonBtn[5].style.backgroundColor = "#ccc";
        reasonBox.value = "포상";
        reasonBox.readOnly = true;
    });

    reasonBtn[4].addEventListener("click", function (event) {
        console.log(event.target);
        event.target.style.backgroundColor = "#999";
        reasonBtn[1].style.backgroundColor = "#ccc";
        reasonBtn[2].style.backgroundColor = "#ccc";
        reasonBtn[3].style.backgroundColor = "#ccc";
        reasonBtn[0].style.backgroundColor = "#ccc";
        reasonBtn[5].style.backgroundColor = "#ccc";
        reasonBox.value = "외출";
        reasonBox.readOnly = true;
    });

    reasonBtn[5].addEventListener("click", function (event) {
        console.log(event.target);
        event.target.style.backgroundColor = "#999";
        reasonBtn[1].style.backgroundColor = "#ccc";
        reasonBtn[2].style.backgroundColor = "#ccc";
        reasonBtn[3].style.backgroundColor = "#ccc";
        reasonBtn[4].style.backgroundColor = "#ccc";
        reasonBtn[0].style.backgroundColor = "#ccc";

        reasonBox.value = "";
        reasonBox.placeholder = "직접 작성";
        reasonBox.readOnly = false;
    });

    let openWorkPopup = document.querySelector(".today-work-zip");
    let closeWorkPopup = document.querySelector("#closeWorkBtn");
    let closeWorkBox = document.querySelector("#closeWorkBox");
    let workPage = document.querySelector("#todayWorkPage");
    let todayWorkZip = document.querySelector(".today-work-zip")

    openWorkPopup.addEventListener("click", function () {
        workPage.style.display = "block";
        workPage.style.pointerEvents = "auto";
    });

    closeWorkPopup.addEventListener("click", function () {
        workPage.style.display = "none";
        workPage.style.pointerEvents = "none";
    });

    closeWorkBox.addEventListener("click", function () {
        let tdContent = document.querySelectorAll(".tdContent");
        console.log(tdContent[0].textContent);

        let texta = "";
        workPage.style.display = "none";
        workPage.style.pointerEvents = "none";
        texta += `<ul>`
        for (let i = 0; i < tdContent.length; i++) {
            texta += `<li>- ${tdContent[i].textContent}</li>`
        }
        texta += `</ul>`;

        todayWorkZip.innerHTML = texta;


    });

    deleteBtn.addEventListener("click", function () {
        workPage.style.display = "none";
        workPage.style.pointerEvents = "none";
    });

    workPage.addEventListener("click", function (event) {
        event.stopPropagation();
    });

    window.addEventListener("click", function (event) {
        if (event.target == workPage) {
            workPage.style.display = "none";
            workPage.style.pointerEvents = "none";
        }
    });


    document.querySelector("#workCheckBox").addEventListener("click", function () {
        let list_checked = document.querySelectorAll(".work-check-box:checked");
        let tdContent = document.querySelectorAll(".tdContent").length;

        for (let i = 0; i < list_checked.length; i++) {
            list_checked[i].parentNode.parentNode.remove();
            console.log(tdContent);
        }
    })

    document.querySelector("#totalChkBtn").addEventListener("click", function (event) {
        // 클릭된 요소가
        let list_check = document.querySelectorAll(".work-check-box");
        if (event.target.checked) {
            // 체크상태라면
            for (let i = 0; i < list_check.length; i++) {
                list_check[i].checked = true;
            }
        } else {
            // 체크상태가 아니라면
            for (let i = 0; i < list_check.length; i++) {
                list_check[i].checked = false;
            }
        }
    });

    document.querySelector(".work-check-box").addEventListener("click", function (event) {
        if (!event.target.checked) {
            document.querySelector("#totalChkBtn").checked = false;
        } else {
            let allCount = document.querySelectorAll(".work-check-box").length;
            let checkedCount = document.querySelectorAll(".work-check-box:checked").length;

            if (allCount == checkedCount) {
                document.querySelector("#totalChkBtn").checked = true;
            } else {
                document.querySelector("#totalChkBtn").checked = false;
            }
        }
    })


    let openMailBtn = document.querySelector("#mailMainpage");
    var mailPopup = document.getElementById("mailPage");
    var closeMailBtn = document.getElementById("closeMailBtn");
    let mailCloseBtn = document.querySelector("#mailCloseBtn");

    openMailBtn.addEventListener("click", function (event) {
        mailPopup.style.display = "block";
        mailPopup.style.pointerEvents = "auto";

        document.querySelector("#allCheckBox").addEventListener("click", function(event) {
        let list_check = document.querySelectorAll(".isCheckedBox");
        if(event.target.checked) {
            for(let i=0; i<list_check.length; i++) {
                list_check[i].checked = true;
            }
        } else {
            for(let i=0; i<list_check.length; i++) {
                list_check[i].checked = false;
            }
        }
    });

        document.querySelector(".isCheckedBox").addEventListener("click", function(event) {
            if(!event.target.checked) {
                document.querySelector("#allCheckBox").checked = false;
            } else {
                let allCount = document.querySelectorAll(".isCheckedBox").length;
                let checkedCount = document.querySelectorAll(".isCheckedBox:checked").length;

                if(allCount == checkedCount) {
                    document.querySelector("#allCheckBox").checked = true;
                } else {
                    document.querySelector("#allCheckBox").checked = false;
                }
            }
        })

        document.querySelector("#mailDeleteBtn").addEventListener("click", function () {
            let list_checked = document.querySelectorAll(".isCheckedBox:checked");
            for (let i = 0; i < list_checked.length; i++) {
                list_checked[i].parentNode.parentNode.remove();
            }
        })
    });

    closeMailBtn.addEventListener("click", function () {
        mailPopup.style.display = "none";
        mailPopup.style.pointerEvents = "none";
    });

    mailCloseBtn.addEventListener("click", function () {
        mailPopup.style.display = "none";
        mailPopup.style.pointerEvents = "none";
    });

    mailPopup.addEventListener("click", function (event) {
        event.stopPropagation();
    });

    window.addEventListener("click", function (event) {
        if (event.target == mailPopup) {
            mailPopup.style.display = "none";
            mailPopup.style.pointerEvents = "none";
        }
    });

    let openWriteMail = document.querySelector("#writeMailPage");
    var mailWrite = document.getElementById("mailWrite");
    var closeWriteBtn = document.getElementById("closeWriteBtn");
    let deleteWriteBtn = document.querySelector("#delete-write-btn");
    let applyMailBtn = document.querySelector("#apply-write-btn");

    openWriteMail.addEventListener("click", function () {
        mailWrite.style.display = "block";
        mailWrite.style.pointerEvents = "auto";
    });

    closeWriteBtn.addEventListener("click", function () {
        mailWrite.style.display = "none";
        mailWrite.style.pointerEvents = "none";
    });

    applyMailBtn.addEventListener("click", function () {
        mailWrite.style.display = "none";
        mailWrite.style.pointerEvents = "none";
    });

    deleteWriteBtn.addEventListener("click", function () {
        mailWrite.style.display = "none";
        mailWrite.style.pointerEvents = "none";
    });

    mailWrite.addEventListener("click", function (event) {
        event.stopPropagation();
    });

    window.addEventListener("click", function (event) {
        if (event.target == mailWrite) {
            mailWrite.style.display = "none";
            mailWrite.style.pointerEvents = "none";
        }
    });

    let orderDetail = document.querySelector(".order-detail");
    var orderPage = document.getElementById("orderPage");
    var closeOrderBtn = document.getElementById("closeOrderBtn");
    let orderCloseBtn = document.querySelector("#orderCloseBtn");

    orderDetail.addEventListener("click", function () {
        orderPage.style.display = "block";
        orderWritePage.style = "none";
        orderPage.style.pointerEvents = "auto";
    });

    closeOrderBtn.addEventListener("click", function () {
        orderPage.style.display = "none";
        orderPage.style.pointerEvents = "none";
    });

    orderCloseBtn.addEventListener("click", function () {
        orderPage.style.display = "none";
        orderPage.style.pointerEvents = "none";
    });

    orderPage.addEventListener("click", function (event) {
        event.stopPropagation();
    });

    let orderWriteBtn = document.querySelector("#orderWriteBtn");
    var orderWritePage = document.getElementById("orderWritePage");
    var closeOrderWriteBtn = document.getElementById("closeOrderWriteBtn");
    let orderWriteCancelbtn = document.querySelector("#orderWriteCancelbtn");

    orderWriteBtn.addEventListener("click", function () {
        orderWritePage.style.display = "block";
        orderWritePage.style.pointerEvents = "auto";
    });

    closeOrderWriteBtn.addEventListener("click", function () {
        orderWritePage.style.display = "none";
        orderWritePage.style.pointerEvents = "none";
    });

    orderWriteCancelbtn.addEventListener("click", function () {
        orderWritePage.style.display = "none";
        orderWritePage.style.pointerEvents = "none";
    });

    orderWritePage.addEventListener("click", function (event) {
        event.stopPropagation();
    });

    window.addEventListener("click", function (event) {
        if (event.target == orderPage) {
            orderPage.style.display = "none";
            orderPage.style.pointerEvents = "none";
        }
    });

    document.querySelector("#orderWriteApplyBtn").addEventListener("click", () => {
        let orderTableBody = document.querySelector("#orderTableBody");
        let orderWriteTitle = document.querySelector(".orderWriteTitle");
        let bodyChild = document.createElement('tr');
        bodyChild.innerHTML = `
            <td>02.09</td>
            <td><a href="#">${orderWriteTitle.value}</a></td>
            <td>최민수</td>
            <td></td>
        `;
        orderTableBody.prepend(bodyChild);
        orderWritePage.style.display = 'none';

    });

    document.querySelector("#close-btn").addEventListener("click", () => {
        window.close();
    })



    // 관리자 / 작업자 로그인에 따라서 인터페이스 변경
    let vacationBtn = document.querySelector("#vacation-btn");
    let myMailPage = document.querySelector("#my-mail-page");
    let todayWork = document.querySelector("#todayWork");

    // 관리자
    // vacationBtn.style.display = "none";
    // myMailPage.style.display = "block";
    // todayWork.style.display = "none";
    // orderWriteBtn.style.display = "inline-block";

    // 작업자
    orderWriteBtn.style.display = "none";
    vacationBtn.style.display = "block";
    myMailPage.style.display = "none";
    todayWork.style.display = "block";
