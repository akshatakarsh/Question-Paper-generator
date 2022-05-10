<%@page import="java.util.HashMap"%>
<%
    HashMap hm=(HashMap)session.getAttribute("hm");
     String email =(String)session.getAttribute("email");
    if(email!=null){
        
    
    %>
<!DOCTYPE html>
<html  lang="en">
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
<title>Branch</title>
<link rel="apple-touch-icon" href="apple-icon.png">
    <link rel="shortcut icon" href="favicon.ico">

    <link rel="stylesheet" href="vendors/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="vendors/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="vendors/themify-icons/css/themify-icons.css">
    <link rel="stylesheet" href="vendors/flag-icon-css/css/flag-icon.min.css">
    <link rel="stylesheet" href="vendors/selectFX/css/cs-skin-elastic.css">
    <link rel="stylesheet" href="vendors/jqvmap/dist/jqvmap.min.css">
 <link rel="stylesheet" href="assets/css/style2.css">
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/style1.css" rel="stylesheet">

<link href="css/css1/bootstrap.css" rel="stylesheet">
<link href="css/css1/style.css" rel="stylesheet">
<link href="css/css1/bootstrap-table.css" rel="stylesheet">
<link href="css/bootstrap-table.css" rel="stylesheet">
</head>

<body style="background-color: gainsboro">
     
                
        <!-- Header-->
        <header id="header" class="header">

           
                 <% 
                   db.DbConnection m1=(db.DbConnection)session.getAttribute("db");
                   if(m1==null){
                       m1=new db.DbConnection();
                       session.setAttribute("db", m1);
                   }
                   
                    byte [] photo1 =m1.getUserPhoto((String)hm.get("email"));
                      if(photo1.length!=0){
                      %>

                <div class="navbar-fixed-top">
                    <div class="user-area dropdown float-left">
                          <div class="btn-group" role="group"  >
  <a href="dashboard.jsp"  type="button" class="btn btn-primary">Dashboard</a>
                </div>
           
                    </div>
                    <div class="user-area dropdown float-right">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <img class="user-avatar rounded-circle" src="GetPhoto.jsp?email=<%=hm.get("email")%>" alt="User Avatar">
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

                    

        </header>
    
                </div>
		
	
        <div class="container-fluid">
          
            
             <div class="text-center">
                <div class="btn-group" role="group"  >
  <a href="#" data-target="#signin" data-toggle="modal" type="button" class="btn btn-primary">+ Add Branch</a>
                </div>
           
   
   
               
          </div> 
          <br><br>  
                      <div class="panel panel-warning">
                   <div class="panel-heading">
    <h4 class="panel-title text-center"></h4> 
                </div>
                </div>
         
            
<br><br>
         <div class="row">
        <div class="col-md-12">
         <%                  
              db.DbConnection m2=(db.DbConnection)session.getAttribute("db");
    if(m2==null){
       m2=new db.DbConnection();
        session.setAttribute("db",m2);
        
    }
   int x= m2.ctb();
    %>
          
 <div class="panel panel-primary">
      
<div class="panel-heading"><h3 class="panel-title">
        Total Branch&nbsp;&nbsp;&nbsp;<span class="badge">&nbsp;&nbsp;&nbsp;<%=x%></span> 
                     </h3>
</div>

        
       
    <div class="panel-body">
   
  <table data-toggle="table" data-url="tables/data1.json"  data-show-refresh="true" data-show-toggle="true" data-show-columns="true" data-search="true" data-select-item-name="toolbar1" data-pagination="true" data-sort-name="name" data-sort-order="asc">
                <thead>
                <tr>
                    
                    <th data-field="EID" data-sortable="true">#</th>
                   <th data-field="name"  data-sortable="true">Branch Name</th>						       
                    <th data-field="Email" data-sortable="true">Semester</th>
                   <th data-field="Phone" data-sortable="true">Status</th>
                   <th data-field="action" data-sortable="true">action</th>
                  
                  
               </tr>
		 </thead>
                   
      <%                  
              db.DbConnection m3=(db.DbConnection)session.getAttribute("db");
    if(m3==null){
       m3=new db.DbConnection();
        session.setAttribute("db",m1);
        
    }
    String email1=(String)session.getAttribute("email");
    HashMap hm2=m3.getBranchDetails(email1);
    for(int i=0;i<hm2.size();){
    
      %>    <tr>
              
              <td><%=hm2.get(++i)%></td>  
                <td><%=hm2.get(++i)%></td>    
                 <td><%=hm2.get(++i)%></td>    
                  <td> <%=hm2.get(++i)%></td> 
              
                  
 <td><p><a href="ViewEmpDetailsProcess.jsp?eid=" class="btn btn-primary" role="button">Edit</a>
    <a href="DeleteEmpProcess.jsp?eid=" class="btn btn-primary" role="button">Delete</a></p>
     </td>
                   </tr>
           
               <%}
%>
            
 
     </table>
  </div>
 </div>
            
            
        </div>
     </div>
         
           <div class="modal" id="signin" tabindex="-1" data-backdrop="static"><!--data-keyboard="false" for prevent esc button to dissmiss -->
    <div class="modal-dialog">
       <div class="modal-content">
        <div class="text-center">
     <button class="close" data-dismiss="modal">&times;</button>
     <h3 class="modal-title">Add Branch</h3>
    </div>
           <form action="addBranch.jsp"   method="post" role="form">
           <div class="modal-body">
              
                        <div class="form-group">
                         <label>Branch</label>
                                    <input type ="text" name="branch" class="form-control" placeholder="Branch" required>
                            </div>

                            <div class="form-group">
                                    <label>Semester</label>
                                    <input type ="text" name="semester" class="form-control" placeholder="Semester" required>
                            </div>
                            <div class="form-group">
                                    <label>Status</label>
                                    <!--Blue select-->
<select  name="status" class="form-control dropdown-primary">
  <option name="status" value="Active">Active</option>
  <option  name="status" value="In Active">In Active</option>
  
</select>

<!--/Blue select-->
                            </div>
        
                <div class="modal-footer">
               <button type="submit" class="btn btn-primary pull-left">ADD</button>
               <button type="reset" class="btn btn-default pull-left">Reset</button>
     <div class="form-group pull-right">
          
    
               
           </div>
          
            
           
            </form>
          
           
    </div> 
        
    </div>
</div>
    </div>     
        
       <script>
        $(document).ready(function() {
$('.mdb-select').materialSelect();
});
       </script>
       
    <script src="vendors/jquery/dist/jquery.min.js"></script>
    <script src="vendors/popper.js/dist/umd/popper.min.js"></script>
    <script src="vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="assets/js/main.js"></script>


 <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/bootstrap-table.js"></script>
    
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
		
</body>

</html>
<% }else{
session.setAttribute("msg","Please !! Login First!!!");
response.sendRedirect("home.jsp");
}
%>