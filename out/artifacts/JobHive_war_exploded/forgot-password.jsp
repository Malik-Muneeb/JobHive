<html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/styles.css" rel="stylesheet">
    <link rel="icon" href="images/logo.png">
    <title>Forgot Password</title>
</head>

<body>
    <div class="navbar navbar-fixed-top navbar-default " style="background-color: #b7e296;">
        <div class="container ">
            <a href="home.jsp" class="navbar-brand" id="site-title-dashboard">
                <span style="color:#46B749;">JOB</span><span style="color:#1565C0;">Hive</span>
            </a>
         </div>
    </div>
    <div class="container-fluid" >
        <div class="container">
            <div class="row" id="vid-container-dashboard"  >
                <div class="col-sm-12 " style="padding-top: 50px;"><br></br>
                    <h1>Change your password</h1><br>
                    <div class="col-lg-5" >
                        <form class="form-horizontal" action="controller.jsp" method="POST">
                            <div class="form-group">
                                <input type="text" name="email" required placeholder="Enter your User Name or Email Address" class="form-control">
                            </div>
                            <div class="form-group">
                                <label class=" " >Where do you want to go to Honeymoon?(Security Question)</label>
                                <input type="text" name="sec-ans" required placeholder="Answer Hint: Think" class="form-control">
                            </div>
                            <div class="form-group">
                                <input pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 6 or more characters" type="password" name="new-pass" required placeholder="New Password" class="form-control">
                            </div>
                            <div class="form-group">
                                <input pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 6 or more characters" type="password" name="con-new-pass" required placeholder="Confirm New Password" class="form-control">
                            </div>
                            <div class="form-group">
                                <button type="submit" name="action" value="forgot" class="btn btn-primary">Confirm</button>
                            </div>
                        </form>
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