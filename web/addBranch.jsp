

<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String email=(String)session.getAttribute("email");
    HashMap hm=(HashMap)session.getAttribute("hm");
    if(email!=null){
    String branch =request.getParameter("branch");
      String semester =request.getParameter("semester");
        String status =request.getParameter("status");
        db.DbConnection db =(db.DbConnection)session.getAttribute("db");
        if(db==null){
            db= new  db.DbConnection();
            session.setAttribute("db",db);
        }
    int x=    db.insertBranch(branch,email, semester, status);
    if(x==1){
        response.sendRedirect("Branch.jsp");
    }else{
        session.setAttribute("msg","                            "+"Please !!! Data not inserted ,go to branch");
        response.sendRedirect("dashboard.jsp");
    }
        
        
    }else{
        session.setAttribute("msg","                            "+"Please !!! Login first");
        response.sendRedirect("home.jsp");
    }
    %>


