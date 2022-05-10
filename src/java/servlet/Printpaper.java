
package servlet;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.*;


    







public class Printpaper extends HttpServlet {

    

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {
       HttpSession session=request.getSession(); 
       PrintWriter out=null;
          HashMap hm= (HashMap) session.getAttribute("hm");
          String email=(String) session.getAttribute("email");
       if(email!=null){
        try{
             
      
    db.DbConnection db=(db.DbConnection)session.getAttribute("db");
            if(db==null){
                db=new db.DbConnection();
                session.setAttribute("db",db);
            }
                   
               String id=request.getParameter("id");
              
               int id1=Integer.parseInt(id);
               HashMap hm1= db.getpaper(id1,email);
               String branch=null;
               String semester=null;
               String subject=null;
                String paper=null;
                 String qpd=null;
                int tm=0;
               for(int  i=0;i<hm1.size()-4;){
                      hm1.get(++i);
                      paper= (String) hm1.get(++i);
                     branch=   (String) hm1.get(++i);
                    semester= (String) hm1.get(++i);
                    subject=(String) hm1.get(++i);
                
                    int totalmarks=(int) hm1.get(++i);
                    tm=totalmarks;
               }
               
            
                
               
                   
               
               int qt2=(int) hm1.get("qt2" );
               int qt4=(int) hm1.get("qt4" );
                int qt5=(int) hm1.get("qt5" );
               int qt7=(int) hm1.get("qt7" );
               
           HashMap hm3=db.getqt2(branch, semester,subject,2  ,qt2);
           HashMap hm4=db.getqt2(branch, semester,subject,4  ,qt4);
               
           HashMap hm5=db.getqt2(branch, semester,subject,5  ,qt5);
           HashMap hm7=db.getqt2(branch, semester,subject,7  ,qt7);
            hm1.clear();
             Document document = new Document(PageSize.A4);
             response.setContentType("application/pdf");
             response.setHeader("Content-disposition","inline; filename="+paper+".pdf");  
             OutputStream os = response.getOutputStream();
             PdfWriter.getInstance(document, os);

            document.open();
            
            
            Paragraph para1 =new Paragraph("                       "+"                              "+"Branch :"+branch);
            Paragraph para2 =new Paragraph("                       "+"                              "+"Semester :"+semester);
            Paragraph para3 =new Paragraph("                       "+"                              "+"Subject :"+subject);
            Paragraph para4 =new Paragraph("                       "+"                              "+"Total Marks :"+tm);
            Paragraph para5 =new Paragraph("                       "+"                              "+"time  Allowed :"+tm);
            Paragraph para6 =new Paragraph("----------------------------------------------------------------------------------------------------------------");
            Paragraph para7 =new Paragraph("Instruction:----");
            Paragraph para8=new Paragraph("Write neat and clean.Donot over write");
            Paragraph para9=new Paragraph("All  Questions are compulsory");
            Paragraph para10=new Paragraph("      ");
            document.add(para1);
           document.add(para2);
           document.add(para3);
           document.add(para4);
           document.add(para5);
           document.add(para6);
           document.add(para7);
           document.add(para8);
           document.add(para9);
           document.add(para10);
          
           int count=0;
            Integer x=0;
            HashMap fin;
             document.addTitle("Question Paper");
             fin=new HashMap();
            if(!hm3.isEmpty()){
               
           
        
         for(int i=0;i<hm3.size();){
     
         fin.put(++x, hm3.get(++i));
            
            
                }
            }
             if(!hm4.isEmpty()){
                
          
         
    for(int i=0;i<hm4.size();){
     
         fin.put(++x, hm4.get(++i));
            
            
                }
             }
             if(!hm5.isEmpty()){
             
          
         
    for(int i=0;i<hm5.size();){
     
         fin.put(++x, hm5.get(++i));
            
            
                }
             }
             if(!hm7.isEmpty()){
               
          
         
          for(int i=0;i<hm7.size();){
     
         fin.put(++x, hm7.get(++i));
            
            
                }
             }
             
             
              
              
                if(!fin.isEmpty()){
                    for(int i=0;i<fin.size();){
                     Paragraph paragraph;
                          
                     
              paragraph  = new Paragraph(++count+"."+"  "+(String)fin.get(++i)+"                                                           ");
             document.add(paragraph);
                    }
                     
       document.addCreator("created by :Question Bank Generator designed by ER. Akshat Akarsh");
             
                    
                }else{
                session.setAttribute("msg","No Question added to this paper");
                response.sendRedirect("dashboard.jsp");
            }
           
             
         
         
      
             document.close();
             os.close();
             
             }catch(DocumentException | IOException | ClassNotFoundException | NumberFormatException | SQLException ex){
        
        session.setAttribute("msg","no paper added to this subject");
        response.sendRedirect("dashboard.jsp");
        
    }   
           }else{
               session.setAttribute("msg","Please !Login First");
               response.sendRedirect("home.jsp");
           }

   
    
}
}
