
package servlet;

import java.io.IOException;
import static java.lang.System.out;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;




public class otpgen extends HttpServlet{
    public void service(HttpServletRequest req,HttpServletResponse res) throws IOException{
        HttpSession session =req.getSession();
        String otp="";
        String email=req.getParameter("email"); 
        String mobile=req.getParameter("phone"); 
        
        
        for(int i=0;i<6;i++){
            otp=otp+(int)(Math.random()*10);
        }
         
       
        session.setAttribute("otp", otp);
        if(email !=null && mobile==null){
             session.setAttribute("email", email);
        res.sendRedirect("otpprocessbyemail.jsp");
        }else if(email ==null && mobile!=null){
             session.setAttribute("mobile", mobile);
            res.sendRedirect("sendSMS");
        }else{
            
            session.setAttribute("msg", "No email or Mobile number entered");
             res.sendRedirect("home.jsp");
        }
    }
        
        
    }