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
import edu.isep.beans.SousCompetences;
import edu.isep.beans.User;
import edu.isep.daoImp.CompetencesJDBCTemplate;


@Controller
public class CompetencesController {
	private CompetencesJDBCTemplate dao;
	private Map<Integer, Competences> c;
	private Map<Integer, SousCompetences> sc;
	
	
	public CompetencesController(){

		ApplicationContext context = new ClassPathXmlApplicationContext("file:/Users/David/git/GAPP/src/main/java/edu/isep/gapp/Bean.xml");

		c = new HashMap<Integer, Competences>();
		sc = new HashMap<Integer, SousCompetences>();
		
		dao = (CompetencesJDBCTemplate) context.getBean("competencesDAO");
		
		Collection<Competences> col = dao.getAllCompetences();
		Iterator<Competences> i = col.iterator();
		while(i.hasNext()){
			Competences competences = i.next();
			c.put(competences.getId(), competences);
			System.out.println(c);
		}
		
	}

	

	@RequestMapping(value = "/addfamille", method = RequestMethod.GET)
	public String viewfamille(Model model)
	{
		
		Competences comp = new Competences();
		model.addAttribute("comp",comp);
		model.addAttribute("allcompetences", c);
		return "AccueilRespo";
	}
	
	@RequestMapping(value="/addfamille",method = RequestMethod.POST)
	public String addfamille(Competences comp,Model model){
		c.put(comp.getId(), comp);
		dao.insertCompetences(comp);
		
		//model.addAttribute("comp", comp);
		
		return "AccueilRespo";
	}
	
	@RequestMapping(value = "/addcompetence", method = RequestMethod.GET)
	public String viewcompetences(Model model)
	{
		SousCompetences souscomp = new SousCompetences();
		model.addAttribute("souscomp",souscomp);
		return "AccueilRespo";
	}
	
	@RequestMapping(value="/addcompetence",method = RequestMethod.POST)
	public String addcompetences(SousCompetences souscomp,Model model){
		sc.put(souscomp.getId(), souscomp);
		dao.insertSousCompetences(souscomp);
		model.addAttribute("souscomp", souscomp);
		return "AccueilRespo";
	}	
	
}
