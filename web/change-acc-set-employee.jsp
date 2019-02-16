<%@ page import="DAO.EmployeeDAO" %>
<%@ page import="entity.Employee" %>
<!DOCTYPE html>
<html lang="en" >

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/styles.css" rel="stylesheet">
    <link rel="icon" href="images/logo.png">
</head>
<body >
	<div  style="position: relative;height: auto;overflow: hidden;">
		<img src="images/signup-bg.jpeg" style="background-repeat: no-repeat ;background-size: cover;min-height:850px; position: fixed;left: 0;top: 0;width: 100vw;">
		<div class="" >
			<div class="container">
				<div class="row">
					<div class="col-lg-6 col-lg-offset-3 col-middle slideDown" style="background:rgba(250,250,250,0.65);">
						<div class="inner-wrapper">
							<form class="form-horizontal" action="controller.jsp" method="post">
								<div class="text-center"><a href="home.jsp"><img height="140px" width="140" src="images/logo.png"></a></div>
								<div class="form-group text-center"><h2>Update Account</h2></div>
								<div class="container-fluid">
									<%
										EmployeeDAO empDao=new EmployeeDAO();
										String userId=request.getParameter("userId");
										Employee empObj=empDao.getInfo(userId);


									%>
									<input type="hidden" name="userId" value="<%=userId%>">

									<div class="col-lg-12">
										<div class="form-group "><input disabled value="<%=empObj.getEmail()%>" type="email" name="email" placeholder="Email address" class="form-control input-lg"></div>
									</div>

									<div class="col-lg-5">
										<div class="form-group "><input disabled type="text" value="<%=empObj.getFirstName()%>"required pattern="[A-Za-z]{0,100}" name="fname" placeholder="First Name" class="form-control input-lg"></div>
									</div><div class="col-lg-1"></div>
									<div class="col-lg-5 col-lg-offset-1">
										<div class="form-group "><input type="text" value="<%=empObj.getLastName()%>" required pattern="[A-Za-z]{0,100}" name="lname" placeholder="Last Name" class="form-control input-lg"></div>
									</div>
									
									<div class="col-lg-5">
										<div class="form-group "><input type="password" value="<%=empObj.getPassword()%>" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 6 or more characters" name="pass" placeholder="Password" class="form-control input-lg"></div>
									</div>
									<div class="col-lg-5 col-lg-offset-2">
										<div class="form-group "><input  disabled type="date" value="<%=empObj.getDob()%>"  name="dob" class="form-control input-lg"></div>
									</div>
									<div class="col-lg-5">
										<div class="form-group "><input type="tel" value="<%=empObj.getContact()%>" required pattern="[0-9]{0,100}" name="phone" placeholder="Phone num" class="form-control input-lg"></div>
									</div>
									<div class="col-lg-5 col-lg-offset-2">
										<div class="form-group "><input type="text" value="<%=empObj.getNationality()%>" required pattern="[A-Za-z]{0,100}" name="nationality" placeholder="Nationality" class="form-control input-lg"></div>
									</div>
									
									<div class="col-lg-6 ">
										<select class="form-control input-lg form-group" disabled name="gender" value="Gender" style="width: 95%">
											<option class=""><%=empObj.getGender()%></option>
											<option class="">Female</option>
											<option class="">Other</option>
										</select>
									</div>
									<div class="col-lg-12">
										<div class="form-group ">
											<label class=" " >Where do you want to go to Honeymoon? (Security Question)</label>
											<input type="text" value="<%=empObj.getAnswer()%>" name="sec-ques" required pattern="[A-Za-z]{0,100}" placeholder="Example: Paris" class="form-control input-lg">
										</div>
									</div>
									<div class="col-lg-6 divider form-group"></div>
									<div class="form-group"> <button type="submit"  name="action" value="updateAccSetEmp" class="btn btn-primary btn-lg btn-block">Update</button> </div>
								</div>
								  
							</form>
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