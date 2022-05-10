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

    <!-- Main css -->
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

    <div class="main">

        <!-- Sign up form -->
       

        <!-- Sing in  Form -->
        <section class="sign-in" id="form" onload="form()" >
            <div class="container">
                <div class="signin-content">
                    <div class="signin-image">
                        <figure><img src="images/signin-image.jpg" alt="sing up image"></figure>
                      
                    </div>
  <%
                    String m=(String)session.getAttribute("msg");
                    if(m!=null){
                    %>
                        <div class="panel">
                            <div class="panel-body bg-danger text-center">
                                <%=m%>
                            </div>
                        </div>
                    <%   
                        session.setAttribute("msg",null);
                    }
                    %>
                    <div class="signin-form">
                        <h2 class="form-title">Forget Password ?</h2>
                        <form method="POST" class="register-form" id="login-form" action="forgetpassprocess.jsp">
                            <div class="form-group">
                                <label for="email"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="email" name="email" id="your_name" placeholder="Enter your email"/>
                            </div>
                            
                            
                            <div class="form-group form-button">
                                <input type="submit" name="signin" id="signin" class="form-submit" value="Submit"/>
                            </div>
                        </form>
                        <div class="social-login">
                            <!--<span class="social-label">Or login with</span> -->
                           <!-- <ul class="socials">-->
                               <!-- <li><a href="#"><i class="display-flex-center zmdi zmdi-facebook"></i></a></li>
                                <li><a href="#"><i class="display-flex-center zmdi zmdi-twitter"></i></a></li>
                                <li><a href="#"><i class="display-flex-center zmdi zmdi-google"></i></a></li>
                            </ul>
                        -->
                        
                        </div>
                    </div>
                </div>
            </div>
        </section>


    </div>

    <!-- JS -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="js/main.js"></script>
</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>