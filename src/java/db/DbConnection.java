
package db;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;

/**
 *
 * @author Akshat
 */
public class DbConnection {
    private Connection con;
    private Statement st;
    private PreparedStatement checkLogin,getP,insertUser,getUserPhoto,updatepass,changepassbymobile,getBranchDetails,insertbranch,
            ctb,insertsub,getBranchBySubject,getpaper1, getqt2, insertpaper,getpaper,getsubcodebyunit,getBranchBysubcode,getsubdetails,getUnitBySubject,getDetailsbybranchsub,getQuestion,subcode,insertquestion,insertUnit,getUnitDetails;
   
  
    public DbConnection() throws ClassNotFoundException, SQLException{
        Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/qps", "root", "");
        st=con.createStatement();
        checkLogin=con.prepareStatement("select * from user where email=? and password=?");
        getP=con.prepareStatement("select password from user where email=?");
        insertUser=con.prepareStatement("insert into user (name,email,phone,password,photo)values(?,?,?,?,?)");
        getUserPhoto=con.prepareStatement("select photo from user where email=?");
        updatepass=con.prepareStatement("update   user set password= ? where email=?");
        changepassbymobile=con.prepareStatement("update user set password=? where phone=?");
      getBranchDetails  =con.prepareStatement("select * from branch where email=?");
      insertbranch=con.prepareStatement("insert into branch (branch,email,semester,status)values(?,?,?,?)");
      ctb=con.prepareStatement("select count(branch) from  branch");
        insertsub=con.prepareStatement("insert into subject (branch,email,semester,subjectcode,subjectname,status)values(?,?,?,?,?,?)");
        getsubdetails=con.prepareStatement("select * from subject where email=?");
        getUnitBySubject=con.prepareStatement("select unitno from subject where subjectname=? ");
        getQuestion=con.prepareStatement("select * from question");
        subcode=con.prepareStatement("select subjectcode from subject where subjectname=?");
        insertquestion=con.prepareStatement("insert into question (email,branch,semester,subject,unit,qtype,question,status)values(?,?,?,?,?,?,?,?)");
        insertUnit=con.prepareStatement("insert into unit  (subjectcode,branch,subject,unitno,unitname,status) values(?,?,?,?,?,?)");
           getUnitDetails=con.prepareStatement("select * from unit details");
           getBranchBySubject=con.prepareStatement("select branch from unit where subject=?");
           getBranchBysubcode=con.prepareStatement("select branch from subject where subjectcode=?");
           getsubcodebyunit=con.prepareStatement("select subjectcode from subject where subjectname=?");
           getDetailsbybranchsub=con.prepareStatement("select * from unit where subject=? and branch=?");
           insertpaper=con.prepareStatement("insert into paper(email,papername,branch,semester,subject,totalmarks,time,qpd,qt2,qt4,qt5,qt7,pid)values(?,?,?,?,?,?,?,?,?,?,?,?,?)" );
           getpaper=con.prepareStatement("select * from paper where pid=? and email=?");
            getpaper1=con.prepareStatement("select * from paper where email=? ");
           getqt2=con.prepareStatement("select question from question where branch=? and semester=? and subject=? and qtype=?  limit ?");
          
    }
   
   
    
    public HashMap  clogin(String e,String p) throws SQLException {
         HashMap hm=new HashMap();
        checkLogin.setString(1,e);
        checkLogin.setString(2, p);
        ResultSet r=checkLogin.executeQuery();
        if(r.next()){
            hm.put("name",r.getString(1));
            hm.put("email",r.getString(2));
            hm.put("phone",r.getString(3));
            return hm;
        }
        else {
            return null;
        }
    }
    
