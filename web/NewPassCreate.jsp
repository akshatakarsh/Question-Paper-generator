 <%
        String otp=(String)session.getAttribute("otp");
        if(otp!=null){
        
String email=(String)session.getAttribute("email");
session.setAttribute("email",email);
%>
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
                               
                            </div>
                        </div>
                    <%   
                        session.setAttribute("msg",null);
                    }
                    %>
                    <div class="signin-form">
                        <h3 class="form-title">Reset Password</h3>
                        <form method="POST" class="register-form" id="login-form" action="UpdatePass">
                            <div class="form-group">
                                <label for="email"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password" name="newpass" id="your_name" placeholder="Enter New Password"/>
                            </div>
                            <div class="form-group">
                                <label for="email"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password" name="conpass" id="your_name" placeholder="Confirm New Password"/>
                            </div>
                            
                            
                            <div class="form-group form-button">
                                <input type="submit" name="signin" id="signin" class="form-submit" value="Submit"/>
                            </div>
                        </form
                        
                    
                        
                           
                        
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
<%
    }else{
session.setAttribute("msg","Please !! reset Password please!");
response.sendRedirect("home.jsp");
}
%>