<html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/styles.css" rel="stylesheet">
    <link rel="icon" href="images/logo.png">
    <title>Change Password</title>
</head>

<body>
    <div class="navbar navbar-fixed-top navbar-default " style="background-color: #b7e296;">
        <div class="container ">
            <a href="home.jsp" class="navbar-brand" id="site-title-dashboard"> 
                <span style="color:#46B749;">JOB</span><span style="color:#1565C0;">Hive</span>
            </a>
            <button class="navbar-toggle" data-toggle="collapse" data-target="#navHeaderCollapse" >
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <div class="collapse navbar-collapse " id="navHeaderCollapse">
                <ul class="nav navbar-nav navbar-right">
                    <li class="active"> <a href="admin-dashboard.jsp">Profile </a></li>
                    <li> <a href="notifications.jsp">Notifications </a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"> Settings<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li> <a href="change-pass-admin.jsp">Change Password </a></li>
                        </ul>
                    </li>
                    <li> <a href="controller.jsp?action=logout">Log Out </a></li>
                </ul>
                <form class="navbar-form navbar-left " action="">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Search" name="search">
                        <div class="input-group-btn">
                            <button class="btn btn-default" type="submit">
                                 <i class="glyphicon glyphicon-search" ></i>
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="container-fluid" >
        <div class="container">
            <div class="row" id="vid-container-dashboard"  >
                <div class="col-sm-12" style="padding-top: 50px;"><br></br>
                    <h2> Change Password</h2>
                    <br>
                    <form class="form-horizontal" action="controller.jsp" method="POST">
                        <div class="col-lg-12">
                            <input pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 6 or more characters" type="password" name="old-pass" placeholder="Old Password" class="form-control" style="width: 300px;"><br>
                        </div>
                        <div class="col-lg-12">
                            <input style="width: 300px;" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 6 or more characters" type="password" name="new-pass" placeholder="New Password" class="form-control"><br>
                        </div>
                        <div class="col-lg-12">
                            <input style="width: 300px;" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 6 or more characters" type="password" name="con-new-pass" placeholder="Confirm New Password" class="form-control">
                        </div>
                        <div class="col-lg-4">
                            <br>
                            <button type="submit" name="action" value="changeAdminPass" class="btn btn-primary">Confirm</button>
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