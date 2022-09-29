package sit218.coachwebapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import sit218.coachwebapp.entity.Question;

@Controller
@RequestMapping("/question-answer")
public class QuestionController {
	
	@RequestMapping("/showqanda-Form")
	public String showForm(Model model) {
		Question question = new Question();	
		model.addAttribute("qanda", question);
		return "qanda-form";
	}
}

