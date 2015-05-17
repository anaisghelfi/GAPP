package edu.isep.controllers;

import java.util.HashMap;
import java.util.Map;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.isep.beans.InsertEleve;
import edu.isep.beans.User;
import edu.isep.daoImp.UserJDBCTemplate;


@Controller
public class InsertEleveController {
	
	private UserJDBCTemplate dao;
	private Map<Integer, User> u;
	
	
	public InsertEleveController(){
		ApplicationContext context = new ClassPathXmlApplicationContext("file:/Users/Victorien/git/GAPP2/src/main/java/edu/isep/gapp/Bean.xml");
		dao = (UserJDBCTemplate) context.getBean("userDAO");
		u = new HashMap<Integer, User>();
		
	}
	@RequestMapping(value="/ajout_eleve.jsp",method = RequestMethod.GET)
	public String Exemple(Model model){
		InsertEleve eleve = new InsertEleve();
		model.addAttribute("eleve",eleve);
		return "ajout_eleve";
	}
	@RequestMapping(value = "/add_user", method = RequestMethod.POST)
	public String add(InsertEleve eleve, Model model)
	{
		eleve.setType(2);
		u.put(eleve.getId(), eleve);
		dao.insertEleve(eleve);
		model.addAttribute("eleve", u);
		return "ajout_eleve";
	}

}
