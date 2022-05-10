
package servlet;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import javax.servlet.annotation.MultipartConfig;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;


@MultipartConfig
public class Register extends HttpServlet{
    public void service(HttpServletRequest req,HttpServletResponse res) throws IOException{
        res.setContentType("text/html;charset=UTF-8");
        HttpSession session =req.getSession();
        try{
            String name=req.getParameter("name");
            String  email=req.getParameter("email");
            String mobile=req.getParameter("mobile");
            String pass=req.getParameter("pass");
           
            Part p= req.getPart("img");
              java.io.InputStream in;
    if(p!=null){
        in = p.getInputStream();
    }else{
        in=null;
    }
            db.DbConnection m1=(db.DbConnection)session.getAttribute("db");
            if(m1==null){
                 m1=new db.DbConnection();
                 session.setAttribute("db",m1);
            
            }
             String x=   m1.insertUser(name, email, mobile, pass, (InputStream) in);
           HashMap hm=new HashMap();
                   hm.put("name",name);
             hm.put("email", email);
             hm.put("mobile",mobile);
           if(x.equalsIgnoreCase("done")){
                  
             

                 session.setAttribute("hm", hm);
                 res.sendRedirect("dashboard.jsp");

               
        }else if(x.equalsIgnoreCase("already")){
            session.setAttribute("msg","Email Id Already exist in database");
            res.sendRedirect("home.jsp");
                 
             }else{
            session.setAttribute("msg", x);
            res.sendRedirect("home.jsp");
        }
        }catch(Exception ex){
           session.setAttribute("msg", ex.getMessage());
             res.sendRedirect("home.jsp");
        }
    }
    
}
