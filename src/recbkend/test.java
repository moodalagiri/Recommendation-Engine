package recbkend;

import java.util.Vector;

import org.rosuda.REngine.REXP;
import org.rosuda.REngine.REXPMismatchException;
import org.rosuda.REngine.REngineException;
import org.rosuda.REngine.Rserve.RConnection;
import org.rosuda.REngine.Rserve.RserveException;

public class test {
	/*RConnection connection = null;
	public test() throws RserveException{
		connection = new RConnection();
		connection.eval("source('D:\\\\retsuggestions.R')");
	}*/

    public String[]  mean(String searchstring) throws REngineException, REXPMismatchException {

    	RConnection connection = null;
        
        try {
            /* Create a connection to Rserve instance running on default port
             * 6311
             */
        	 connection = new RConnection();
             connection.eval("source('D:\\\\retsuggestions.R')");
            connection.assign("x",searchstring);
            REXP sum=connection.eval("e = getmoviesuggestion(x)");
            String[] titles = connection.eval("e").asStrings();
            return titles;

        } catch (RserveException e) {
            e.printStackTrace();
        }
        finally{
        	connection.close();
        }
        return null;
        } 
    public String[] getreco(String title)throws REngineException, REXPMismatchException {
    	 RConnection connection = null;
        
        try {   
        	connection = new RConnection();
            connection.eval("source('D:\\\\retsuggestions.R')");
            System.out.println(title);
            int no = Integer.parseInt(title);
            REXP total = connection.eval("e = makerecommendations("+no+")");
           String[] movies = connection.eval("e").asStrings();
            return movies;

        } catch (RserveException e) {
            e.printStackTrace();
        }
        finally{
        	connection.close();
        }
        return null;
        } 
    }
    
