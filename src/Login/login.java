package Login;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

	public class login extends HttpServlet {
	 
	    /**
		 * 
		 */
		private static final long serialVersionUID = 1L;

		protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        response.setContentType("text/html;charset=UTF-8");
	        PrintWriter out = response.getWriter();
	        String username = request.getParameter("USERNAME");
	        String pass = request.getParameter("PASSWORD");
	        if(Validate.checkUser(username, pass))
	        {
	        	
	            //RequestDispatcher rs = request.getRequestDispatcher("welcome.jsp");
	            //rs.forward(request, response);
	            
	                     Cookie loginCookie = new Cookie("user",username);
	                      //setting cookie to expiry in 30 mins
	                     loginCookie.setMaxAge(30*60);
	                     response.addCookie(loginCookie);
		        		
		        		RequestDispatcher rd=request.getRequestDispatcher("welcome.jsp");
		        		rd.forward(request, response);
		        	
		        
		       

	        }
	        else
	        {
	           out.println("Username or Password incorrect");
	           RequestDispatcher rs = request.getRequestDispatcher("index.html");
	           rs.include(request, response);
	        }
	    }  
	}

