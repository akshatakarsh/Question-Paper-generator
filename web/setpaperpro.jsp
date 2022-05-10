
<%@page import="java.io.ByteArrayInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="com.itextpdf.text.Document"%>
<%@page import="java.util.HashMap"%>
<%
    HashMap hm=(HashMap)session.getAttribute("hm");
    String email=(String)session.getAttribute("email");
    if(email!=null){
         String p=request.getParameter("pid");
        int pid= Integer.parseInt(p);
        String paper=request.getParameter("paper");
        String branch=request.getParameter("branch");
        String semester=request.getParameter("semester");
          String subject=request.getParameter("subject");
         String tm2=request.getParameter("tm");
         String time=request.getParameter("time");
            int tm=Integer.parseInt(tm2);
            String qpd=request.getParameter("qpd");
             String qts1=request.getParameter("qt2");
             int qt2=Integer.parseInt(qts1);
              String qts2=request.getParameter("qt4");
              int qt4=Integer.parseInt(qts2);
         String qts3=request.getParameter("qt5");
         int qt5=Integer.parseInt(qts3);
              String qts4=request.getParameter("qt7");
        int qt7=Integer.parseInt(qts4);
      
       session.setAttribute("pid", pid);
         
         db.DbConnection m1=(db.DbConnection)session.getAttribute("db");
                   if(m1==null){
                       m1=new db.DbConnection();
                       session.setAttribute("db", m1);
                   }
         
     int x = m1.paper(email,paper, branch, semester, subject, tm, time, qpd, qt2, qt4, qt5, qt7,pid);
     if(x==1){
         response.sendRedirect("setpaper1.jsp");
     }else{
         session.setAttribute("msg","Input data Failed");
         response.sendRedirect("setpaper.jsp");
     }
    }else{
session.setAttribute("msg", "Please !Login First");
response.sendRedirect("home.jsp");
}
    
    %>
   