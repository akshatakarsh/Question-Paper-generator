

<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String email=request.getParameter("email");
    String pass=request.getParameter("pass");
    db.DbConnection m1=(db.DbConnection)session.getAttribute("db");
    if(m1==null){
       m1=new db.DbConnection();
        session.setAttribute("db",m1);
        
    }
    HashMap hm=new HashMap();
   hm=m1.clogin(email, pass);
   if(hm !=null){
       session.setAttribute("hm",hm);
        String e=(String)hm.get("email");
        session.setAttribute("email",e);
       response.sendRedirect("dashboard.jsp");
   }else{
       session.setAttribute("msg","Invalid email or password");
       response.sendRedirect("home.jsp");
   }
%>