    public String getPassByEmail(String e) throws SQLException{
        String k=null;
       getP.setString(1, e);
       
       ResultSet r=getP.executeQuery();
       if(r.next()){
           k=r.getString("password");
           
           
       }
       
          
       
           return k;
    }
    public String insertUser(String name,String email,String mobile,String password,java.io.InputStream in) throws SQLException{
        
         String k=null;
    
        try{
        insertUser.setString(1, name);
        insertUser.setString(2, email);
        insertUser.setString(3, mobile);
        insertUser.setString(4,password);
        insertUser.setBinaryStream(5, in);
       int x= insertUser.executeUpdate();
      
       if(x==1)
           k= "done";
       else
           k ="error";
       
        }catch(java.sql.SQLIntegrityConstraintViolationException e){
           k= "email Id Already Exist In database";
    }
        return k;
}
   public byte[] getUserPhoto(String e) throws SQLException{
        getUserPhoto.setString(1, e);
        ResultSet r=getUserPhoto.executeQuery();
        if(r.next()){
            return r.getBytes("photo");
        }else{
               return null;
        }
     
    }
   public int updatepass(String password,String email) throws SQLException{
       updatepass.setString(1,password);
       updatepass.setString(2,email);
       int x=updatepass.executeUpdate();
        
       return x;
   }
    public int changepassbymobile(String password,String email) throws SQLException{
       changepassbymobile.setString(1,password);
       changepassbymobile.setString(2,email);
       int x=changepassbymobile.executeUpdate();
        
       return x;
   }
    public HashMap getBranchDetails(String email) throws SQLException{
        getBranchDetails.setString(1, email);
        Integer x=0;
       ResultSet r=getBranchDetails.executeQuery();
       HashMap hm=new HashMap();
       while(r.next()){
           hm.put(++x,r.getInt("eid"));
           hm.put(++x,r.getString("branch"));
           hm.put(++x,r.getString("semester"));
           hm.put(++x,r.getString("status"));
       }
        return hm;
        
    }
    public int insertBranch(String branch,String email,String semester,String status) throws SQLException {
        insertbranch.setString(1, branch);
        insertbranch.setString(2,email);
         insertbranch.setString(3, semester);
          insertbranch.setString(4, status);
          
       int x=   insertbranch.executeUpdate();
      
       if(x==1){
            x=1;
       }else{
           x=0;
       }
        return x;
        
    }
   public  int ctb() throws SQLException{
       ResultSet r=ctb.executeQuery();
        Integer x=0;
      if(r.next()){
    x  =(Integer)r.getInt(1);
      }
      return x;
   }
   public String insertsub(String branch,String email,String semester,String subjectcode,String subjectname,String status) throws SQLException{
        insertsub.setString(1,branch);
       insertsub.setString(2,email);
      insertsub.setString(3,semester);
      insertsub.setString(4,subjectcode);
      insertsub.setString(5,subjectname);
      insertsub.setString(6,status);
    
      int x= insertsub.executeUpdate();
      String m="";
      if(x==1){
        m="done";
       
   }else{
          m="error";
      }
      return m;
   }
    public HashMap getsubdetails(String email) throws SQLException{
            getsubdetails.setString(1,email);
        Integer x=0;
       ResultSet r=getsubdetails.executeQuery();
       HashMap hm=new HashMap();
       while(r.next()){
           hm.put(++x,r.getInt("sid"));
           hm.put(++x,r.getString("branch"));
           hm.put(++x,r.getString("semester"));
           hm.put(++x,r.getString("subjectcode"));
           hm.put(++x,r.getString("subjectname"));
         
          
             hm.put(++x,r.getString("status"));
       
       }
        return hm;
        
    }
   public String  getBranchBysubcode(String subjectname) throws SQLException{
       getBranchBysubcode.setString(1, subjectname);
       ResultSet r=getBranchBysubcode.executeQuery();
       String x="";
      if(r.next()){
          x=r.getString("branch");
      }
      
       
        return x;
      
   }
   public HashMap getQuestion() throws SQLException{
        Integer x=0;
       ResultSet r=getQuestion.executeQuery();
       HashMap hm=new HashMap();
       while(r.next()){
           hm.put(++x,r.getInt("qid"));
           hm.put(++x,r.getString("branch"));
           hm.put(++x,r.getString("semester"));
           hm.put(++x,r.getString("subject"));
           
           hm.put(++x,r.getInt("unit"));
           hm.put(++x,r.getInt("qtype"));
           hm.put(++x,r.getString("question"));
            hm.put(++x,r.getString("status"));
       
       }
       
       
        return hm;
   }
    public HashMap  subcode(String subjectname) throws SQLException{
       subcode.setString(1, subjectname);
       ResultSet r=subcode.executeQuery();
       HashMap hm=new HashMap();
       Integer x=0;
       if(r.next()){
           hm.put(++x, r.getString("subjectcode"));
       }
        return hm;
       
   }
     public HashMap  getsubcodebyunit(String subjectname) throws SQLException{
       getsubcodebyunit.setString(1, subjectname);
       ResultSet r=getsubcodebyunit.executeQuery();
       HashMap hm=new HashMap();
       Integer x=0;
       if(r.next()){
           hm.put(++x, r.getString("subjectcode"));
       }
        return hm;
       
   }
    public int insertquestion(String email,String branch,String semester,String subject,int unit,int qtype,String question,String status) throws SQLException{
        insertquestion.setString(1,email);
        insertquestion.setString(2,branch);
        
        insertquestion.setString(3,semester);
        insertquestion.setString(4, subject);
       insertquestion.setInt(5, unit);
       insertquestion.setInt(6, qtype);
      insertquestion.setString(7, question);
      insertquestion.setString(8, status);
         int x=insertquestion.executeUpdate();
        return x;
    }
    public int insertunit(String subjectcode,String Branch,String subject,int unitno,String unitname,String status) throws SQLException{
        int x=0;
        
        insertUnit.setString(1, subjectcode);
        insertUnit.setString(2, Branch);
        insertUnit.setString(3, subject);
        insertUnit.setInt(4, unitno);
        insertUnit.setString(5, unitname);
        insertUnit.setString(6, status);
        x=insertUnit.executeUpdate();
        return x;
        
    }
     public HashMap getUnitDetails() throws SQLException{
        Integer x=0;
       ResultSet r=getUnitDetails.executeQuery();
       HashMap hm=new HashMap();
       while(r.next()){
           hm.put(++x,r.getInt("uid"));
           hm.put(++x,r.getString("subjectcode"));
           hm.put(++x,r.getString("subject"));
           
           
           hm.put(++x,r.getInt("unitno"));
           hm.put(++x,r.getString("unitname"));
         
         
            hm.put(++x,r.getString("status"));
       
       }
        return hm;
     }
  public HashMap getBranchBySubject(String subject) throws SQLException{
      getBranchBySubject.setString(1, subject);
      HashMap x=new HashMap();
      
   ResultSet r=   getBranchBySubject.executeQuery();
   if(r.next()){
      x.put(1,r.getString("branch"));
      
   }
      return x;
  }
  public HashMap getDetailsbybranchsub(String subject,String branch) throws SQLException{
        getDetailsbybranchsub.setString(1, subject);
        getDetailsbybranchsub.setString(2, branch);
      Integer x=0;
       ResultSet r=getDetailsbybranchsub.executeQuery();
      
       HashMap hm=new HashMap();
       while(r.next()){
          
           hm.put(++x,r.getInt("uid"));
           hm.put(++x,r.getString("branch"));
           hm.put(++x,r.getString("subjectcode"));
           hm.put(++x,r.getString("subject"));
             
           hm.put(++x,r.getInt("unitno"));
           
           hm.put(++x,r.getString("unitname"));
         
            hm.put(++x,r.getString("status"));
       
       }
        return hm;
  }
   public int paper(String email,String papername,String branch,String semester,String subject,int totalmarks,String time,String qpd,int qt2,int qt4,int qt5 ,int qt7,int pid) throws SQLException{
         insertpaper.setString(1,email);
       insertpaper.setString(2,papername);
        insertpaper.setString(3,branch);
        insertpaper.setString(4,semester);
        insertpaper.setString(5,subject);
        insertpaper.setInt(6,totalmarks);
        insertpaper.setString(7,time);
        insertpaper.setString(8,qpd);
        insertpaper.setInt(9,qt2);
        insertpaper.setInt(10,qt4);
        insertpaper.setInt(11,qt5);
        insertpaper.setInt(12,qt7);

        insertpaper.setInt(13,pid);
      
         int x=insertpaper.executeUpdate();
        return x;
    }
   public HashMap getpaper(int pid,String email) throws SQLException{
       getpaper.setInt(1, pid);
       getpaper.setString(2, email);
        Integer x=0;
       ResultSet r=getpaper.executeQuery();
       HashMap hm=new HashMap();
       while(r.next()){
           hm.put(++x,r.getInt("pid"));
           hm.put(++x,r.getString("papername"));
           hm.put(++x,r.getString("branch"));
           hm.put(++x,r.getString("semester"));
          
           hm.put(++x,r.getString("subject"));
          
             hm.put(++x,r.getInt("totalmarks"));
             hm.put("qt2",r.getInt("qt2"));
              hm.put("qt4",r.getInt("qt4"));
               hm.put("qt5",r.getInt("qt5"));
                hm.put("qt7",r.getInt("qt7"));
       }
        return hm;
   }    
    public HashMap getqt2(String branch,String semester,String subject,int qt,int l) throws SQLException{
       
        
        getqt2.setString(1,branch);
         getqt2.setString(2,semester);
           getqt2.setString(3,subject);
          getqt2.setInt(4,qt);
          getqt2.setInt(5,l);
        Integer x=0;
        HashMap hm=new HashMap();
       ResultSet r=getqt2.executeQuery();
      
       while(r.next()){
           hm.put(++x,r.getString("question"));
          
         
          
          
       
       }
        return hm;
   }    
     public HashMap getpaper1(String email) throws SQLException{
             getpaper1.setString(1, email);
        Integer x=0;
       ResultSet r=getpaper1.executeQuery();
       HashMap hm=new HashMap();
       while(r.next()){
           hm.put(++x,r.getInt("pid"));
           hm.put(++x,r.getString("papername"));
           hm.put(++x,r.getString("branch"));
           hm.put(++x,r.getString("semester"));
          
           hm.put(++x,r.getString("subject"));
         
          
             hm.put(++x,r.getInt("totalmarks"));
       
       }
        return hm;
   }    
}