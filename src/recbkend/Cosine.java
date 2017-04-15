package recbkend;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.*;
import java.sql.*;
import java.util.ArrayList;
import java.io.*;



public class Cosine
 {
     public String[] CosSim(String user) 
     {   
    	 int mostsimilaruser =0 ;
      boolean st =false;
      try{
	 //loading drivers for postgresql
    	  Class.forName("org.postgresql.Driver");

 	 //creating connection with the database 
        Connection con= DriverManager.getConnection("jdbc:postgresql://localhost:5432/recommendationdb",
                         "postgres", "root");
                     
    PreparedStatement ps =con.prepareStatement
                             ("select userid,movieid,ratings from public.userrating order by userid,movieid");		 
	PreparedStatement ps1 =con.prepareStatement
                             ("select max(userid) as uid from public.userrating ");
	PreparedStatement ps2 =con.prepareStatement
                             ("select max(movieid) as movieid from public.userrating ");	
	PreparedStatement ps3 =con.prepareStatement
            ("select userid from userlogin where username=? ");
	PreparedStatement ps4 =con.prepareStatement
            ("select movietitle from useritem M , userrating R where M.movieid = R.movieid and R.userid In "
            		+ "( select userid from userrating where userid = ?) LIMIT 10");
	
	ps3.setString(1, user);
	Statement stmt = con.createStatement();
        ResultSet rs =ps.executeQuery();
		ResultSet rs1 =ps1.executeQuery();
		ResultSet rs2 =ps2.executeQuery();
		ResultSet rs3 = ps3.executeQuery();
		rs1.next();
		rs2.next();
		int a = rs1.getInt("uid");
		
		int b = rs2.getInt("movieid");
		int userid = 0;
		while(rs3.next())
		{
			userid = rs3.getInt("userid");
		}
		double arr[][] = new double[944][1683];
        while (rs.next()) {
       //	System.out.println(rs.getInt("userid") + " " + rs.getInt("movieid") +  " " + rs.getInt("ratings"));	
          arr[rs.getInt("userid")][rs.getInt("movieid")] = rs.getInt("ratings");
		  
        }

	double max =0 ;
	
	for (int i = 1; i <= 943; i++) {
		
		double mult = 0;
		double sum_vector1 = 0;
		double sum_vector2 = 0;
		double root = 0;
		double cos_value= 0; 
		
		for (int j =1; j <= 1682; j++) {
			   if (i != userid) {
				mult = mult + arr[userid][j] * arr[i][j];
			   sum_vector1 = sum_vector1+  arr[userid][j] * arr[userid][j] ;
			   sum_vector2 = sum_vector2 +  arr[i][j] * arr[i][j] ;	
			   }
		}
		
     root = Math.sqrt(sum_vector1) * Math.sqrt(sum_vector2);
	 cos_value= mult / root ;
	 if ( cos_value > max){
		max = cos_value ; 
		mostsimilaruser   = i ;
		}

	}
    ps4.setInt(1, mostsimilaruser);
    ResultSet rs4 = ps4.executeQuery();
    ArrayList<String> movie = new ArrayList<String>();
    while(rs4.next())
    {
    	String movies = rs4.getString("movietitle");
    	movie.add(movies);
    }
    String[] mov = movie.toArray(new String[movie.size()]);
    return (String[]) mov;

	}catch(Exception e)
      {
          e.printStackTrace();
      }
	return null;
     
      
      
  }   
     
}