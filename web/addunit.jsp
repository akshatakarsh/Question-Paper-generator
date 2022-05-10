<%@page import="java.util.HashMap"%>
<%
        String email=(String)session.getAttribute("email");
    HashMap hm=(HashMap)session.getAttribute("hm");
    if(hm!=null){
        
    
    %>
<!doctype html>

<html class="no-js" lang="en">
<!--<![endif]-->

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title><%= hm.get("name")%></title>
    <meta name="description" content="Sufee Admin - HTML5 Admin Template">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="apple-icon.png">
    <link rel="shortcut icon" href="favicon.ico">
<link href="maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link rel="stylesheet" href="vendors/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="vendors/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="vendors/themify-icons/css/themify-icons.css">
    <link rel="stylesheet" href="vendors/flag-icon-css/css/flag-icon.min.css">
    <link rel="stylesheet" href="vendors/selectFX/css/cs-skin-elastic.css">
    <link rel="stylesheet" href="vendors/jqvmap/dist/jqvmap.min.css">


    <link rel="stylesheet" href="assets/css/style.css">

    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>

</head>

<body>


    <!-- Left Panel -->

    <aside id="left-panel" class="left-panel">
        <nav class="navbar navbar-expand-sm navbar-default">

            <div class="navbar-header">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#main-menu" aria-controls="main-menu" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand" href="dashboard.jsp"><h3 style="color: red"><%= hm.get("name")%></h3></a>
                <a class="navbar-brand hidden" href="dashboard.jsp"><img src="images/logo2.png" alt="Logo"></a>

            </div>

            <div id="main-menu" class="main-menu collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li class="active">
                        <a href="dashboard.jsp"> <i class="menu-icon fa fa-dashboard"></i>Dashboard </a>

                    </li>
                    <h3 class="menu-title">Menu</h3><!-- /.menu-title -->
                    
                       
                          <ul class="nav navbar-nav">
                    <li class="active">
                        <a href="Branch.jsp"> <i class="menu-icon fa fa-files-o"></i>Branch</a>

                    </li>  
                    <li class="active">
                        <a href="Subject.jsp"> <i class="menu-icon fa fa-book"></i>Subject</a>

                    </li>
                    <li class="active">
                        <a href="index.html"> <i class="menu-icon fa fa-question"></i>Questions</a>

                    </li>  
                    <li class="active">
                        <a href="index.html"> <i class="menu-icon fa fa-file"></i>Paper</a>


                    </li>  
                     <li class="active">
                        <a href="Logout.jsp"> <i class="menu-icon fa fa-power-off"></i>Logout</a>

                    </li>    
                </ul>
                           

                     
                   

                   
                    <h3 class="menu-title">Extras</h3><!-- /.menu-title -->
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-glass"></i>Pages</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="menu-icon fa fa-sign-in"></i><a href="page-login.html">Login</a></li>
                            <li><i class="menu-icon fa fa-sign-in"></i><a href="page-register.html">Register</a></li>
                            <li><i class="menu-icon fa fa-paper-plane"></i><a href="pages-forget.html">Forget Pass</a></li>
                        </ul>
                    </li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </nav>
    </aside><!-- /#left-panel -->

    <!-- Left Panel -->

    <!-- Right Panel -->

    <div id="right-panel" class="right-panel">

        <!-- Header-->
        <header id="header" class="header">

            <div class="header-menu">

                <div class="col-sm-7">
                    <a id="menuToggle" class="menutoggle pull-left"><i class="fa fa fa-tasks"></i></a>
                    <div class="header-left">
                        <button class="search-trigger"><i class="fa fa-search"></i></button>
                        <div class="form-inline">
                            <form class="search-form">
                                <input class="form-control mr-sm-2" type="text" placeholder="Search ..." aria-label="Search">
                                <button class="search-close" type="submit"><i class="fa fa-close"></i></button>
                            </form>
                        </div>

                        <div class="dropdown for-notification">
                            <button class="btn btn-secondary dropdown-toggle" type="button" id="notification" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fa fa-bell"></i>
                                <span class="count bg-danger">5</span>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="notification">
                                <p class="red">You have 3 Notification</p>
                                <a class="dropdown-item media bg-flat-color-1" href="#">
                                <i class="fa fa-check"></i>
                                <p>Server #1 overloaded.</p>
                            </a>
                                <a class="dropdown-item media bg-flat-color-4" href="#">
                                <i class="fa fa-info"></i>
                                <p>Server #2 overloaded.</p>
                            </a>
                                <a class="dropdown-item media bg-flat-color-5" href="#">
                                <i class="fa fa-warning"></i>
                                <p>Server #3 overloaded.</p>
                            </a>
                            </div>
                        </div>

                    </div>
                </div>
                  <% 
                   db.DbConnection db=(db.DbConnection)session.getAttribute("db");
                   if(db==null){
                       db=new db.DbConnection();
                       session.setAttribute("db", db);
                   }
                    byte [] photo =db.getUserPhoto((String)hm.get("email"));
                      if(photo.length!=0){
                      %>

                <div class="col-sm-5">
                    <div class="user-area dropdown float-right">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <img class="user-avatar rounded-circle" src="GetPhoto.jsp?email=<%=hm.get("email")%> "alt="User Avatar">
                        </a>
            <%}
             %>
                        <div class="user-menu dropdown-menu">
                            <a class="nav-link" href="profile.jsp"><i class="fa fa-user"></i> My Profile</a>

                            <a class="nav-link" href="#"><i class="fa fa-user"></i> Notifications <span class="count">13</span></a>

                            <a class="nav-link" href="#"><i class="fa fa-cog"></i> Settings</a>

                            <a class="nav-link" href="Logout.jsp"><i class="fa fa-power-off"></i> Logout</a>
                        </div>
                    </div>

                    <div class="language-select dropdown" id="language-select">
                        <a class="dropdown-toggle" href="#" data-toggle="dropdown"  id="language" aria-haspopup="true" aria-expanded="true">
                            <i class="flag-icon flag-icon-us"></i>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="language">
                            <div class="dropdown-item">
                                <span class="flag-icon flag-icon-fr"></span>
                            </div>
                            <div class="dropdown-item">
                                <i class="flag-icon flag-icon-es"></i>
                            </div>
                            <div class="dropdown-item">
                                <i class="flag-icon flag-icon-us"></i>
                            </div>
                            <div class="dropdown-item">
                                <i class="flag-icon flag-icon-it"></i>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

        </header><!-- /header -->
        <!-- Header-->

        <div class="breadcrumbs">
            <div class="col-sm-4">
                <div class="page-header float-left">
                    <div class="page-title">
                        <h1>Dashboard</h1>
                    </div>
                </div>
            </div>
            <div class="col-sm-8">
                <div class="page-header float-right">
                    <div class="page-title">
                        <ol class="breadcrumb text-right">
                            <li class="active">Dashboard</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>

        <div class="content">

            <div class="col-sm-12">
                <div class="alert  alert-success alert-dismissible fade show" role="alert">
                    <span class="badge badge-pill badge-success">Success</span> You successfully read this important alert message.
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
            </div>

 <div class="row">
      <form action="addunitpro.jsp" method="get">
    
    
     <% HashMap hm1=db.getsubdetails(email);
         %>
  
       <div class="form-group col-sm-4 ">
      <label for="inputState">Subject</label>
     
      <select name="subject" onchange="showcode(this.value)" class="form-control">
           <% 
       for(int i=5;i<hm1.size();){
          String sub=request.getParameter("subject");
          session.setAttribute("subject", sub);
      %>
 <option name="subject" value="<%=hm1.get(i)%>"><%=hm1.get(i)%></option>
        <% i=i+6;}
        %>
      </select>
       </div>
        <% String s=(String)session.getAttribute("subcode");
                %>
      <div class="form-group col-sm-4">
      <label for="inputEmail4">Subject Code</label>
      <input type="text"  name="subcode" class="form-control" id="demu"  disabled>
     
    
    </div>
      <div class="form-group col-sm-4">
      <label for="inputEmail4">Branch</label>
       <select name="branch" onchange="showcode(this.value)" class="form-control">
      
        <%   HashMap hm3=db.getBranchDetails(email);
            for(int i=2;i<hm3.size();){
            %>
        
          <option name="branch" value="<%=hm3.get(i)%>"> <%=hm3.get(i)%> </option>
                  <% i=i+4;}%>
       </select>
          
    </div> 
        <div class="form- col-sm-4 ">
      <label for="inputState">Unit no</label>
      <input type="text" name="unitno"class="form-control" id="inputAddress" >
       </div>
      <div class="form-group col-sm-8">
      <label for="inputState"> Unit Name.</label>
      <input type="text" name="unitname" class="form-control" id="inputAddress">
       </div>
          
          <div class="form-group col-sm-4">
          <label for="inputState">Status</label>
      <select id="inputState" name="status" class="form-control">
        <option name="status" value="Active">Active</option>
         <option name="status" value="In Active">In Active</option>
        
      </select>
          </div>
          <div class=" form group col-sm-6">
          <button type="submit" class="btn-primary btn-block">Add Unit</button>
          </div>
      </form>

    <script src="vendors/jquery/dist/jquery.min.js"></script>
    <script src="vendors/popper.js/dist/umd/popper.min.js"></script>
    <script src="vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="assets/js/main.js"></script>


    <script src="vendors/chart.js/dist/Chart.bundle.min.js"></script>
    <script src="assets/js/dashboard.js"></script>
    <script src="assets/js/widgets.js"></script>
    <script src="vendors/jqvmap/dist/jquery.vmap.min.js"></script>
    <script src="vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
    <script src="vendors/jqvmap/dist/maps/jquery.vmap.world.js"></script>
    <script>
        (function($) {
            "use strict";

            jQuery('#vmap').vectorMap({
                map: 'world_en',
                backgroundColor: null,
                color: '#ffffff',
                hoverOpacity: 0.7,
                selectedColor: '#1de9b6',
                enableZoom: true,
                showTooltip: true,
                values: sample_data,
                scaleColors: ['#1de9b6', '#03a9f5'],
                normalizeFunction: 'polynomial'
            });
        })(jQuery);
    </script>
    <script>
        function showcode(str){
            var xhttp;
            if(str == ""){
                document.getElementById("demu").value="";
               
                return;
            }
            
            xhttp=new XMLHttpRequest();
            xhttp.onreadystatechange= 
                    function(){
                if(this.readyState==4 && this.status=="200"){
                    document.getElementById("demu").value=this.responseText;
          
                    
                } 
            };
            xhttp.open("GET","getsubcode.jsp?subcode="+str,true);
            xhttp.send();
        }
    </script>
     <script>
        function showbranch(str){
            var xhttp;
            if(str == ""){
                document.getElementById("dem1").value="hii";
               
                return;
            }
        
    </script>
    
</body>

</html>
<%
    }else{
session.setAttribute("msg", "Please !Login First");
response.sendRedirect("home.jsp");
}
    %>