<%@page import="java.util.HashMap"%>
<%
    String email=(String)session.getAttribute("email");
    HashMap hm=(HashMap)session.getAttribute("hm");
    if(email!=null){
        
    
    %>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
<title>Subject</title>

 
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
<link href="css/bootstrap-table.css" rel="stylesheet">
<link href="css/css1/bootstrap.css" rel="stylesheet">
<link href="css/css1/style.css" rel="stylesheet">
<link href="css/css1/bootstrap-table.css" rel="stylesheet">
<link href="css/bootstrap-table.css" rel="stylesheet">
</head>

<body style="background-color: gainsboro">
	
   
                
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
    
          
            
             <div class="text-center">
                <div class="btn-group" role="group"  >
  <a href="#" data-target="#signin" data-toggle="modal"   type="button" class="btn btn-primary">+ Add Subject </a>
                </div>
           
   
        
               
          </div> 
                        <% String m="";%>
          
                      <div class="panel panel-warning">
                   <div class="panel-heading">
    <h4 class="panel-title text-center"><%=m%></h4> 
                </div>
                </div>
         
            
<br><br>
         <div class="row">
        <div class="col-md-12">
        
          
 <div class="panel panel-primary">
      
<div class="panel-heading"><h3 class="panel-title">
        Total Subject<span class="badge">0</span> 
                     </h3>
</div>
     <% 
int x=m1.ctb();

     %>
         

        <div class="panel-heading"><h3 class="panel-title">
        Total Branch<span class="badge"><%= x%></span>
                     </h3>
</div>    
       
    <div class="panel-body">
   
  <table data-toggle="table" data-url="tables/data1.json"  data-show-refresh="true" data-show-toggle="true" data-show-columns="true" data-search="true" data-select-item-name="toolbar1" data-pagination="true" data-sort-name="name" data-sort-order="desc">
                <thead>
                <tr>
                    
                    <th data-field="sid" data-sortable="true">#</th>
                   <th data-field="name"  data-sortable="true">Branch Name</th>						       
                    <th data-field="semester" data-sortable="true">Semester</th>
                    <th data-field="scode" data-sortable="true">Subject code</th>
                    <th data-field="sname" data-sortable="true">Subject name</th>

                
                   <th data-field="status" data-sortable="true">status</th>
                   <th data-field="action" data-sortable="true">action</th>
                   
                  
               </tr>
		 </thead>
                 <tbody>  
                                
      <%                  
              db.DbConnection m3=(db.DbConnection)session.getAttribute("db");
    if(m3==null){
       m3=new db.DbConnection();
        session.setAttribute("db",m1);
        
    }
    HashMap hm2=m3.getsubdetails(email);
    if(hm2.isEmpty()){
        m="Please ! Add Subject !!!!!!!!";
    }
    for(int i=0;i<hm2.size();){
    
      %>          
                     
          <tr>    
            <td><%=hm2.get(++i)%></td>
            <td><%=hm2.get(++i)%></td>
               <td><%=hm2.get(++i)%></td>  
                <td><%=hm2.get(++i)%></td>    
                 <td><%=hm2.get(++i)%></td>    
                  <td><%=hm2.get(++i)%></td> 
                  
 <td><p><a href="ViewEmpDetailsProcess.jsp?eid=" class="btn btn-primary" role="button">Edit</a>
    <a href="DeleteEmpProcess.jsp?eid=" class="btn btn-primary" role="button">Delete</a></p>
     </td>
     <% } %>
                   </tr>
           
            
 </tbody>
     </table>
  </div>
 </div>
            
            
        </div>
     </div>
           <!-- MODAL FOR SIGN IN -->
           <div class="modal" id="signin" tabindex="-1" data-backdrop="static"><!--data-keyboard="false" for prevent esc button to dissmiss -->
    <div class="modal-dialog">
       <div class="modal-content">
        <div class="modal-header">
     <button class="close" data-dismiss="modal">&times;</button>
     <h3 class="modal-title">Add Subject</h3>
    </div>
           <form action="subjectpro.jsp" method="post" role="form">
           <div class="modal-body">
                <%                  
              db.DbConnection m4=(db.DbConnection)session.getAttribute("db");
    if(m4==null){
       m4=new db.DbConnection();
        session.setAttribute("db",m1);
       
    }
     HashMap hm3=m4.getBranchDetails(email);
    %>          
     
                       <div class="form-group">
                           <label >Select branch:</label>
  <select name="branch" class="form-control dropdown-primary" >
      <%
   for(int i=2;i<=hm3.size();)
     {
     %>
      <option name="branch" value="<%=hm3.get(i)%>"><%= hm3.get(i)%></option>
      <% i=i+4;%>
      <% }%>
              
              
  </select>
    
</div>
<div class="form-group">
                           <label >Select semester</label>
<select  name="semester"class="form-control dropdown-primary" >
    <option name="semester"value="1">1</option>
    <option name="semester"value="2">2</option>
    <option  name="semester"value="3">3</option>
    <option  name="semester"value="4">4</option>
     <option  name="semester"value="5">5</option>
    <option  name="semester"value="6">6</option>
    <option  name="semester"value="7">7</option>
    <option  name="semester"value="8">8</option>
  </select>
</div>
                            <div class="form-group">
                                    <label >Subject code</label>
                                    <input type ="text" name="code" class="form-control" placeholder="subject code" required>
                            </div>
                            <div class="form-group">
                                    <label>Subject name</label>
                                    <input type ="text" name="subname" class="form-control" placeholder="subject name" required>
                            </div>
                            <div class="form-group">
                                    <label>Status</label>
                                    <!--Blue select-->
<select  name="status" class="form-control dropdown-primary">
  <option name="status" value="Active">Active</option>
  <option name="status" value="In Active">In Active</option>
  
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
 <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/bootstrap-table.js"></script>
		
</body>

</html>
<% }else{
session.setAttribute("msg","Please !! Login First!!!");
response.sendRedirect("home.jsp");
}
%>