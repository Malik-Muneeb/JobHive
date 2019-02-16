<%--
  Created by IntelliJ IDEA.
  User: Muneeb
  Date: 04-Feb-18
  Time: 2:43 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/styles.css" rel="stylesheet">
    <link rel="icon" href="images/logo.png">
    <title>Home</title>
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
                    <a class="btn btn-primary " href="employers.jsp" id="employers-btn">Employers</a>
                </div>
            </div>

            <div class="col-lg-5 col-md-5">

<%if(session.getAttribute("userName")==null)
{%>              <div class="btn-group btn-group-lg " id="post-job">
                    <a href="login.jsp" class="btn btn-default " id="login-btn">Login</a>
                    <a href="signup.jsp" class="btn btn-default " id="signup-btn">Sign Up</a>
                </div>
                <%}else { if(session.getAttribute("role").equals("employee")){%>
                <div class="btn-group btn-group " id="post-job">
                    <a href="employee-dashboard.jsp" class="btn btn-default " id="login-btn"><%=session.getAttribute("userName")%></a>
                    <a href="controller.jsp?action=logout" class="btn btn-default " id="signup-btn">Log Out</a>
                </div>
                <%} else {%>
                <div class="btn-group btn-group " id="post-job">
                    <a href="employer-dashboard.jsp" class="btn btn-default " id="login-btn"><%=session.getAttribute("userName")%></a>
                    <a href="controller.jsp?action=logout" class="btn btn-default " id="signup-btn">Log Out</a>
                </div>
                <%}}%>
            </div>

        </div>
    </div>
</div>

<div class="container-fluid">
    <div class="row" id="vid-container" style="background: url('images/login-bg.jpeg');">
        <div class="col-lg-6  text-center">
            <h1 id="vid-container-h"><b>One million success stories.Start yours today.</b></h1>
        </div>
        <div class="col-lg-12" id="search-job-fields">
            <form class="form-horizontal" action="controller.jsp">
                <div class="col-lg-4 col-lg-offset-1">
                    <input type="text" name="jobTitle" placeholder="Job Title, Skill or Company"
                           class="form-control input-lg">
                </div>
                <div class="col-lg-2">
                    <select class="form-control input-lg " name="search-city">
                        <option>City</option>
                        <option>Lahore</option>
                        <option>Karachi</option>
                        <option>Islamabad</option>
                        <option>Peshawar</option>
                        <option>Sargodha</option>
                        <option>Quetta</option>
                        <option>Gujranwala</option>
                        <option>Faislabad</option>
                    </select>
                </div>
                <div class="col-lg-2">
                    <select class="form-control input-lg dropdown" name="search-min-salary">
                        <option>Minimum Salary</option>
                        <option>15000</option>
                        <option>20000</option>
                        <option>25000</option>
                        <option>35000</option>
                        <option>50000</option>
                        <option>65000</option>
                        <option>80000</option>
                        <option>100000+</option>
                    </select>
                </div>
                <div class="col-lg-2">
                    <button type="submit"  name="action" value="searchJob" class="btn btn-primary btn-lg btn-block">Search</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/script.js"></script>
</body>
</html>
