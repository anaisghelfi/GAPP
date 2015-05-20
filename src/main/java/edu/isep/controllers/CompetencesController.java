package edu.isep.controllers;

import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import edu.isep.beans.Competences;
import edu.isep.daoImp.CompetencesJDBCTemplate;


@Controller
public class CompetencesController {
	private CompetencesJDBCTemplate dao;
	private Map<Integer, Competences> c;
	
	
	public CompetencesController(){
		ApplicationContext context = new ClassPathXmlApplicationContext("file:/Users/Anaïs/git/GAPP/src/main/java/edu/isep/gapp/Bean.xml");
		c = new HashMap<Integer, Competences>();
		dao = (CompetencesJDBCTemplate) context.getBean("competencesDAO");
		Collection<Competences> col = dao.getAllCompetences();
		Iterator<Competences> i = col.iterator();
		while(i.hasNext()){
			Competences comp = i.next();
			c.put(comp.getId(), comp);
		}
		
	}
	@RequestMapping(value="/ajoutcompetences",method = RequestMethod.GET)
	public String Exemple(){
		
		return "competences";
	}
	@RequestMapping(value = "/voircompetences", method = RequestMethod.GET)
	public String add(Model model)
	{
		System.out.println(c);
		model.addAttribute("competences", c);
		return "competences";
	}
}