<%-- 
    Document   : forgetpassprocess
    Created on : Apr 4, 2020, 7:17:51 PM
    Author     : Akshat
--%>

<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.Message"%>

<%@page import="javax.mail.Session"%>
<%@page import="java.util.Properties"%>
<%
    String email=request.getParameter("email");
    db.DbConnection m1= (db.DbConnection)session.getAttribute("db");
    if(m1==null){
        m1=new db.DbConnection();
        session.setAttribute("db", m1);
    }
    String e=m1.getPassByEmail(email);
    if(e!=null){
         final String SEmail="akshatakarsh1@gmail.com";
            final String SPass="Singhmar@125";
            final String REmail=email;
            final String Sub="Your Password is Here from Question Ppaer Generator!";
            final String Body="Your Email Id: "+email+" and Password: "+e;
            //mail send Code
            Properties props=new Properties();
            props.put("mail.smtp.host","smtp.gmail.com");
            props.put("mail.smtp.socketFactory.port","465");
            props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
            props.put("mail.smtp.auth","true");
            props.put("mail.smtp.port","465");
            Session ses=Session.getInstance(props,
            new javax.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication(){
                    return new PasswordAuthentication(SEmail,SPass);
                }
            }
            );
            Message message=new MimeMessage(ses);
            message.setFrom(new InternetAddress(SEmail));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(REmail));
            message.setSubject(Sub);
            message.setContent(Body,"text/html" );
            Transport.send(message);
            session.setAttribute("msg","Mail Sent successfully.");
            response.sendRedirect("home.jsp");
    }else{
            session.setAttribute("msg","Invalid Email ID!");
            response.sendRedirect("forgetpass.jsp");
    }
    
    
%>