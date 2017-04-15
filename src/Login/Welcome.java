package Login;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import org.apache.commons.io.IOUtils;
import org.rosuda.JRI.Rengine;
import org.rosuda.REngine.REXPMismatchException;
import org.rosuda.REngine.REngineException;

import recbkend.test;

import java.sql.*;
import java.util.LinkedHashMap;
import java.util.Map;

public class Welcome extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String search = request.getParameter("search");
        /*
        PrintWriter out = response.getWriter();
        out.println("Welcome"+username);
        out.println("<br>"); */
       try {
    	   
		String[] titles = new test().mean(search);
		request.setAttribute("titles", titles);


		RequestDispatcher rs = request.getRequestDispatcher("home.jsp");
        rs.forward(request, response);
		
	} catch (REngineException | REXPMismatchException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
       // double mean = new test().mean();
        //out.println("The mean is" +mean);
       /* try {
        Process shell = Runtime.getRuntime().exec(new String[] {"C:\\Program Files\\R\\R-3.2.1\\bin\\Rscript.exe",		   
     "C:\\Users\\Bhavana\\Documents\\recommendationengine.R" }); 
       BufferedReader reader =  new BufferedReader(new InputStreamReader(shell.getInputStream()));
       String line;
       while ((line = reader.readLine()) != null) {
           System.out.println(line);

       }   
    } catch (IOException e) {
        e.printStackTrace();
    } */
        
        
    }
}