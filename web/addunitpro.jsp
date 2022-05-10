<%-- 
    Document   : addunitpro
    Created on : Apr 27, 2020, 11:47:19 AM
    Author     : Akshat
--%>

<%@page import="java.util.HashMap"%>
<%
    HashMap hm= (HashMap)session.getAttribute("hm");
    if(hm!=null){
      String subjectcode= (String)session.getAttribute("subcode");
        String subject=request.getParameter("subject");
         String branch=request.getParameter("branch");
         String unit=request.getParameter("unitno");
         int unitno=Integer.parseInt(unit);
          String unitname=request.getParameter("unitname");
           String status=request.getParameter("status");
            db.DbConnection db= (db.DbConnection) session.getAttribute("db");
   if(db==null){
     db=  new db.DbConnection();
     session.setAttribute("db",db);
   }
  int x= db.insertunit(subjectcode, branch,subject, unitno, unitname, status);
    if(x==1){
        session.setAttribute("subject",subject);
        response.sendRedirect("unit.jsp");
    }
    else{
        session.setAttribute("msg", "Addition of unit failed");
        response.sendRedirect("dashboard.jsp");
    }
    }else{
        session.setAttribute("msg","Please !! Login First" );
        response.sendRedirect("home.jsp");
       
    }
    %>
