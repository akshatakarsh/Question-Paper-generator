<%-- 
    Document   : changepasspro
    Created on : Apr 12, 2020, 2:26:48 PM
    Author     : Akshat
--%>

<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
   String phone=(String)session.getAttribute("mobile");
  String newpass=request.getParameter("newpass");
  String conpass=request.getParameter("conpass");
   if(phone!=null){
    db.DbConnection db=new db.DbConnection();
    try{
        if(newpass.equals(conpass) ){
             db.DbConnection m1=(db.DbConnection)session.getAttribute("db");
        
            if(m1==null){
                 m1=new db.DbConnection();
                 session.setAttribute("db",m1);
           int x= m1.changepassbymobile(newpass, phone);
           if(x==0){
               
                session.setAttribute("msg", "Password reset again or enter password");
               response.sendRedirect("home.jsp");
           }else{
              session.setAttribute("msg", "Password changed Sucessfully !  Login with new password");
                response.sendRedirect("home.jsp");
           } }
        }else{
            session.setAttribute("msg", "new pass and con pass are not same  ");
                response.sendRedirect("home.jsp");
        }
        
        
    
    
}       catch (ClassNotFoundException ex) {
    
            session.setAttribute("msg",ex.getMessage());
            response.sendRedirect("home.jsp");
        } catch (SQLException ex) {
            session.setAttribute("msg",ex.getMessage());
            response.sendRedirect("home.jsp");
        }catch(Exception ex){
            session.setAttribute("msg",ex.getMessage());
            response.sendRedirect("home.jsp");
        }
}
%>