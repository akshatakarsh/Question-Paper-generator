
package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.*;


public class UpdatePass extends HttpServlet {
    
    public void service(HttpServletRequest req,HttpServletResponse res) throws  IOException{
        HttpSession session=req.getSession();
        String newpass=req.getParameter("newpass");
        String conpass=req.getParameter("conpass");
     String email =   (String)session.getAttribute("email");
    
     try{
        if(newpass.equals(conpass) & newpass!=null){
             db.DbConnection m1=(db.DbConnection)session.getAttribute("db");
        
            if(m1==null){
                 m1=new db.DbConnection();
                 session.setAttribute("db",m1);
           int x= m1.updatepass(newpass,email);
           if(x==0){
               
                session.setAttribute("msg", "Password reset again or enter password");
               res.sendRedirect("home.jsp");
           }else{
              session.setAttribute("msg", "Password changed Sucessfully !  Login with new password");
                res.sendRedirect("home.jsp");
           } }
        }else{
            session.setAttribute("msg", "new pass and con pass are not same  ");
                res.sendRedirect("home.jsp");
        }
        
        
    
    
}       catch (ClassNotFoundException ex) {
    
            session.setAttribute("msg",ex.getMessage());
            res.sendRedirect("home.jsp");
        } catch (SQLException ex) {
            session.setAttribute("msg",ex.getMessage());
            res.sendRedirect("home.jsp");
        }catch(Exception ex){
            session.setAttribute("msg",ex.getMessage());
            res.sendRedirect("home.jsp");
        }
    }
}
