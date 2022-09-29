package sit218.coachwebapp.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Pattern;

@Entity
@Table(name = "qanda") // Just to be explicit
public class Question {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name= "idqanda")
	protected int idQandA;

//	@NotNull(message = "is required")
//	@Size(min = 1, message="is required") 

	@Column(name = "question")
	protected String question;

	
	@Pattern(regexp = "^[a-zA-Z0-9_]+$", message = "An answer should only be one word long")
	@Column(name = "answer")
	protected String answer;

	@Column(name = "knowledgeareas")
	protected String knowledgeareas;

	public Question(String question, String answer, String knowledgeareas) {
		super();
		this.question = question;
		this.answer = answer;
		this.knowledgeareas = knowledgeareas;
	}

	public Question() {
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	
	public String getKnowledgeareas() {
		return knowledgeareas;
	}

	public void setKnowledgeareas(String knowledgeareas) {
		this.knowledgeareas = knowledgeareas;
	}
	
	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	
	@Override
	public String toString() {
		return "question = [question: "+getQuestion()+", answer: "+getAnswer()+
				", knowledgeareas: "+getKnowledgeareas()+"]";
	}

}
