<%-- 
    Document   : Questionpro
    Created on : Apr 16, 2020, 6:20:27 PM
    Author     : Akshat

<% 
--%>
<%@page import="java.util.HashMap"%>
<%
    String email=(String)session.getAttribute("email");
    session.setAttribute(email,"email");
    HashMap hm=(HashMap)session.getAttribute("hm");
    if(email!=null){
        try{
    String branch =request.getParameter("branch");
    String  semester=request.getParameter("semester");
     String  subject=request.getParameter("subject");
       String  un=request.getParameter("unit");
        String  q=request.getParameter("qtype");
       int unit=Integer.parseInt(un);
       int qtype=Integer.parseInt(q);
       String  question=request.getParameter("question");
       String  status=request.getParameter("status");
       db.DbConnection db=(db.DbConnection)session.getAttribute("db");
       if(db==null){
           db=new db.DbConnection();
           session.setAttribute("db", db);
       }
              int x=db.insertquestion(email,branch, semester, subject, unit, qtype, question, status);
                if(x==1){
                  response.sendRedirect("Question.jsp");
                }else{
                    session.setAttribute("msg","Registraion Failed");
                    response.sendRedirect("dashboard.jsp");
                }
        }catch(Exception ex){
                 
        session.setAttribute("msg",ex.getMessage());
        response.sendRedirect("dashboard.jsp");
        }
            }else{
        session.setAttribute("msg","Please !!! Login First");
        response.sendRedirect("home.jsp");
    }
    
%>