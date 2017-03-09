<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <meta charset="utf-8" />
    <script src="script/onlinetest.js"></script>
    <link href="bootstrap/bootstrap.css" rel="stylesheet" />
    <link href="CSS/onlinetest.css" rel="stylesheet" />
</head>
<body>
    <div class="col-md-10 col-md-offset-1 frame">
        <a href="index.asp">
            <div class="row head">
                <div class="col-md-2">
                    <img src="images/test_logo.png" width="180px" />
                </div>
                <h1 class="col-md-8 col-md-offset-0">Web Knowledge Test</h1>
            </div>
        </a>
        <hr />
        <div class="row">
            <div class="side">
                <div class="side-block greeting text-left">
                    <p id="greet">Good Morning</p>
                    <p id="userName"><%response.write(request.form("UserName"))%></p>
                </div>
                <div class="side-block time text-left">
                    <p>Time used: <span id="usedTime"></span></p>
                    <p>Time left: <span id="leftTime"></span></p>
                    <p>Current Time: <span id="curTime"></span></p>
                    <script type="text/javascript">
                        dateBegin = new Date();
                        clock();
                        window.setInterval(clock, 1000);
                    </script>
                </div>
            </div>
            <div class="col-md-10 col-md-offset-2">
                <div class="lead">
                    <p>You have <strong>15min</strong> to finish the <strong>6</strong> questions.</p>
                </div>
                <form onsubmit="validate()" onreset="reset()" action="result.asp" method="post">
                    <fieldset>
                        <legend class="bold">HTML</legend>
                        <ol start="1">
                            <li>
                                <div class="question">
                                    <p class="bold">If the background image is smaller than the screen, what will happen?</p>
                                    <div class="radio">
                                        <label>
                                            <input type="radio" name="ques1" id="q" value="A" />(A) It will be stretched</label>
                                    </div>
                                    <div class="radio">
                                        <label>
                                            <input type="radio" name="ques1" id="q" value="B" />(B) It will be repeated</label>
                                    </div>
                                    <div class="radio">
                                        <label>
                                            <input type="radio" name="ques1" id="q" value="C" />(C) It will leave a blank space at the bottom of your page</label>
                                    </div>
                                    <div class="radio">
                                        <label>
                                            <input type="radio" name="ques1" id="q" value="D" />(D) It will be placed on the left top left corner</label>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="question">
                                    <p class="bold">What HTML elements are not suggeseted to be used in the latest standard of HTML?</p>
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" name="ques2" />(A) &lt;abbr&gt;</label>
                                    </div>
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" name="ques2" />(B) &lt;font&gt;</label>
                                    </div>
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" name="ques2" />(C) &lt;center&gt;</label>
                                    </div>
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" name="ques2" />(D) &lt;article&gt;</label>
                                    </div>
                                </div>
                            </li>
                        </ol>
                    </fieldset>
                    <fieldset>
                        <legend class="bold">CSS</legend>
                        <ol start="3">
                            <li>
                                <div class="question">
                                    <p class="bold">How do you display hyperlinks without an underline?</p>
                                    <div class="radio">
                                        <label>
                                            <input type="radio" name="ques3" value="A" />(A) a {text-decoration:no-underline;}</label>
                                    </div>
                                    <div class="radio">
                                        <label>
                                            <input type="radio" name="ques3" value="B" />(B) a {decoration:no-underline;}</label>
                                    </div>
                                    <div class="radio">
                                        <label>
                                            <input type="radio" name="ques3" value="C" />(C) a {text-decoration:none;}</label>
                                    </div>
                                    <div class="radio">
                                        <label>
                                            <input type="radio" name="ques3" value="D" />(D) a {underline:none;}</label>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="question">
                                    <p class="bold">What are the correct forms to set the size of text in CSS?</p>
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" name="ques4" value="A" />(A) text-size: 90%;</label>
                                    </div>
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" name="ques4" value="B" />(B) text-size: 1.2em;</label>
                                    </div>
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" name="ques4" value="C" />(C) text-size: 1.1cm;</label>
                                    </div>
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" name="ques4" value="D" />(D) text-size: samll;</label>
                                    </div>
                                </div>
                            </li>
                        </ol>
                    </fieldset>
                    <fieldset>
                        <legend class="bold">JavaScript</legend>
                        <ol start="5">
                            <li>
                                <div class="question">
                                    <p class="bold">Which of the following function of String object extracts a section of a string and returns a new string?</p>
                                    <div class="radio">
                                        <label>
                                            <input type="radio" name="ques5" value="A" />(A) slice()</label>
                                    </div>
                                    <div class="radio">
                                        <label>
                                            <input type="radio" name="ques5" value="B" />(B) split</label>
                                    </div>
                                    <div class="radio">
                                        <label>
                                            <input type="radio" name="ques5" value="C" />(C) replace</label>
                                    </div>
                                    <div class="radio">
                                        <label>
                                            <input type="radio" name="ques5" value="D" />(D) search</label>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="question">
                                    <p class="bold">What are JavaScript datatypes?</p>
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" name="ques6" value="A" />(A) Null</label>
                                    </div>
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" name="ques6" value="B" />(B) Object</label>
                                    </div>
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" name="ques6" value="C" />(C) int</label>
                                    </div>
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" name="ques6" value="D" />(D) Undefined
                                        </label>
                                    </div>
                                </div>
                            </li>
                        </ol>
                    </fieldset>
                    <div class="text-center">
                        <input class="btn btn-primary button-left" type="reset" value="Reset" />
                        <input class="btn btn-primary button-right" type="submit" value="Submit" />
                    </div>
                    <div>
                        <input type="hidden" name="userName" value="<%=request.form("UserName")%>" />
                        <input type="hidden" name="userScore" value="ERROR" />
                        <input type="hidden" name="beginTime" value="ERROR" />
                        <input type="hidden" name="endTime" value="ERROR" />
                        <input type="hidden" name="useTime" value="ERROR" />
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
