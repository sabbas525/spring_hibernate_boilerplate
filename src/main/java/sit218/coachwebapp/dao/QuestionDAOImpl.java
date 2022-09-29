package sit218.coachwebapp.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import sit218.coachwebapp.entity.Question;


public class QuestionDAOImpl implements QuestionDAO{
	
	SessionFactory factory;

	public QuestionDAOImpl() {
		factory = new Configuration()
				.configure("hibernate.cfg.xml")
				.addAnnotatedClass(Question.class)
				.buildSessionFactory();
	}
	
	@Override
	public void updateQuestion(Question question) {
		Session session = factory.getCurrentSession();
		try {
			session.beginTransaction();
			session.update(question);
			session.getTransaction().commit();
		}
		finally {
			session.close();
		}	
	}
	@Override
	public void insertQuestion(Question question) {
		Session session = factory.getCurrentSession();
		try {
			session.beginTransaction();
			session.save(question);
			session.getTransaction().commit();
		}
		finally {
			session.close();
		}	
	}

	/* 
	 * If the question exists in the database, this method returns
	 * the persistent question. Otherwise, it inserts a new question
	 * with the name and age provided as an argument. 
	 */
	@Override
	public Question retrieveQuestion(Question question) {
		Session session = factory.getCurrentSession();
		try {
			//use the session object to check for a question
			//start a transaction
			session.beginTransaction();
			
			//create the query
			String hql = "from Question where question = '"+
					question.getQuestion()+"' and answer = '"+
					question.getAnswer()+"' and knowledgeareas = '"+
					question.getKnowledgeareas()+"'";
			Query<Question> query = session.createQuery(hql);
			//Obtain the query results
			List<Question> questions = query.getResultList();
			if (questions.isEmpty()) {
				throw new RuntimeException("There is no question: "+question.toString());
			}
			else if (questions.size() > 1) { 
				throw new RuntimeException("More than one question: "
						+ question.toString() +" exists");
			}
			else {
				return questions.get(0);
			}
		}
		finally {
			session.close();
		}
	}

	/* 
	 * If the question exists in the database, this method returns
	 * the persistent question. Otherwise, it inserts a new question
	 * with the question, answer and knowledge area provided as an argument. 
	 */
	@Override
	public boolean existsQuestion(Question question) {
		Session session = factory.getCurrentSession();		
		try {
			session.beginTransaction();
			//create the query
			String hql = "from Question where question = '"+
					question.getQuestion()+"' and answer = '"+
					question.getAnswer()+"'";
			//Obtain the query results
			List<Question> questions = session.createQuery(hql).getResultList();
			return !questions.isEmpty();
		}
		finally {
			session.close();
		}
	}
	
	@Override
	public boolean existsKnowledge(Question question) {
		Session session = factory.getCurrentSession();		
		try {
			session.beginTransaction();
			//create the query
			String hql = "from Question where knowledgeareas = '"+ question.getKnowledgeareas()+"'";
			System.out.print(session.createQuery(hql));
			List<Question> questions =session.createQuery(hql).getResultList();
			
			return !questions.isEmpty();	
		}
		finally {
			session.close();
		}
	}
	//queries the database to get all questions for a knowledge base
	@Override
	public  List<Question> queryQandA(Question question) {
		
		Session session = factory.getCurrentSession();
		try {
			session.beginTransaction();
			
			String hql = "from Question where knowledgeareas = '"+ question.getKnowledgeareas()+"'";
			List<Question> questions = session.createQuery(hql).getResultList();
			
			return questions;
		}
		finally {
			session.close();
		}
	}
	
	@Override
	protected void finalize() throws Throwable {
		//Close session factory before destroying the object
		factory.close();
	}
	
}
