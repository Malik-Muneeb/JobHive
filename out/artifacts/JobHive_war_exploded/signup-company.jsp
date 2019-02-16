<!DOCTYPE html>
<html lang="en">
<%@page import="entity.*,DAO.*" %>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/styles.css" rel="stylesheet">
	<link rel="icon" href="images/logo.png">
</head>
<body>
<%
    if (request.getMethod().equals("POST")) {
        Employeer emp = new Employeer();
        emp.setEmail(request.getParameter("email"));
        emp.setFirstName(request.getParameter("fname"));
        emp.setLastName(request.getParameter("lname"));
        emp.setPassword(request.getParameter("pass"));
        emp.setContact(request.getParameter("phone"));
        emp.setCity(request.getParameter("city"));
        emp.setCompanyName(request.getParameter("cname"));
        emp.setCnic(request.getParameter("cnic"));
        emp.setAnswer(request.getParameter("sec-ques"));
        EmployeerDAO empDao = new EmployeerDAO();
        if (!empDao.insertData(emp) && !request.getParameter("email").equals("admin")) { %>
<script> alert("Signup again....Email already exists. Try another one!");</script>
<% } else {
    Job jobObj=new Job();
    if(session.getAttribute("job")!=null) {
        jobObj = (Job) session.getAttribute("job");
        jobObj.setEmail(request.getParameter("email"));
        JobDAO jobDao=new JobDAO();
        jobDao.insertJob(jobObj);
        response.sendRedirect("signup.jsp");
        }
    }
}
%>
<div style="position: relative;height: auto;overflow: hidden;">
    <img src="images/signup-bg.jpeg"
         style="background-repeat: no-repeat ;background-size: cover;height:auto; position: fixed;left: 0;top: 0;width: 100vw;">
    <div class="">
        <div class="container">
            <div class="row">
                <div class="col-sm-6 col-sm-offset-3 col-middle slideDown" style="background:rgba(250,250,250,0.65);">
                    <div class="inner-wrapper">
                        <form class="form-horizontal" method="POST">
                            <div class="text-center"><img height="140px" width="140" src="images/logo.png"></div>
                            <div class="form-group text-center"><h3>YOU'RE MINUTES AWAY FROM HIRING THE BEST!</h3></div>
                            <div class="container-fluid">
                                <div class="col-lg-12">
                                    <div class="form-group "><input type="email" required  name="email"
                                                                    placeholder="Email address"
                                                                    class="form-control input-lg"></div>
                                </div>

                                <div class="col-lg-12">
                                    <div class="form-group "><input type="text" required pattern="[A-Za-z]{0,100}" name="fname" placeholder="First Name"
                                                                    class="form-control input-lg"></div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group "><input type="text"  required pattern="[A-Za-z]{0,100}" name="lname" placeholder="Last Name"
                                                                    class="form-control input-lg"></div>
                                </div>

                                <div class="col-lg-12">
                                    <div class="form-group "><input type="password" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 6 or more characters" name="pass" placeholder="Password"
                                                                    class="form-control input-lg"></div>
                                </div>

                                <div class="col-lg-12">
                                    <div class="form-group "><input type="tel" required pattern="[0-9]{0,100}" name="phone" placeholder="Phone num"
                                                                    class="form-control input-lg"></div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group "><input type="text" required pattern="[A-Za-z]{0,100}" name="city" placeholder="City"
                                                                    class="form-control input-lg"></div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group "><input type="text" required pattern="[A-Za-z]{0,100}" name="cname" placeholder="Company Name"
                                                                    class="form-control input-lg"></div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group "><input type="num" required pattern="[0-9]{5}-[0-9]{7}-[0-9]{1}" title="xxxxx-xxxxxxx-x" name="cnic" placeholder="CNIC"
                                                                    class="form-control input-lg"></div>
                                </div>
								<div class="col-lg-12">
										<div class="form-group ">
											<label class=" " >Where do you want to go to Honeymoon? (Security Question)</label>
											<input type="text" name="sec-ques" required placeholder="Example: Paris" class="form-control input-lg">
										</div>
									</div>

                                <div class="col-lg-12 divider form-group"></div>
                                <div class="form-group">
                                    <button type="submit" class="btn btn-primary btn-lg btn-block">Registration</button>
                                </div>
                            </div>

                        </form>
                        <div class="col-sm-4"><a href="#" style="text-decoration: none;float: left;">Forgot
                            password?</a>
                        </div>
                        <div class="col-sm-6 col-sm-offset-2">
                            <span>Already have an Account?</span><a style="padding-left:10px;text-decoration: none;"
                                                                    href="login.jsp">login</a></div>
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