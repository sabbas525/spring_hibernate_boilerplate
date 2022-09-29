package sit218.coachwebapp.dao;


import java.util.List;

import sit218.coachwebapp.entity.Question;

public interface QuestionDAO {
	
	public void updateQuestion(Question question);

	public void insertQuestion(Question question);

	public Question retrieveQuestion(Question question);

	public boolean existsQuestion(Question question);
	
	public boolean existsKnowledge(Question qanda);
	
	public List<Question> queryQandA(Question question);
	
}
