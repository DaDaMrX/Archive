<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html" charset="utf-8" />
    <title>Web Knowledge Test</title>
    <script src="script/index.js"></script>
    <script src="bootstrap/bootstrap.js"></script>
    <script src="bootstrap/jquery-1.9.1.js"></script>
    <script src="bootstrap/bootstrap.min.js"></script>
    <link href="bootstrap/bootstrap.css" rel="stylesheet" />
    <link href="CSS/index.css" rel="stylesheet" />
</head>
<body>
    <%if request.Form("signType") = "signup" then%>
    <%set conn=Server.CreateObject("ADODB.Connection")
        conn.Provider="Microsoft.Jet.OLEDB.4.0"
        conn.Open(Server.Mappath("DataBase/score.mdb"))%>

    <%UserName = request.Form("signupUserName")
        UserKey = request.Form("signupUserKey")%>
    <%sql = "INSERT INTO NameKey (UserName, UserKey) VALUES('" & UserName & "', '" & UserKey & "')"
        conn.Execute sql%>

    <form id="frm1" action="onlinetest.asp" method="post">
        <input type="hidden" name="UserName" value="<%=(UserName) %>" />
    </form>
    <script type="text/javascript">
        alert("Register successfully!\n\nYou will enter the test.")
        document.getElementById("frm1").submit();
    </script>

    <%conn.Close %>
    <%end if %>

    <%if request.Form("signType") = "signin" then %>
    <%set conn=Server.CreateObject("ADODB.Connection")
        conn.Provider="Microsoft.Jet.OLEDB.4.0"
        conn.Open(Server.Mappath("DataBase/score.mdb"))%>

    <%set rs = Server.CreateObject("ADODB.recordset")
        sql = "SELECT * FROM NameKey"
        rs.Open sql, conn%>

    <%flag = 0 %>
    <%UserName = request.Form("signinUserName")
        UserKey = request.Form("signinUserKey")%>

    <%do until rs.EOF
            for each x in rs.Fields
                if rs.Fields.Item("UserName") = UserName and rs.Fields.Item("UserKey") = UserKey then
                    flag = 1
                    exit for
                    exit do
                end if
            next
            rs.MoveNext
        loop%>

    <%if flag = 1 then %>
    <form id="frm2" action="onlinetest.asp" method="post">
        <input type="hidden" name="UserName" value="<%=(UserName) %>" />
    </form>
    <script type="text/javascript">
        alert("Log in successfully!\n\nYou will enter the test.")
        document.getElementById("frm2").submit();
    </script>
    <%else %>
    <script type="text/javascript">
        alert("User name or password error!")
    </script>
    <%end if %>

    <%rs.Close %>
    <%conn.Close %>
    <%end if %>

    <div class="container">
        <div class="text-center title">
            <img src="images/test_logo.png" alt="logo" width="150px"/>
            <h1>Web Knowledge Test</h1>
        </div>
        <div class="content">
            <ul class="nav nav-tabs nav-justified" role="tablist">
                <li role="presentation" class="active"><a href="#SignUp" class="bold" role="tab" data-toggle="tab">Sign Up</a></li>
                <li role="presentation"><a href="#SignIn" class="bold" role="tab" data-toggle="tab">SignIn</a></li>
            </ul>
            <div class="tab-content">
                <div role="tabpanel" class="tab-pane active" id="SignUp">
                    <div class="col-md-10 col-md-offset-1">
                        <form onsubmit="validate()" action="index.asp" method="post" id="frmSignup">
                            <div class="form-group">
                                <label for="signupUserName">User Name</label>
                                <input type="text" class="form-control" id="signupUserName" placeholder="Input your name" name="signupUserName" value="<%=(request.form("signupUserName")) %>" onblur="checkUserName(this)" />
                                <span class="help-block" id="UserNameTip"></span>
                            </div>
                            <div class="form-group">
                                <label for="signupKey">Password</label>
                                <input type="password" class="form-control" id="signupKey" placeholder="Input your password" name="signupUserKey" value="<%=(request.form("signupUserKey")) %>" onblur="checkUserKey(this)" />
                                <span class="help-block" id="UserKeyTip"></span>
                            </div>
                            <div class="form-group">
                                <label for="signupKey2">Comfirm</label>
                                <input type="password" class="form-control" id="signupKey2" placeholder="Confirm your password" name="signupUserKey2" value="<%=(request.form("signupUserKey2")) %>" onblur="matchKey(this)" />
                                <span class="help-block" id="MatchKeyTip"></span>
                            </div>
                            <div class="form-group margin-top">
                                <input type="submit" class="btn btn-primary" value="Sign Up" /><br />
                                <span class="help-block" id="NameUsedTip"></span>
                            </div>
                            <div>
                                <input type="hidden" name="state" id="state" value="false" />
                                <input type="hidden" name="signType" value="signup" />
                            </div>
                        </form>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane" id="SignIn">
                    <div class="col-md-10 col-md-offset-1">
                        <form action="index.asp" method="post">
                            <div class="form-group">
                                <label for="signinUserName">User Name</label>
                                <input type="text" class="form-control" id="signinUserName" placeholder="Input your name" name="signinUserName" value="<%=(request.form("signinUserName")) %>" />
                            </div>
                            <div class="form-group">
                                <label for="signinUserKey">Password</label>
                                <input type="password" class="form-control" id="signinUserKey" placeholder="Input your password" name="signinUserKey" value="<%=(request.form("signinUserKey")) %>" />
                            </div>
                            <div class="form-group margin-top">
                                <input type="submit" class="btn btn-primary" value="Sign In" />
                                <span class="help-block" id="signinTip"></span>
                            </div>
                            <div>
                                <input type="hidden" name="signType" value="signin" />
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
