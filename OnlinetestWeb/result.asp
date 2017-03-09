<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Result-Web Knowledge Test</title>
    <meta charset="utf-8" />
    <script type="text/javascript">
        function sbmt(str) {
            document.getElementById("state").value = str
            document.getElementsByName("frm")[0].submit();
        }
    </script>
    <link href="bootstrap/bootstrap.css" rel="stylesheet" />
    <link href="CSS/result.css" rel="stylesheet" />
</head>
<body>
    <div class="container">
        <div class="row text-left head">
            <div class="col-md-1">
                <img src="images/test_logo.png" width="140px" />
            </div>
            <h1 class="col-md-9 col-md-offset-1">Web Knowledge Test</h1>
        </div>
        <div class="col-md-10 col-md-offset-1 text-center">
            <h2>Test Result</h2>
            <div class="row">
                <div class="table-responsive col-md-4 col-md-offset-4">
                    <table class="table table-hover user">
                        <tr>
                            <td class="bold">Your Name:</td>
                            <td><%=request.form("userName")%></td>
                        </tr>
                        <tr>
                            <td class="bold">Your Score:</td>
                            <td><%=request.form("userScore")%></td>
                        </tr>
                        <tr>
                            <td class="bold">Begin Time:</td>
                            <td><%=request.Form("beginTime") %></td>
                        </tr>
                        <tr>
                            <td class="bold">End Time:</td>
                            <td><%=request.Form("endTime") %></td>
                        </tr>
                        <tr>
                            <td class="bold">Used Time:</td>
                            <td><%=request.Form("useTime") %></td>
                        </tr>
                    </table>
                </div>
            </div>
            <form name="frm" action="result.asp" method="post">
                <div>
                    <input type="hidden" name="state" id="state" value="" />
                    <input type="hidden" name="userName" value="<%=request.form("userName")%>" />
                    <input type="hidden" name="userScore" value="<%=request.form("userScore")%>" />
                    <input type="hidden" name="beginTime" value="<%=request.form("beginTime")%>" />
                    <input type="hidden" name="endTime" value="<%=request.form("endTime")%>" />
                    <input type="hidden" name="useTime" value="<%=request.form("useTime")%>" />
                </div>

                <%set conn=Server.CreateObject("ADODB.Connection")
        conn.Provider="Microsoft.Jet.OLEDB.4.0"
        conn.Open(Server.Mappath("DataBase/score.mdb"))%>

                <%if request.form("state") = "" then%>
                <input type="button" class="btn btn-primary" onclick="sbmt('view')" value="View All Users" />
                <%userName = request.form("userName")
            userScore = request.form("userScore")
            beginTime = request.Form("beginTime")
            endTime = request.Form("endTime")
            useTime = request.Form("useTime")%>
                <%sql = "INSERT INTO score (s_name, s_score, beginTime, endTime, used) VALUES('" & userName
            sql = sql & "','" & userScore
            sql = sql & "','" & beginTime
            sql = sql & "','" & endTime
            sql = sql & "','" & useTime
            sql = sql & "')"
            conn.Execute sql
        else
            sql = "SELECT * FROM score"
            if request.form("state") = "sort" then sql = sql & " ORDER BY s_score DESC" end if
            set rs = Server.CreateObject("ADODB.recordset")
            rs.Open sql, conn%>

                <div class="row table-responsive col-md-10 col-md-offset-1 viewall">
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Score</th>
                                <th>Begin Time</th>
                                <th>End Time</th>
                                <th>Used Time</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%do until rs.EOF
                    response.Write("<tr>")
                        flag = 0
                        for each x in rs.Fields
                            if flag = 0 then
                                flag = 1
                            else
                                response.Write("<td>" & x.value & "</td>")
                            end if
                        next
                    response.Write("</tr>")
                    rs.MoveNext
                loop%>
                        </tbody>
                    </table>
                </div>

                <%rs.close%>
                <input type="button" class="btn btn-primary" onclick="sbmt('sort')" value="Sort The Score" />
                <%end if%>
                <%conn.close%>
            </form>
        </div>
    </div>
</body>
</html>
