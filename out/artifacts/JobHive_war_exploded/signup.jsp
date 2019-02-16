<%--
  Created by IntelliJ IDEA.
  User: Muneeb
  Date: 04-Feb-18
  Time: 2:45 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="entity.*, DAO.*" %>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/styles.css" rel="stylesheet">
	<link rel="icon" href="images/logo.png">
</head>
<body >
<%
    if(request.getMethod().equals("POST")) {
        Employee emp = new Employee();
        emp.setEmail(request.getParameter("email"));
        emp.setFirstName(request.getParameter("fname"));
        emp.setLastName(request.getParameter("lname"));
        emp.setPassword(request.getParameter("pass"));
        emp.setDob(request.getParameter("dob"));
        emp.setContact(request.getParameter("phone"));
        emp.setNationality(request.getParameter("nationality"));
        emp.setGender(request.getParameter("gender"));
        emp.setAnswer(request.getParameter("sec-ques"));
        EmployeeDAO empDao = new EmployeeDAO();
        if(!empDao.insertData(emp) && !request.getParameter("fname").equals("admin"))
        { %> <script> alert("Signup again....Username already exists. Try another one!");</script>
        <% }
        else
            response.sendRedirect("login.jsp");
    }
%>
	<div  style="position: relative;height: auto;overflow: hidden;">
		<img src="images/signup-bg.jpeg" style="background-repeat: no-repeat ;background-size: cover;min-height:850px; position: fixed;left: 0;top: 0;width: 100vw;">
		<div class="" >
			<div class="container">
				<div class="row">
					<div class="col-lg-6 col-lg-offset-3 col-middle slideDown" style="background:rgba(250,250,250,0.65);">
						<div class="inner-wrapper">
							<form class="form-horizontal" method="post">
								<div class="text-center"><img height="140px" width="140" src="images/logo.png"></div>
								<div class="form-group text-center"><h2>Sign Up</h2></div>
								<div class="container-fluid">
									<div class="col-lg-12">
										<div class="form-group "><input type="email" name="email" placeholder="Email address" required class="form-control input-lg"></div>
									</div>

									<div class="col-lg-5">
										<div class="form-group "><input type="text" required pattern="[A-Za-z]{0,100}" id="userName" name="fname" placeholder="First Name" required class="form-control input-lg"></div>
									</div><div class="col-lg-1"></div>
									<div class="col-lg-5 col-lg-offset-1">
										<div class="form-group "><input type="text" required pattern="[A-Za-z]{0,100}"  name="lname" placeholder="Last Name" class="form-control input-lg"></div>
									</div>
									
									<div class="col-lg-5">
										<div class="form-group "><input type="password" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 6 or more characters" name="pass" placeholder="Password" required class="form-control input-lg"></div>
									</div>
									<div class="col-lg-5 col-lg-offset-2">
										<div class="form-group "><input type="date" name="dob" required class="form-control input-lg"></div>
									</div>
									<div class="col-lg-5">
										<div class="form-group "><input type="tel" required pattern="[0-9]{0,100}" name="phone" placeholder="Phone num" required class="form-control input-lg"></div>
									</div>
									<div class="col-lg-5 col-lg-offset-2">
										<div class="form-group "><input type="text" required pattern="[A-Za-z]{0,100}" name="nationality" placeholder="Nationality" required class="form-control input-lg"></div>
									</div>
									
									<div class="col-lg-6 ">
										<select class="form-control input-lg form-group" name="gender">
											<option class="">Male</option>
											<option class="">Female</option>
											<option class="">Other</option>
										</select>
									</div>
									<div class="col-lg-5"></div>									
									<div class="col-lg-12">
										<div class="form-group ">
											<label class=" " >Where do you want to go to Honeymoon? (Security Question)</label>
											<input type="text" name="sec-ques" required pattern="[A-Za-z]{0,100}" placeholder="Example: Paris" class="form-control input-lg">
										</div>
									</div>
									<div class="col-lg-6 divider form-group"></div>
									<div class="form-group"> <button type="submit" class="btn btn-primary btn-lg btn-block">Submit</button> </div>
								</div>
								  
							</form>
							<div class="col-sm-6 col-sm-offset-2">
							<span >Already have an Account?</span><a style="padding-left:10px;text-decoration: none;" href="login.jsp" >login</a></div>
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