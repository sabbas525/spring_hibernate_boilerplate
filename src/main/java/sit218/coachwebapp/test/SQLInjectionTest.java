package sit218.coachwebapp.test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import sit218.coachwebapp.entity.Question;

public class SQLInjectionTest {
	
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.println("please enter the area of knowledge you want to search: ");
		String area = scanner.nextLine();
		scanner.close();
		String jdbcURL = "jdbc:mysql://localhost/questionanswerschema?" +
                "user=lecturer&password=Shadowfire147!";
		try {
			System.out.println("Connecting to Database");
			Connection conn =
		       DriverManager.getConnection(jdbcURL);
			System.out.println("Connection successful!");
			
			//Perform a query to sellect all questions relating to the area of knowledge
			// Ask connection to create statement
			Statement statement = conn.createStatement();
			String query = "SELECT * FROM question WHERE knowledgeareas = '"+ area+"'";
			System.out.println(query);
			ResultSet result = statement.executeQuery(query);
			//Display results
			while (result.next()) { //While there is still something left, store it and display it
				int id = result.getInt("id");
				String question = result.getString("question");
				String answer = result.getString("answer");
				String knowledgeareas = result.getString("knowledgeareas");
				System.out.println(question+", "+question+", "+ answer+ ", "+ knowledgeareas);
			}
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