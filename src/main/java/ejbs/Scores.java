package ejbs;

import java.util.Date;

import jakarta.ejb.LocalBean;
import jakarta.ejb.Stateless;

/**
 * Session Bean implementation class Scores
 */
@Stateless
@LocalBean
public class Scores implements scoreRemote {

	
	public String usuario;
	public String score;

	
    /**
     * Default constructor. 
     */
    public Scores() {
    }
    
    
 public void Define(String usuario, String score) {
    	
    	this.usuario = usuario;
    	this.score = score;
    	
    }


@Override
public void setScore(String usuario, String score) {
	// TODO Auto-generated method stub
	
}

}
