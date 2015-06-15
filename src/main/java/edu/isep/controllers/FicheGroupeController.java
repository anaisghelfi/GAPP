package edu.isep.controllers;


import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import edu.isep.beans.Eleve;
import edu.isep.beans.Groupe;
import edu.isep.beans.SousGroupe;
import edu.isep.beans.User;
import edu.isep.daoImp.SousGroupesJDBCTemplate;
import edu.isep.daoImp.TuteurJDBCTemplate;
import edu.isep.daoImp.elevesJDBCTemplate;


@Controller
public class FicheGroupeController {
	
	private elevesJDBCTemplate dao;

	private Map<Integer, Eleve> e;


	
	public FicheGroupeController(){


		//ApplicationContext context = new ClassPathXmlApplicationContext("file:/Users/David/git/GAPP/src/main/java/edu/isep/gapp/Bean.xml");
		//ApplicationContext context = new ClassPathXmlApplicationContext("file:/Users/brandonemartins/Documents/A2/Web_Techno/GAPP/src/main/java/edu/isep/gapp/Bean.xml");
		ApplicationContext context = new ClassPathXmlApplicationContext("file:/Users/Anaïs/git/GAPP/src/main/java/edu/isep/gapp/Bean.xml");
		//ApplicationContext context = new ClassPathXmlApplicationContext("file:/Users/Victorien/git/GAPP2/src/main/java/edu/isep/gapp/Bean.xml");


		
		dao = (elevesJDBCTemplate) context.getBean("elevesDAO");
		e = new HashMap<Integer, Eleve>();
	
	}

	

	@RequestMapping(value = "/ficheGroupe/{numberGroup}", method = RequestMethod.GET)
	public String getEleves(@PathVariable("numberGroup") String numberGroup, Model model) 
	{
		String groupeno = (String)numberGroup;
//		Pour rÃ©cupÃ©rer tous les élèves d'un groupe
		List<Eleve> eleves = dao.elevesParGroupe((String)groupeno);
		model.addAttribute("numerogroupe", groupeno);
		model.addAttribute("alleleves", eleves);
		
		
		
		return "ficheGroupe";
	}
	
	
	
}


