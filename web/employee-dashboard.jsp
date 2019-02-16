<html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/styles.css" rel="stylesheet">
    <link rel="icon" href="images/logo.png">
    <title>Employee Dashboard</title>
</head>

<body>
    <div class="navbar navbar-fixed-top navbar-default " style="background-color: #b7e296;">
        <div class="container ">
            <a href="home.jsp" class="navbar-brand" id="site-title-dashboard"> 
                <span style="color:#46B749;">JOB</span><span style="color:#1565C0;">Hive</span>
            </a>
            <button class="navbar-toggle" data-toggle="collapse" data-target="#navHeaderCollapse" ">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <div class="collapse navbar-collapse " id="navHeaderCollapse">
                <ul class="nav navbar-nav navbar-right">
                    <li class="active"> <a href="employee-dashboard.jsp">Profile </a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"> Settings<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li> <a href="controller.jsp?action=changeAccountEmp">Account Settings </a></li>
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
    <div class="container-fluid" style="background-image: url('images/login3-bg.jpeg');background-size: cover;background-repeat: no-repeat;">
        <div class="container">
            <div class="row" id="vid-container-dashboard"  >
                <div class="col-sm-12" style="padding-top: 50px;">
                    <br></br>
                    <h1 style="font-size: 40px;color:white"> Employee Dashboard</h1>
                </div>
                <div class="col-sm-12 ">
                    <h2 style="color:white">Welcome <span style="color:#378CE8"><strong><%=session.getAttribute("userName")%></strong></span></h2>
                </div>
                <div class="col-sm-12 ">
                    </br>
                    <div class="col-lg-6">
                        <div class="col-lg-11" id="employer-optn1">
                            <a href="home.jsp" class="employer-optns">
                                <center>
                                    <span class="glyphicon glyphicon-ok btn-lg" style="font-size: 30px;"></span><br>
                                    <h2>Find your Dream Job</h2>
                                </center>

                            </a>
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