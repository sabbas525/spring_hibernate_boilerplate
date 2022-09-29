package sit218.coachwebapp.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import sit218.coachwebapp.dao.QuestionDAO;
import sit218.coachwebapp.dao.QuestionDAOImpl;
import sit218.coachwebapp.entity.Question;

@Controller
@RequestMapping("/question-answer")
public class CoachController {
	
	@RequestMapping("/process-query")
	public String querydatabase(@Valid @ModelAttribute("query")Question qanda, 
			BindingResult validationErrors, Model model) {
		QuestionDAO dao = new QuestionDAOImpl();
			
			if(!dao.existsKnowledge(qanda)) {
				model.addAttribute("message","<h1 style=\"color:Tomato;text-align:center;\">Knowledge : "
						+ qanda.getKnowledgeareas() +"</h1><h3 style=\"color:Tomato;text-align:center;\"> has no Question and Answers"
						+" in the database<br>Please try again</h3><hr style=\"width:50%\">");
				model.addAttribute("list",null);	
			}
			else {
				List<Question> qandalist;
				qandalist = dao.queryQandA(qanda);
				model.addAttribute("list",qandalist);
			}
		return "query-dbresult";
	}

	@RequestMapping("/showquery-Form")
	public String showForm(Model model) {
		Question question = new Question();
		model.addAttribute("qanda", question);
		return "query-form";
	}
	
	@RequestMapping("/process-qanda")
	public String addtodatabase(@Valid @ModelAttribute("qanda")Question qanda, 
			BindingResult validationErrors, Model model) {
		if(validationErrors.hasErrors()) 
			return "question-form";
	
		QuestionDAO dao = new QuestionDAOImpl();
			if(!dao.existsQuestion(qanda))
				dao.insertQuestion(qanda);
			else {
				model.addAttribute("message","<hr style=\"width:30%\"><br>Question : " 
						+ qanda.getQuestion()+"<br>Answer : "+ qanda.getAnswer()+ "<br>Knowledge : "+qanda.getKnowledgeareas()+""
						+"<br><h1 style=\"color:Tomato;text-align:center;\">This Question and Answer"
						+" already Exists</h1><h2 h1 style=\"text-align:center;\" style=\"text-align:center;\"><br>Please try again</h1><hr style=\"width:30%\">");
				return "addtodatabase";
			}
			qanda = dao.retrieveQuestion(qanda);
			model.addAttribute("message","Question : " + qanda.getQuestion()+"<br>Answer : "+ qanda.getAnswer()+ "<br>Knowledge : "+qanda.getKnowledgeareas()+""
			+"<br><h1 style=\"color:green;text-align:center;\">The question has been successfully<br>added to the database");
		return "qanda-dbresult";
	}
	
}
