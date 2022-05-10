<%-- 
    Document   : subjectpro
    Created on : Apr 15, 2020, 12:12:49 PM
    Author     : Akshat
--%>

<%@page import="java.util.HashMap"%>
<%
    
    String email=(String)session.getAttribute("email");
   HashMap hm=(HashMap) session.getAttribute("hm");
   if(email!=null){
    String branch=request.getParameter("branch");
    String semester=request.getParameter("semester");
     String scode=request.getParameter("code");
    String sname=request.getParameter("subname");
     String status=request.getParameter("status");
     
   db.DbConnection db= (db.DbConnection) session.getAttribute("db");
   if(db==null){
     db=  new db.DbConnection();
     session.setAttribute("db",db);
     
   }
  String k= db.insertsub(branch,email,semester,scode,sname,status);
       if(k.equals("done")){
         response.sendRedirect("Subject.jsp");
       }else{
           session.setAttribute("msg","Subject Entry of data Fialed !!");
            response.sendRedirect("dashboard.jsp");
            
   }
   
   }else{
       session.setAttribute("msg","Please      Login      First !!!");
       response.sendRedirect("home.jsp");
   }
    %>