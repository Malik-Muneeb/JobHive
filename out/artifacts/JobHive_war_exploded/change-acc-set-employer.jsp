<%@ page import="entity.Employeer" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DAO.EmployeerDAO" %>
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
		<img src="images/signup-bg.jpeg" style="background-repeat: no-repeat ;background-size: cover;height:auto; position: fixed;left: 0;top: 0;width: 100vw;">
		<div class="" >
			<div class="container">
				<div class="row">
					<div class="col-sm-6 col-sm-offset-3 col-middle slideDown" style="background:rgba(250,250,250,0.65);">
						<div class="inner-wrapper">
							<form class="form-horizontal" action="controller.jsp">
								<div class="text-center"><a href="home.jsp"><img height="140px" width="140" src="images/logo.png"></a></div>
								<div class="form-group text-center"><h3>Update Info</h3></div>
								<div class="container-fluid">
									<%
										EmployeerDAO empDao=new EmployeerDAO();
										String emailId=request.getParameter("emailId");
										Employeer empObj=empDao.getInfo(emailId);


									%>
                                    <input type="hidden" name="emailId" value="<%=emailId%>">
									<div class="col-lg-12">
										<div class="form-group "><input value="<%=empObj.getEmail()%>" disabled type="email" name="email" placeholder="Email address" class="form-control input-lg" required></div>
									</div>

									<div class="col-lg-12">
										<div class="form-group "><input value="<%=empObj.getFirstName()%>" required pattern="[A-Za-z]{0,100}" type="text" name="fname" placeholder="First Name" class="form-control input-lg"></div>
									</div>
									<div class="col-lg-12">
										<div class="form-group "><input value="<%=empObj.getLastName()%>" required pattern="[A-Za-z]{0,100}" type="text" name="lname" placeholder="Last Name" class="form-control input-lg"></div>
									</div>
									
									<div class="col-lg-12">
										<div class="form-group "><input value="<%=empObj.getPassword()%>" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 6 or more characters" type="password" name="pass" placeholder="Password" class="form-control input-lg"></div>
									</div>
									
									<div class="col-lg-12">
										<div class="form-group "><input value="<%=empObj.getContact()%>" type="tel" required pattern="[0-9]{0,100}" name="phone" placeholder="Phone num" class="form-control input-lg"></div>
									</div>
									<div class="col-lg-12">
										<div class="form-group "><input value="<%=empObj.getCity()%>" required pattern="[A-Za-z]{0,100}" type="text" name="city" placeholder="City" class="form-control input-lg"></div>
									</div>
									<div class="col-lg-12">
										<div class="form-group "><input value="<%=empObj.getCompanyName()%>" required pattern="[A-Za-z]{0,100}" type="text" name="cname" placeholder="Company Name" class="form-control input-lg"></div>
									</div>
									<div class="col-lg-12">
										<div class="form-group "><input required disabled value="<%=empObj.getCnic()%>" pattern="[0-9]{5}-[0-9]{7}-[0-9]{1}" title="xxxxx-xxxxxxx-x" type="num" name="cnic" placeholder="CNIC" class="form-control input-lg"></div>
									</div>
									<div class="col-lg-12">
										<div class="form-group ">
											<label class=" " >Where do you want to go to Honeymoon? (Security Question)</label>
											<input type="text" name="sec-ques" value="<%=empObj.getAnswer()%>" required placeholder="Example: Paris" class="form-control input-lg">
										</div>
									</div>
									<div class="col-lg-12 divider form-group"></div>
									<div class="form-group"> <button type="submit"  name="action" value="updateAccSetComp" class="btn btn-primary btn-lg btn-block">Update</button> </div>
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