<%@ page import="entity.Job" %>
<%@ page import="DAO.EmployeerDAO" %>
<%@ page import="java.util.ArrayList" %>
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
            <h2 id="site-title"><a href="home.jsp" style="text-decoration: none;"><span
                    style="color:#46B749;">JOB</span><span style="color:#1565C0;">Hive</span></a></h2>
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
                <div class="btn-group btn-group-lg " id="post-job">
                    <a href="login.jsp" class="btn btn-default " id="login-btn">Login</a>
                    <a href="signup.jsp" class="btn btn-default " id="signup-btn">Sign Up</a>
                </div>
            </div>

        </div>
    </div>
</div>

<div class="container-fluid" style="background-color: #ECEDF0">
    <div class="container">
        <div class="row" id="vid-container-dashboard">
            <div class="col-sm-12" style="padding-top: 50px;"><br></br>
                <h1 style="font-size: 40px;"> Job Details</h1>
            </div>
            <% ArrayList<Job> jobArr=new ArrayList<Job>();
            jobArr=( ArrayList<Job>)session.getAttribute("jobArr");
                Job jobObj=new Job();
                int id=Integer.parseInt(request.getParameter("id"));
                //int jobId=(int)(session.getAttribute("jobId"));
                jobObj=(Job)jobArr.get(id);
            %>
            <div class="col-lg-12"><br></div>
            <div class="col-lg-12 col-sm-12 job-box">
                <div class="col-lg-10">
                    <h2><%=jobObj.getTitle()%></h2>
                    <%EmployeerDAO empDao=new EmployeerDAO();
                    %>
                    <h3 style="color: #337AB7"> <%=empDao.getCompanyName(jobObj.getEmail())%>  <%=jobObj.getLocation()%></h3>
                    <h4><span class="glyphicon glyphicon-calendar"></span> Date Posted: <%=jobObj.getDate()%></h4>
                    <h4><span class="glyphicon glyphicon-usd"></span><%=jobObj.getMinSalary()%>-<%=jobObj.getMaxSalary()%> PKR</h4>
                    <a href="controller.jsp" class="btn btn-primary btn-lg">Apply</a>
                    <br></br>
                </div>
                <div class="col-lg-12 " style="border-bottom: 2px solid lightgrey">
                </div>
                <div class="col-lg-10">
                    <br>
                    <h4><strong>Job Description</strong></h4>
                   <%=jobObj.getDescription()%>
                    <h4><strong>Skills</strong></h4>
                    <%=jobObj.getSkills()%>
                    <br><br>
                    <h4><strong>Full job Details</strong></h4>
                    <h5><strong>Careel Level: </strong><%=jobObj.getCareerLevel()%></h5>
                    <h5><strong>Job Location: </strong><%=jobObj.getLocation()%></h5>
                    <h5><strong>Positions: </strong><%=jobObj.getSeats()%></h5>
                    <h5><strong>Minimum Salary: </strong><%=jobObj.getMinSalary()%></h5>
                    <h5><strong>Minimum Experience: </strong><%=jobObj.getMinExperience()%></h5>
                    <h5><strong>Gender Preference: </strong><%=jobObj.getGenderPrefer()%></h5>
                    <h5><strong>Minimum Qualification: </strong><%=jobObj.getQualification()%></h5>
                    <br></br>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/script.js"></script>
</body>
</html>

