package edu.isep.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.isep.beans.Deadline;
import edu.isep.daoImp.DeadlineJDBCTemplate;


@Controller
public class AjoutDeadlineController {
	
	private DeadlineJDBCTemplate daoDeadline;
	private Map<Integer, Deadline> u;
	
	
	public AjoutDeadlineController(){
		ApplicationContext context = new ClassPathXmlApplicationContext("file:/Users/Anaïs/git/GAPP/src/main/java/edu/isep/gapp/Bean.xml");
		daoDeadline = (DeadlineJDBCTemplate) context.getBean("deadlineDAO");
		u = new HashMap<Integer, Deadline>();	
	}
	
	@RequestMapping(value="/ajoutDeadline",method = RequestMethod.GET)
	public String Exemple(Model model){
		List<Deadline> deadlines = daoDeadline.allDeadline();
		model.addAttribute("deadlines",deadlines);
		return "ajoutDeadline";
	}
	
	
	@RequestMapping(value = "/add_deadline", method = RequestMethod.POST)
	public String ajout_deadline(Deadline deadline, Model model)
	{
		
		u.put(deadline.getId(), deadline);
		daoDeadline.ajout_deadline(deadline);
		model.addAttribute("deadline", u);
		return "ajoutDeadline";
	}

}