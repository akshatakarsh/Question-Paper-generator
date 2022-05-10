<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Question Paper Generator</title>
    <script>
    	function onform(){
    	document.getElementById("form").style.display="block";
    }
    </script>

    <!-- Font Icon -->
    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

    <link rel="stylesheet" href="vendors/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="vendors/font-awesome/css/font-awesome.min.css">
    
    <!-- Main css -->
    <link rel="stylesheet" href="css/style.css">
</head>
<body bgcolor="black">
    
    <% 
        session.setAttribute("msg", "Question Paper Generator is leading software for creating semester paper and class test for colleges.");
String m=(String)session.getAttribute("msg");
if(m!=null){
    %>

                   
            </div>
    <div class="main">

        <!-- Sign up form -->
       
 
 

        <!-- Sing in  Form -->
        <section  style="margin-bottom: 100px;"class="sign-in" id="form" onload="form()" >
            <div class="container">
                <marquee Style="font-size: 20px;color:red;"><b><%=m%></b></marquee>
                <% 
                        session.setAttribute("msg","");
                        }
                        
                        %>

                <div class="signin-content">
                    
                    <div class="signin-image">
                        <figure><img src="images/signin-image.jpg" alt="sing up image"></figure>
                        
                    </div>
                   

                    <div class="signin-form">
                        <h2 class="form-title">Sign in</h2>
                        <form method="POST" class="register-form" id="login-form" action="loginprocess.jsp">
                            <div class="form-group">
                                <label for="your_name"><i class="zmdi zmdi-email"></i></label>
                                <input type="text" name="email" id="your_name" placeholder="Your Email"/>
                            </div>
                            <div class="form-group">
                                <label for="your_pass"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password" name="pass" id="your_pass" placeholder="Password"/>
                            </div>
                            <div class="form-group">
                                <input type="checkbox" name="remember-me" id="remember-me" class="agree-term" />
                                <label for="remember-me" class="label-agree-term"><span><span></span></span>Remember me</label>
                            </div>
                            <div class="form-group form-button">
                                <input type="submit" name="signin" id="signin" class="form-submit" value="Log in"/>
                            </div>
                        </form>
                        <div class="social-login">
                            <!--<span class="social-label">Or login with</span> -->
                          <ul class="socials">
                               <!-- <li><a href="#"><i class="display-flex-center zmdi zmdi-facebook"></i></a></li>
                                <li><a href="#"><i class="display-flex-center zmdi zmdi-twitter"></i></a></li>
                                <li><a href="#"><i class="display-flex-center zmdi zmdi-google"></i></a></li>
                            </ul>
                        -->
                        <a style="margin-right: 30px ;"href="resetpass.jsp" class="signup-image-link"><b>Reset Password</b></a> <a style="margin-right: 30px"href="Register.jsp" class="signup-image-link"><b>Create an account<b></a>  <a href="forgetpass.jsp" class="signup-image-link"><b>Forgot password ?</b></a> 
                        </div>
                    </div>
                </div>
            </div>
        </section>


    </div>
        <div class="col-sm-12 text-center text-capitalize "> 
            <div class="alert  alert-success alert-dismissible fade show">
                <footer style="color:red"><b> 2020 copyright &  Designed by  ER. Akshat Akarsh<b></footer>
                           </div>
                            </div>
    <!-- JS -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="js/main.js"></script>
      <script src="assets/js/main.js"></script>
</body>
</html>