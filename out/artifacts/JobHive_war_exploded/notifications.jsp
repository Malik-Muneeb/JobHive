<html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/styles.css" rel="stylesheet">
    <link rel="icon" href="images/logo.png">
    <title>Notifications</title>
</head>

<body>
    <div class="navbar navbar-fixed-top navbar-default " style="background-color: #b7e296;">
        <div class="container ">
            <a href="home.html" class="navbar-brand" id="site-title-dashboard"> 
                <span style="color:#46B749;">JOB</span><span style="color:#1565C0;">Hive</span>
            </a>
            <button class="navbar-toggle" data-toggle="collapse" data-target="#navHeaderCollapse" ">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <div class="collapse navbar-collapse " id="navHeaderCollapse">
                <ul class="nav navbar-nav navbar-right">
                    <li class="active"> <a href="#">Profile </a></li>
                    <li> <a href="notifications.jsp">Notifications </a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"> Settings<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li> <a href="change-acc-set-employer.jsp">Account Settings </a></li>
                        </ul>
                    </li>
                    <li> <a href="#">Log Out </a></li>
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
                    <h1 style="font-size: 40px;"> Notifications</h1>
                </div>
                <div class="col-sm-12 ">
                    These peoples applied for jobs:
                </div>
                <div class="col-sm-12 ">
                    <br>
                     <table class="table table-striped table-bordered">
                        <thead style="background: #1565C0;color: white">
                          <tr>
                            <th>#</th>
                            <th>Email</th>
                            <th>Job Title</th>
                            <th>Date</th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr>
                            <th scope="row">1</th>
                            <td>a@b.com</td>
                            <td>C# developer</td>
                            <td>17/12/2017</td>
                          </tr>
                          <tr>
                            <th scope="row">1</th>
                            <td>a@b.com</td>
                            <td>C# developer</td>
                            <td>17/12/2017</td>
                          </tr>
                          <tr>
                            <th scope="row">1</th>
                            <td>a@b.com</td>
                            <td>C# developer</td>
                            <td>17/12/2017</td>
                          </tr>
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