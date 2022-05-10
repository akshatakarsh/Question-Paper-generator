
package servlet;

import java.io.IOException;
import javax.servlet.http.*;


public class CheckPass extends HttpServlet {
    public void service(HttpServletRequest req,HttpServletResponse res) throws IOException{
        HttpSession session=req.getSession();
        String otp=req.getParameter("otp");
        String s=(String)session.getAttribute("otp");
        String email=(String)session.getAttribute("email");
        
        if(s.equals(otp)){
             session.setAttribute("otp",otp);
             session.setAttribute("email",email);
            res.sendRedirect("NewPassCreate.jsp");
        }else{
            session.setAttribute("msg", "Invalid Otp !please Enter again or Go to Home Page !!");
            res.sendRedirect("otpenter.jsp");
        }
        
    }
    
}
