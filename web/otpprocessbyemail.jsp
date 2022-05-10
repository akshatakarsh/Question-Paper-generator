

<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.Message"%>

<%@page import="javax.mail.Session"%>
<%@page import="java.util.Properties"%>
<%
    String email=(String)session.getAttribute("email"); 
   String otp=(String)session.getAttribute("otp");
    
     session.setAttribute("email",email);
  try{
    if(otp!=null){
      
        session.setAttribute("otp",otp);
         final String SEmail="akshatakarsh1@gmail.com";
            final String SPass="makalu890";
            final String REmail=email;
            final String Sub="Reset your password using otp";
            final String Body="Your 6 digit OTP is " +" "+otp+" "+"for Question Paper Generator account";
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
            response.sendRedirect("otpenter.jsp");
    }else{
            session.setAttribute("msg","Invalid Email ID!");
            response.sendRedirect("resetpass.jsp");
    }
    }catch(javax.mail.SendFailedException ex){
           session.setAttribute("msg","Invalid Email ID , Please enter valid email id!");
            response.sendRedirect("home.jsp");
            }catch(Exception ex){
           session.setAttribute("msg",ex.getMessage());
            response.sendRedirect("home.jsp");
            }
    
%>