package edu.isep.controllers;

import java.util.HashMap;
import java.util.Map;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.isep.beans.Deadline;
import edu.isep.daoImp.UserJDBCTemplate;


@Controller
public class AjoutDeadlineController {
	
	private UserJDBCTemplate dao;
	private Map<Integer, Deadline> u;
	
	
	public AjoutDeadlineController(){
		ApplicationContext context = new ClassPathXmlApplicationContext("file:/Users/David/git/GAPP/src/main/java/edu/isep/gapp/Bean.xml");
		dao = (UserJDBCTemplate) context.getBean("userDAO");
		u = new HashMap<Integer, Deadline>();
		
	}
	@RequestMapping(value="/ajout_deadline.jsp",method = RequestMethod.GET)
	public String Exemple(Model model){
		Deadline deadline = new Deadline();
		model.addAttribute("deadline",deadline);
		return "ajout_deadline";
	}
	@RequestMapping(value = "/add_deadline", method = RequestMethod.POST)
	public String add(Deadline deadline, Model model)
	{
		
		u.put(deadline.getId(), deadline);
		dao.ajout_deadline(deadline);
		model.addAttribute("deadline", u);
		return "ajout_deadline";
	}
	

}