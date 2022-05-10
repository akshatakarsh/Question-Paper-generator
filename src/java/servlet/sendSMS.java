/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

/**
 *
 * @author Akshat
 */
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import javax.servlet.http.*;
 
public class sendSMS extends HttpServlet{
	public void  service(HttpServletRequest req,HttpServletResponse res) throws ProtocolException, MalformedURLException, IOException {
            HttpSession session=req.getSession();
            String mobile=(String)session.getAttribute("mobile"); 
   String otp=(String)session.getAttribute("otp");
    
     session.setAttribute("mobile",mobile);
     try {
     if(otp!=null){
		
			// Construct data
			String apiKey = "apikey=" + "oxgayOOtppM-QbguzeOPbyqhCEW2vorl8CJtpl7PoZ";
			String message = "&message=" + "Your 6 digit OTP is " +" "+otp+" "+"for Question Paper Generator account";
			String sender = "&sender=" + "QPG-AKT";
			String numbers = "&numbers=" + mobile;
			
			// Send data
			HttpURLConnection conn = (HttpURLConnection) new URL("https://api.textlocal.in/send/?").openConnection();
			String data = apiKey + numbers + message + sender;
			conn.setDoOutput(true);
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-Length", Integer.toString(data.length()));
			conn.getOutputStream().write(data.getBytes("UTF-8"));
			final BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			final StringBuffer stringBuffer = new StringBuffer();
			String line;
			while ((line = rd.readLine()) != null) {
				stringBuffer.append(line);
			}
			rd.close();
			
		 session.setAttribute("msg","Mail Sent successfully.");
            res.sendRedirect("otpenter.jsp");
    }else{
            session.setAttribute("msg","Invalid Email ID!");
            res.sendRedirect("resetpass.jsp");	
     }
		} catch (Exception ex) {
                     session.setAttribute("msg",ex.getMessage());
			res.sendRedirect("home.jsp");
			
		}
	
}
}