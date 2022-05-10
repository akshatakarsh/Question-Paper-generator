<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="en">
<!--<![endif]-->

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">



    <meta name="description" content="Sufee Admin - HTML5 Admin Template">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="apple-icon.png">
    <link rel="shortcut icon" href="favicon.ico">


    <link rel="stylesheet" href="vendors/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="vendors/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="vendors/themify-icons/css/themify-icons.css">
    <link rel="stylesheet" href="vendors/flag-icon-css/css/flag-icon.min.css">
    <link rel="stylesheet" href="vendors/selectFX/css/cs-skin-elastic.css">

    <link rel="stylesheet" href="assets/css/style.css">

    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>



</head>

<body class="bg-dark">

    <%
        String otp=(String)session.getAttribute("otp");
        if(otp!=null){
        
String email=(String)session.getAttribute("email");
session.setAttribute("email",email);
String msg=(String)session.getAttribute("msg");

%>
    
    <div class="sufee-login d-flex align-content-center flex-wrap">
        <div class="container">
            
            <div class="login-content">
                <div class="login-logo">
                    <a href="home.jsp">
                         
                        <h2 style="color:white"> Click here  for Login<h2>
                    </a>
                    <div  style="margin-top: 50px;"class="alert  alert-success alert-dismissible fade show" role="alert">
                    <span class="badge badge-pill badge-danger">Notification</span> <%=  msg%>
                </div>
                <div class="login-form">
                    <form action="CheckPass">
                        <div class="form-group">
                            <label>Enter 6 Digit OTP</label>
                            <input type="text" name="otp"class="form-control" placeholder="OTP">
                        </div>
                            <button type="submit" class="btn btn-primary btn-flat m-b-15">Submit</button>

                    </form>
                </div>
            </div>
        </div>
    </div>


    <script src="vendors/jquery/dist/jquery.min.js"></script>
    <script src="vendors/popper.js/dist/umd/popper.min.js"></script>
    <script src="vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="assets/js/main.js"></script>


</body>


</html>
<%
    }else{
session.setAttribute("msg","Please !! reset Password please!");
response.sendRedirect("home.jsp");
}
%>