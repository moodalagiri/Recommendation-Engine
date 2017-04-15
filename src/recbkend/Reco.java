package recbkend;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.rosuda.REngine.REXPMismatchException;
import org.rosuda.REngine.REngineException;

public class Reco extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String Selection = request.getParameter("Selection");
        PrintWriter out = response.getWriter();
       out.println(Selection);
    		String[] movies;
			try {
				movies = new test().getreco(Selection);
				request.setAttribute("movies", movies);
				Cookie[] cookies = request.getCookies();
		        String userName = null;
				if (cookies != null) {
				 for (Cookie cookie : cookies) {
				   if ( cookie.getName().equals("user")) {
				      userName = cookie.getValue();
				      
				    }
				  }
				}
		
				/*int value = Integer.parseInt(Selection.trim());
				String mySelection = null;
				//String search = new recbkend.test().getString();
				String[] array = null;
				for(int i = 0 ; i < array.length ; i ++)
				{
					if ( i == value)
					mySelection = array[i].toString();
				}*/
				
				String mySelection = request.getParameter("moviename");
				System.out.println(mySelection);
			   System.out.println(mySelection);
			   request.setAttribute("movie", mySelection);
              
				String[] users = new recbkend.Cosine().CosSim(userName);
				request.setAttribute("users",users);
				RequestDispatcher rs = request.getRequestDispatcher("recom.jsp");
		        rs.forward(request, response);
    		
    		}catch (REngineException | REXPMismatchException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    		
     
    }

}
