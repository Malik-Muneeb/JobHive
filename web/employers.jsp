<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/styles.css" rel="stylesheet">
    <link rel="icon" href="images/logo.png">
    <title>Employers</title>
</head>
<body>
<div class="container-fluid" id="header">
    <div class="row">
        <div class="col-lg-1 col-sm-3 col-md-1 col-xs-3" id="logo">
            <a href="home.jsp">
                <img src="images/logo.png" height="100" width="100" alt="logo">
            </a>

        </div>
        <div class="col-lg-2 col-md-2 col-sm-6 col-xs-0" id="site-title-div">
            <h2 id="site-title"><span style="color:#46B749;">JOB</span><span style="color:#1565C0;">Hive</span></h2>
        </div>
        <div class="col-lg-3 col-lg-offset-1 col-md-0 col-xs-0" id="header-contact-div">
            <h3 id="contact"><span class="glyphicon glyphicon-earphone"></span>0900-78601(TELEFUN)</h3>
        </div>
        <div class="col-lg-5 col-xs-9 col-md-9" id="menu">
            <div class="col-lg-7 col-md-7">
                <div class="btn-group btn-group-lg">
                    <a class="btn btn-success " href="post-job.jsp" id="post-job-btn">POST A JOB</a>
                    <a class="btn btn-primary " href="employers.jsp" id="employers-btn">Professionals</a>
                </div>
            </div>

            <div class="col-lg-5 col-md-5">
                <%if (session.getAttribute("userName") == null) {%>
                <div class="btn-group btn-group-lg " id="post-job">
                    <a href="login.jsp" class="btn btn-default " id="login-btn">Login</a>
                    <a href="signup-company.jsp" class="btn btn-default " id="signup-btn">Sign Up</a>
                </div>
                <%
                } else {
                    if (session.getAttribute("role").equals("employee")) {
                %>
                <div class="btn-group btn-group " id="post-job">
                    <a href="employee-dashboard.jsp" class="btn btn-default "
                       id="login-btn"><%=session.getAttribute("userName")%>
                    </a>
                    <a href="controller.jsp?action=logout" class="btn btn-default " id="signup-btn">Log Out</a>
                </div>
                <%} else {%>
                <div class="btn-group btn-group " id="post-job">
                    <a href="employer-dashboard.jsp" class="btn btn-default "
                       id="login-btn"><%=session.getAttribute("userName")%>
                    </a>
                    <a href="controller.jsp?action=logout" class="btn btn-default " id="signup-btn">Log Out</a>
                </div>
                <%
                        }
                    }
                %>

            </div>
        </div>
    </div>
</div>

<div class="container-fluid">
    <div class="row" id="vid-container"
         style="background: url('images/employers-bg.jpg');background-size: cover;background-repeat: no-repeat;">
        <div class="col-lg-6  text-center">
            <h1 class="first-container-content" id="vid-container-h"><b>Hire the best, faster.</b></h1>
        </div>
        <div class="col-lg-4 col-lg-offset-4">
            <h3 class="first-container-content">Post your first job in minutes!</h3>
        </div>
        <div class="col-lg-12 text-center" id="emp-btn-col">
            <a href="post-job.jsp" class="btn btn-success btn-circle btn-xl "><br><span
                    class="glyphicon glyphicon-list-alt glyphicon-lg"></span><br>Post a job
            </a>
        </div>
        <div class="col-lg-6 col-lg-offset-3 text-center">
            <h3 class="first-container-content"><b>Need Assistance?</b></h3>
        </div>
        <div class="col-lg-12 text-center" id="contact">
            <h1 class="first-container-content"><b><span class="glyphicon glyphicon-earphone"></span>0900-78601(TELEFUN)</b>
            </h1>
        </div>
    </div>
</div>
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/script.js"></script>
</body>
</html>

