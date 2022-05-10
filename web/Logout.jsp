<%-- 
    Document   : Logout
    Created on : Apr 7, 2020, 5:14:12 PM
    Author     : Akshat
--%>
<%@page import="java.util.HashMap"%>
<% db.DbConnection db=(db.DbConnection)session.getAttribute("db");

    HashMap hm=(HashMap)session.getAttribute("hm");
    if(hm!=null){
        session.invalidate();
        response.sendRedirect("home.jsp");
    }else{
        session.setAttribute("msg","Please !Login First");
        response.sendRedirect("home.jsp");
    }
        
    %>