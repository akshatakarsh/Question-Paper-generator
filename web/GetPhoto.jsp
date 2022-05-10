<%-- 
    Document   : GetPhoto
    Created on : Apr 7, 2020, 1:43:09 PM
    Author     : Akshat
--%>

<%@page import="java.util.HashMap"%>
<% 
    HashMap hm=(HashMap)session.getAttribute("hm");
    if(hm!=null){
    String e=request.getParameter("email");
 db.DbConnection db=(db.DbConnection)session.getAttribute("db");
    if(db==null){
        db=new db.DbConnection();
        session.setAttribute("db",db);
    }
    byte[] r=db.getUserPhoto(e);
    response.getOutputStream().write(r);
    }else{
        session.setAttribute("msg", "We Directly not get this page !Please !! Login First");
    }
%>
