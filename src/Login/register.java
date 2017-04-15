package Login;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class register extends HttpServlet
{
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	 response.setContentType("text/html;charset=UTF-8");
	        PrintWriter out = response.getWriter();
	        
	        String username = request.getParameter("username");
	        String pass = request.getParameter("password");
	        String email = request.getParameter("email");
	        System.out.println(username);
	        if(Validate.RegisterUser(username,pass,email))
	        {
	            RequestDispatcher rs = request.getRequestDispatcher("welcome.html");
	            rs.forward(request, response);
	        }
	        else{
	        	out.println("Registration not successful");
	        }
	                    
 }   
}