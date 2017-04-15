package Login;

import java.sql.*;

public class Validate
 {
     public static boolean checkUser(String username,String pass) 
     {
      boolean st =false;
      try{

	 //loading drivers for postgresql
    	  Class.forName("org.postgresql.Driver");

 	 //creating connection with the database 
         Connection con= DriverManager
                 .getConnection("jdbc:postgresql://localhost:5432/recommendationdb",
                         "postgres", "root");
                     
         PreparedStatement ps =con.prepareStatement
                             ("select * from userlogin where username=? and password=?");
         ps.setString(1, username);
         ps.setString(2, pass);
         ResultSet rs =ps.executeQuery();
         st = rs.next();
        
      }catch(Exception e)
      {
          e.printStackTrace();
      }
         return st;                 
  }  
     public static boolean RegisterUser(String username,String pass,String email) 
     {
      boolean st =false;
      try{

	 //loading drivers for postgresql
    	  Class.forName("org.postgresql.Driver");

 	 //creating connection with the database 
         Connection con= DriverManager
                 .getConnection("jdbc:postgresql://localhost:5432/recommendationdb",
                         "postgres", "root");
                     
         PreparedStatement ps =con.prepareStatement
                             ("insert into userlogin(username,password,email) values (?,?,?)");
         ps.setString(1, username);
         ps.setString(2, pass);
		 ps.setString(3, email);
         ps.executeUpdate();
         st = true;
        
      }catch(Exception e)
      {
          e.printStackTrace();
      }
         return st;                 
  }    
}