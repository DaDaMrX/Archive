function checkUserName(obj) {
    var strWarning = "Invalid Name! 3-10 charaters allowed."
    var objTip = document.getElementById("UserNameTip")
    var objState = document.getElementById("state")

    if (obj.value == "") {
        objTip.innerHTML = ""
        objState.value = "false"
    }
    else if (obj.value.length < 3 || obj.value.length > 10) {
        objTip.innerHTML = strWarning
        objState.value = "false"
    }
    else {
        objTip.innerHTML = ""
        objState.value = "true"
    }
}

function checkUserKey(obj) {
    var strWarning = "Invalid Password! 5-12 letter and digits allowd."
    var objTip = document.getElementById("UserKeyTip")
    var objState = document.getElementById("state")

    if (obj.value == "") {
        objTip.innerHTML = ""
        objState.value = "false"
    }
    else if (obj.value.length < 5 || obj.value.length > 12) {
        objTip.innerHTML = strWarning;
        objState.value = "false"
    }
    else {
        objTip.innerHTML = ""
        objState.value = "true"
    }
}

function matchKey(obj) {
    var strWarning = "The two passwords not match!"
    var objTip = document.getElementById("MatchKeyTip")
    var objKey = document.getElementById("signupKey");
    var objState = document.getElementById("state")

    if (obj.value == "" || objKey.value == "") {
        objTip.innerHTML = ""
        objState.value = "false"
    }
    else if (obj.value != objKey.value) {
        objTip.innerHTML = strWarning
        objState.value = "false"
    }
    else {
        objTip.innerHTML = ""
        objState.value = "true"
    }
}

function validate() {
    var strWarning = "Please input the correct information!"
    var objState = document.getElementById("state")
    if (objState.value == "true") {
        document.getElementById("frmSignup").submit();
    }
    else {
        document.getElementById("NameUsedTip").innerHTML = strWarning
        return false;
    }
}
