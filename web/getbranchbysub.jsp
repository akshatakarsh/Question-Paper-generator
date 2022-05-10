<%-- 
    Document   : getbranchbysub
    Created on : Apr 28, 2020, 7:42:28 PM
    Author     : Akshat
--%>
<%-- 
    Document   : getsubcode
    Created on : Apr 28, 2020, 12:09:35 PM
    Author     : Akshat
--%>

<%@page import="java.util.HashMap"%>
<% 
    HashMap hm=(HashMap)session.getAttribute("hm");
     HashMap hm1=null;
    if(hm!=null){
        String subjectname=request.getParameter("subject");
     db.DbConnection db=(db.DbConnection)session.getAttribute("db");
                   if(db==null){
                       db=new db.DbConnection();
                       session.setAttribute("db", db);
                   }
                 hm1=   db.getBranchBySubject(subjectname);
                 
                session.setAttribute("b",hm1)  ;
             
                
}else{
        session.setAttribute("msg", "Please Login First");
        response.sendRedirect("home.jsp");
    }
  
%>
<%=hm1.get(1)%>