<%-- 
    Document   : getsubcode
    Created on : Apr 28, 2020, 12:09:35 PM
    Author     : Akshat
--%>

<%@page import="java.util.HashMap"%>
<% 
    HashMap hm=(HashMap)session.getAttribute("hm");
     HashMap hm1=null;
      HashMap hm2=null;
    if(hm!=null){
        String subjectname=request.getParameter("subcode");
         
     db.DbConnection db=(db.DbConnection)session.getAttribute("db");
                   if(db==null){
                       db=new db.DbConnection();
                       session.setAttribute("db", db);
                   }
                 hm1=   db.subcode(subjectname);
               
                session.setAttribute("subcode",hm1.get(1))  ;
                
}
  
%>
<%=hm1.get(1)%>
