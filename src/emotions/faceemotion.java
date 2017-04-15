// // This sample uses the Apache HTTP client from HTTP Components (http://hc.apache.org/httpcomponents-client-ga/)
package emotions;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class faceemotion extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String entity = request.getParameter("resp");
        out.println(entity);
            if (entity != null) 
            {
            	
                
                String rating= entity.toString();
                

                 int hstart= rating.indexOf("happiness")+11;
                String happystart=rating.substring(hstart,hstart+8);
                
           
                
                int contempt =rating.indexOf("contempt") +10;
                String cstart=rating.substring(contempt, contempt+8);
                
              
                
                double sum = Double.parseDouble(happystart);
                double sum1 = Double.parseDouble(cstart);
                
                double finalrating = sum +sum1;
                
               
                int recorating=0;
                
                if(finalrating > 0 && finalrating <=2)
                {
                	recorating =1;
                }
                else if(finalrating > 2 && finalrating <4)
                {
                	recorating =2;
                }
                else if(finalrating > 4 && finalrating <6)
                {
                	recorating =3;
                }
                else if(finalrating > 6 && finalrating <8)
                {
                	recorating =4;
                }
                else
                {
                	recorating =5;
                }
           	 /*//loading drivers for postgresql
          	  try {
				Class.forName("org.postgresql.Driver");
			

       	 //creating connection with the database 
              Connection con= DriverManager.getConnection("jdbc:postgresql://localhost:5432/recommendationdb",
                               "postgres", "root");
                           
          
                System.out.println("The final recommendation rating is "+recorating);
				Cookie[] cookies = request.getCookies();
		        String userName = null;
				if (cookies != null) {
				 for (Cookie cookie : cookies) {
				   if ( cookie.getName().equals("user")) {
				      userName = cookie.getValue();
				      
				    }
				  }
				}
				PreparedStatement ps =con.prepareStatement("select userid,movieid,ratings from public.userrating order by userid,movieid");	
				*/
                RequestDispatcher rd=request.getRequestDispatcher("recom.jsp");
        		rd.forward(request, response);
          	  }
            /*catch (ClassNotFoundException e) {
  				// TODO Auto-generated catch block
  				e.printStackTrace();
  			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
            }*/
 
    }
}
