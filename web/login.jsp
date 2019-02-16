<%--
  Created by IntelliJ IDEA.
  User: Muneeb
  Date: 04-Feb-18
  Time: 3:44 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="entity.*,DAO.*" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/styles.css" rel="stylesheet">
    <link rel="icon" href="images/logo.png">
</head>
<body>
<%!
    boolean isVerify = true;
%>

<%

    if (request.getMethod().equals("POST")) {
        User user = new User();
        user.setUserName(request.getParameter("uname"));
        user.setPassword(request.getParameter("pass"));
        UserDAO userDao = new UserDAO();
        try {
            String role = userDao.validateLogin(user);
            if (role.equals("employee")) {
                if (session.getAttribute("userName") == null) {
                    session.setAttribute("userName", request.getParameter("uname"));
                    session.setAttribute("role", "employee");
                    response.sendRedirect("employee-dashboard.jsp");
                } else {
%>
<script> alert("Another User Logged in. First Logout then Login"); </script>
<meta http-equiv="Refresh" content="0;url=home.jsp">
<%
    }
} else if (role.equals("employeer")) {
    Job jobObj = new Job();
    if (session.getAttribute("userName") == null) {
        if (session.getAttribute("job") != null) {
            jobObj = (Job) session.getAttribute("job");
            jobObj.setEmail(request.getParameter("uname"));
            JobDAO jobDao = new JobDAO();
            jobDao.insertJob(jobObj);
        }
        EmployeerDAO empDao = new EmployeerDAO();
        String companyName = empDao.getCompanyName(request.getParameter("uname"));
        session.setAttribute("userName", companyName);
        session.setAttribute("role", "employeer");
        response.sendRedirect("employer-dashboard.jsp");
    } else {
%>
<script> alert("Another User Logged in. First Logout then Login and Post Your Job");</script>
<meta http-equiv="Refresh" content="0;url=home.jsp">
<%
    }
} else if (role.equalsIgnoreCase("admin")) {
    if (session.getAttribute("userName") == null) {
        session.setAttribute("userName", request.getParameter("uname"));
        session.setAttribute("role", "admin");
        response.sendRedirect("admin-dashboard.jsp");
    } else {
%>
<script> alert("Another User Logged in. First Logout then Login"); </script>
<meta http-equiv="Refresh" content="0;url=home.jsp">
<%
                }

            } else {
                isVerify = false;
                response.sendRedirect("login.jsp");
            }
        } catch (Exception e) {
            response.getWriter();
        }

    }
%>
<div style="position: relative;height: 100vh;overflow: hidden;">
    <img src="images/login-bg.jpeg"
         style="background-repeat: no-repeat ;background-size: cover;height:850px; position: absolute;left: 0;top: 0;width: 100vw;">
    <div class="">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-lg-offset-4 col-middle slideDown" style="background:rgba(250,250,250,0.65);">
                    <div class="inner-wrapper">
                        <form class="form-horizontal" method="POST">
                            <div class="col-sm-1 col-sm-offset-2"><img src="images/logo.png"></div>
                            <div class="form-group"><input type="text" name="uname" placeholder="Username or email"
                                                           class="form-control input-lg"></div>
                            <div class="form-group"><input type="password" name="pass" placeholder="Password"
                                                           class="form-control input-lg"></div>
                            <% if (!isVerify) {
                            %>
                            <label class="form-group alert-danger"> Invalid User or Password</label>
                            <% } %>

                            <div class="form-group">
                                <button type="submit" class="btn btn-primary btn-lg btn-block">Submit</button>
                            </div>
                        </form>
                        <div style="display: inline-block;text-align: center;"><a href="forgot-password.jsp"
                                                                                  style="text-decoration: none;float: left;">Forgot
                            password?</a><span style="float: right;padding-left: 80px;">Need Account?</span><a
                                style="float: right;text-decoration: none;" href="signup.jsp">Signup</a></div>
                    </div>

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
