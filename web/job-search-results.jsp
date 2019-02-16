<%@ page import="java.util.ArrayList" %>
<%@ page import="entity.Job" %>
<%@ page import="DAO.JobDAO" %>
<%@ page import="DAO.EmployeerDAO" %>
<!DOCTYPE html>
<html lang="en">

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

<div class="container-fluid navbar navbar-fixed-top" id="header"
     style="background-color: white;box-shadow: 0px 5px 8px #888888;">
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

<div class="container-fluid" style="background-color: #ECEDF0">
    <div class="container">
        <div class="row" id="vid-container-dashboard">
            <div class="col-sm-12" style="padding-top: 50px;"><br></br>
                <h1 style="font-size: 40px;"> Search Results</h1>
            </div>
            <div class="col-sm-12 ">
                <h3>These jobs matched your search.</h3>
            </div>
            <div class="col-lg-12" id="search-job-fields">
                <form class="form-horizontal" action="controller.jsp">
                    <div class="col-lg-4 ">
                        <input type="text" name="jobTitle" value="<%=session.getAttribute("title")%>" placeholder="Job Title, Skill or Company"  class="form-control input-lg">
                    </div>
                    <div class="col-lg-2">
                        <select class="form-control input-lg " name="search-city">
                            <option><%=session.getAttribute("city")%></option>
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
                    <div class="col-lg-3">
                        <select class="form-control input-lg dropdown" name="search-min-salary">
                            <option><%=session.getAttribute("minSal")%></option>
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
                    <div class="col-lg-3">
                        <select class="form-control input-lg dropdown" name="search-min-exp">
                            <option>Minimum Experience</option>
                            <option>Fresh</option>
                            <option>Less than 1 year</option>
                            <option>1 Year</option>
                            <option>2 Years</option>
                            <option>3 Years</option>
                            <option>4 Years</option>
                            <option>5 Years</option>
                            <option>6 Years</option>
                            <option>7 Years</option>
                            <option>8 Years</option>
                            <option>More than 8 years</option>
                        </select>
                    </div>
                    <div class="col-lg-2">
                        <br>
                        <button type="submit" name="action" value="searchJob" class="btn btn-primary btn-lg btn-block">Search</button>
                        </br>
                    </div>
                </form>

            </div>

            <% if (session.getAttribute("jobArr") != null) {
                ArrayList<Job> jobArr = new ArrayList<Job>();
                jobArr = (ArrayList<Job>) session.getAttribute("jobArr");
                EmployeerDAO empDao = new EmployeerDAO();

                for (int i = 0; i < jobArr.size(); i++) {
                    Job jobObj = new Job();
                    jobObj=null;
                    jobObj = (Job)jobArr.get(i);
                    out.print(i);
            %>
            <div class="col-lg-12 col-sm-12 job-box">
                <div class="col-lg-10">
                    <h3 style="color: #337AB7"><%=jobObj.getTitle()%>
                    </h3>
                    <h4><%=empDao.getCompanyName(jobObj.getEmail())%>  <%=jobObj.getLocation()%>
                    </h4>
                    <h5><%=jobObj.getDate()%>
                    </h5>
                    <h5><%=jobObj.getMaxExperience()%>
                    </h5>
                </div>
                <div class="col-lg-2">
                    <br>
                    <br>
                    <a href="controller.jsp?action=viewJob&id=<%=i%>" id="<%=i%>" class="btn btn-primary btn-lg"><span class="glyphicon glyphicon-eye-open"></span>
                        View</a>
                    <h5><%=jobObj.getMinSalary() + "-" + jobObj.getMaxSalary()%>
                    </h5>
                </div>
            </div>
            <div class="col-lg-12">
                <br>
            </div>
            <%
                    }
                }
            %>
        </div>
    </div>
</div>
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/script.js"></script>
</body>
</html>
