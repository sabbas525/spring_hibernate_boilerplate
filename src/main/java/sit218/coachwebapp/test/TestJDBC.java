package sit218.coachwebapp.test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import sit218.coachwebapp.entity.Question;

public class TestJDBC {
	
	public static void main(String[] args) {
		String jdbcURL = "jdbc:mysql://localhost/questionanswerschema?" +
                "user=lecturer&password=Shadowfire147!";
		try {
			System.out.println("Connecting to Database");
			Connection conn =
		       DriverManager.getConnection(jdbcURL);
			System.out.println("Connection successful!");
		} catch (SQLException ex) {
		    // handle any errors
		    System.out.println("SQLException: " + ex.getMessage());
		    System.out.println("SQLState: " + ex.getSQLState());
		    System.out.println("VendorError: " + ex.getErrorCode());
		}
		
		//create session factory
		SessionFactory factory = new Configuration()
				.configure("hibernate.cfg.xml")
				.addAnnotatedClass(Question.class)
				.buildSessionFactory();
		
		//create session
		Session session = factory.getCurrentSession();

		try {
			//use the session object to save Java Object
			
			//Create a question object 
			Question question = new Question("What colour is a banana?", "Yellow", "General Knowledge");
				
			//start a transaction
			session.beginTransaction();
			
			//save the question object
			session.save(question);
			
			//commit transaction 
			session.getTransaction().commit();
			
		}
		finally {
			//close session and factory
			session.close();
			factory.close();
		}

	}

}	