function validate() {
    var score = 0, correct = 0, half = 0

    if (document.getElementsByName("ques1")[1].checked) score += 2, correct++;

    radio = document.getElementsByName("ques2");
    if (!radio[0].checked) {
        if (radio[1].checked && radio[2].checked && radio[3].checked) score += 3, correct++;
        else if (radio[1].checked || radio[2].checked || radio[3].checked) score += 1, half++;
    }

    if (document.getElementsByName("ques3")[2].checked) score += 2, correct++;

    radio = document.getElementsByName("ques4");
    if (!radio[2].checked) {
        if (radio[0].checked && radio[1].checked && radio[3].checked) score += 3, correct++;
        else if (radio[0].checked || radio[1].checked || radio[3].checked) score += 1, half++;
    }

    if (document.getElementsByName("ques5")[0].checked) score += 2, correct++;

    radio = document.getElementsByName("ques6");
    if (!radio[2].checked) {
        if (radio[0].checked && radio[1].checked && radio[3].checked) score += 3, correct++;
        else if (radio[0].checked || radio[1].checked || radio[3].checked) score += 1, half++;
    }

    var totol = 6;
    var wrong = totol - correct - half;
    alert("本试卷共 6 题 15 分\n\n在你的答案中:\n\n   " + correct + "  道题完全正确\n\n   " + half
        + "  道题对而不全\n\n   " + wrong + "  道题错误\n\n" + "你的最终得分为: " + score + " 分\n\n"
        + "共用时: " + usedTime.getMinutes() + " 分 " + usedTime.getSeconds() + " 秒");

    document.getElementsByName("userScore")[0].value = score;
    document.getElementsByName("beginTime")[0].value = transDateHMS(dateBegin)
    document.getElementsByName("endTime")[0].value = transDateHMS(now)
    document.getElementsByName("useTime")[0].value = transDateMS(usedTime)
}

function reset() {
    var question = document.getElementsByName("ques1");
    for (i = 0; i < queston.length; i++) {
        question[i].checked = false;
    }
    question = document.getElementsByName("ques2");
    for (i = 0; i < queston.length; i++) {
        question[i].checked = false;
    }
    question = document.getElementsByName("ques3");
    for (i = 0; i < queston.length; i++) {
        question[i].checked = false;
    }
    question = document.getElementsByName("ques4");
    for (i = 0; i < queston.length; i++) {
        question[i].checked = false;
    }
    question = document.getElementsByName("ques5");
    for (i = 0; i < queston.length; i++) {
        question[i].checked = false;
    }
    question = document.getElementsByName("ques6");
    for (i = 0; i < queston.length; i++) {
        question[i].checked = false;
    }
}

function transDateHMS(date) {
    var minute = date.getMinutes();
    if (minute < 10) minute = "0" + minute;
    var second = date.getSeconds();
    if (second < 10) second = "0" + second;
    return date.getHours() + ":" + minute + ":" + second;
}

function transDateMS(date) {
    var minute = date.getMinutes();
    if (minute < 10) minute = "0" + minute;
    var second = date.getSeconds();
    if (second < 10) second = "0" + second;
    return minute + ":" + second;
}

var total = 15 * 60000;
var dateBegin
var now
var usedTime;

function clock() {
    now = new Date();

    used = now - dateBegin;
    usedTime = new Date(used);
    document.getElementById("usedTime").innerHTML = transDateMS(usedTime);

    var leftTime = new Date(total - used + 500);
    document.getElementById("leftTime").innerHTML = transDateMS(leftTime);

    document.getElementById("curTime").innerHTML = transDateHMS(now);

    var hour = now.getHours();
    var s = document.getElementById("greet");
    if (hour < 12) s.innerHTML = "Good Morning";
    else if (hour < 18) s.innerHTML = "Good afternoon";
    else s.innerHTML = "Good evening";
}
