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
		<img src="images/post-job.jpeg" style="background-repeat: no-repeat ;background-size: cover;height:auto; position: fixed;left: 0;top: 0;width: 100vw;">
		<div class="" >
			<div class="container">
				<div class="row ">
					<div class="col-lg-12 text-center">
						<h1>POST YOUR FIRST JOB IN MINUTES!</h1>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-8 col-sm-offset-2">
						<div class="inner-wrapper" id="post-job-form">
							<form class="form-horizontal" action="controller.jsp">
								<div class="container-fluid">
									<div class="col-lg-12">
										<div class="form-group "><input type="text"  required name="jobTitle" placeholder="Job Title" class="form-control input-lg"></div>
									</div>

									<div class="col-lg-12">
										<div class="form-group "><textarea  required name="description" placeholder="Job Description" class="form-control input-lg" rows="5"></textarea></div>
									</div>
									<div class="col-lg-12">
										<div class="form-group "><input type="text"  title="Example:PHP,HTML,CSS..." required pattern="^[0-9a-zA-z]+(,[0-9a-zA-z]+){0,11}$" name="skills" placeholder="Skills Reqd. Example:PHP,HTML,CSS..." class="form-control input-lg"></div>
									</div>

									<div class="col-lg-6">
										<div class="form-group ">
											<select class="form-control input-lg" name="careerLevel">
											<option>Choose career level</option>
											<option>Intern/Student</option>
											<option>Entry level</option>
											<option>Experienced Professional</option>
											<option>Department Head</option>
											<option>GM/ CEO/ Country head/ President</option>
										</select>
									</div>
									</div>
									<div class="col-lg-6">
										<div class="form-group ">
											<select class="form-control input-lg" name="seats">
											<option>Available Seats</option>
											<option>1-5</option>
											<option>6-10</option>
											<option>11-15</option>
											<option>15-20</option>
											<option>21+</option>
										</select>
									</div>
									</div>

									<div class="col-lg-12">
										<div class="form-group ">
											<select class="form-control input-lg " name="job-loc">
												<option>Job Location</option>
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
									</div>
									<div class="col-lg-12">
										<div class="form-group ">
											<select class="form-control input-lg" name="qualification">
											<option>Minimum Qualification</option>
											<option>Matric/O level</option>
											<option>Inter/A levels</option>
											<option>Bachelors</option>
											<option>Masters</option>
											<option>Phd</option>
											<option>Diploma/Short Course</option>
										</select>
									</div>
									</div>
									<div class="col-lg-6">
										<div class="form-group ">
											<select class="form-control input-lg" name="min-exp">
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
									</div>
									<div class="col-lg-6">
										<div class="form-group ">
											<select class="form-control input-lg" name="max-exp">
												<option>Maximum Experience</option>
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
									</div>
									<div class="col-lg-6">
										<div class="form-group ">
											<select class="form-control input-lg" name="min-salary">
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
									</div>
									<div class="col-lg-6">
										<div class="form-group ">
											<select class="form-control input-lg" name="max-salary">
												<option>Maximum Salary</option>
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
									</div>
									<div class="col-lg-8">
										<div class="form-group "><label  class="control-label input-lg">Should the salary be visible in your job post?</label></div>
									</div>
									<div class="col-lg-1">
										<div class="">
      										<label  class="input-lg pull-right control-label">Yes</label>
    									</div>
									</div>
									<div class="col-lg-1">
										<input class="form-control input-md" type="radio" name="optradio" value="yes">
									</div>
									<div class="col-lg-1">
										<div class="">
      										<label class="control-label input-lg">No</label>
    									</div>
									</div>
									<div class="col-lg-1">
										<input class="form-control" type="radio" name="optradio" value="no">
									</div>
									<div class="col-lg-12">
										<label  class="control-label form-group input-lg">Gender Preference</label>
										<div class="form-group ">
											<select class="form-control input-lg" name="genderPrefer">
												<option>No preference</option>
												<option>Male</option>
												<option>Female</option>
											</select>
										</div>
									</div>
									<div class="col-lg-2">
										<div class="form-group"> <button type="submit" name="action" value="postJob" class="btn btn-primary btn-lg">Continue</button> </div>
									</div>
									<div class="col-lg-2">
										<div class="form-group"> <a href="home.jsp" class="btn btn-default btn-lg">Cancel</a> </div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<script src="js/jquery-3.2.1.min.js"></script>
			<script src="js/bootstrap.min.js"></script>
			<script src="js/script.js"></script>
		</body>

		</html>