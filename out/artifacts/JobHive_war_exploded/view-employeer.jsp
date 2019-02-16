<%@ page import="entity.Job" %>
<%@ page import="DAO.EmployeerDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="entity.Employee" %>
<%@ page import="DAO.EmployeeDAO" %>
<%@ page import="entity.Employeer" %>
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

<div class="navbar navbar-fixed-top navbar-default " style="background-color: #b7e296;">
    <div class="container ">
        <a href="home.jsp" class="navbar-brand" id="site-title-dashboard">
            <span style="color:#46B749;">JOB</span><span style="color:#1565C0;">Hive</span>
        </a>
        <button class="navbar-toggle" data-toggle="collapse" data-target="#navHeaderCollapse"
        ">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        </button>
        <div class="collapse navbar-collapse " id="navHeaderCollapse">
            <ul class="nav navbar-nav navbar-right">
                <li class="active"><a href="admin-dashboard.jsp">Profile </a></li>
                <li><a href="notifications.jsp">Notifications </a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"> Settings<b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="change-pass-admin.jsp">Change Password </a></li>
                    </ul>
                </li>
                <li><a href="controller.jsp?action=logout">Log Out </a></li>
            </ul>
        </div>
    </div>
</div>
<div class="container-fluid" style="background-color: #ECEDF0">
    <div class="container">
        <div class="row" id="vid-container-dashboard">
            <div class="col-sm-12" style="padding-top: 50px;"><br></br>
                <h1 style="font-size: 40px;"> Employeer Details</h1>
            </div>
            <%
                String email=request.getParameter("email");
                Employeer empObj=new Employeer();
                empObj= new EmployeerDAO().getInfo(email);
            %>
            <div class="col-lg-12"><br></div>
            <div class="col-lg-12 col-sm-12 job-box">

                <div class="col-lg-10">
                    <br>
                    <h4><strong>Email (User Name)</strong></h4>
                    <%=empObj.getEmail()%>
                    <h4><strong>First Name </strong></h4>
                    <%=empObj.getFirstName()%>
                    <br><br>
                    <h4><strong>Full Employeer Details</strong></h4>
                    <h5><strong>Last Name: </strong><%=empObj.getLastName()%>
                    </h5>
                    <h5><strong>Password: </strong><%=empObj.getPassword()%>
                    </h5>
                    <h5><strong>Contact: </strong><%=empObj.getContact()%>
                    </h5>
                    <h5><strong>City: </strong><%=empObj.getCity()%>
                    </h5>
                    <h5><strong>Company Name: </strong><%=empObj.getCompanyName()%>
                    </h5>
                    <h5><strong>CNIC: </strong><%=empObj.getCnic()%>
                    </h5>
                    <h5><strong>Security Answer: </strong><%=empObj.getAnswer()%>
                    </h5>
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

