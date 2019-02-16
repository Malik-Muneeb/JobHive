<%@ page import="DAO.EmployeeDAO" %>
<%@ page import="DAO.EmployeerDAO" %>
<%@ page import="entity.Employee" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="entity.Employeer" %>
<html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/styles.css" rel="stylesheet">
    <link rel="icon" href="images/logo.png">
    <title>Admin - Profile </title>
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
            <form class="navbar-form navbar-left " action="">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search" name="search">
                    <div class="input-group-btn">
                        <button class="btn btn-default" type="submit">
                            <i class="glyphicon glyphicon-search"></i>
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<div class="container-fluid">
    <div class="container">
        <div class="row" id="vid-container-dashboard">
            <div class="col-sm-12" style="padding-top: 50px;"><br></br>
                <h1 style="font-size: 40px;"> Admin Dashboard</h1>
            </div>
            <div class="col-sm-12 ">
                <h2>All Users</h2>
                <%
                    EmployeeDAO empDao = new EmployeeDAO();
                    EmployeerDAO emprDao = new EmployeerDAO();
                    ArrayList<Employee> empArr = new ArrayList<Employee>();
                    ArrayList<Employeer> emprArr = new ArrayList<Employeer>();
                    empArr = empDao.fetchEmployee();
                    emprArr = emprDao.fetchEmployeer();
                %>
            </div>
            <div class="col-sm-12 ">
                <div class="input-group col-lg-4 col-lg-offset-8">
                    <input type="text" class="form-control" placeholder="Search" name="search">
                    <div class="input-group-btn">
                        <button class="btn btn-default" type="submit">
                            <i class="glyphicon glyphicon-search"></i>
                        </button>
                    </div>
                </div>
            </div>
            <div class="col-sm-12 ">
                <br>
                <table class="table table-striped table-bordered">
                    <thead style="background: #1565C0;color: white">
                    <tr>
                        <th>#</th>
                        <th>Name</th>
                        <th>Account Type</th>
                        <th colspan="2" style="text-align:center;">Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    <% int index = 1;
                        for (int i = 0; i < empArr.size(); i++, index++) {
                            Employee empObj = new Employee();
                            empObj = null;
                            empObj = (Employee) empArr.get(i);
                    %>
                    <tr>
                        <th scope="row"><%=index%>
                        </th>
                        <td><%=empObj.getFirstName()%>
                        </td>
                        <td>Employee</td>
                        <td><a href="controller.jsp?action=viewEmployee&name=<%=empObj.getFirstName()%>">View</a></td>
                        <td><a href="controller.jsp?action=deleteEmployee&name=<%=empObj.getFirstName()%>">Delete</a></td>
                    </tr>
                    <%
                        }
                        for (int i = 0; i < emprArr.size(); i++, index++) {
                            Employeer emprObj = new Employeer();
                            emprObj = null;
                            emprObj = (Employeer) emprArr.get(i);
                    %>
                    <tr>
                        <th scope="row"><%=index%>
                        </th>
                        <td><%=emprObj.getEmail()%>
                        </td>
                        <td>Employeer</td>
                        <td><a href="controller.jsp?action=viewEmployeer&name=<%=emprObj.getEmail()%>">View</a></td>
                        <td><a href="controller.jsp?action=deleteEmployeer&name=<%=emprObj.getEmail()%>">Delete</a></td>
                    </tr>
                    <%}%>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/script.js"></script>
</body>

</html>