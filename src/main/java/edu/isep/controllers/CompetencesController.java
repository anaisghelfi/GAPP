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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import edu.isep.beans.Competences;
import edu.isep.beans.Groupe;
import edu.isep.beans.SousCompetences;
import edu.isep.beans.SousGroupe;
import edu.isep.beans.User;
import edu.isep.daoImp.CompetencesJDBCTemplate;


@Controller
public class CompetencesController {
	private CompetencesJDBCTemplate dao;
	private Map<Integer, Competences> c;
	private Map<Integer, SousCompetences> sc;
	
	
	public CompetencesController(){

		ApplicationContext context = new ClassPathXmlApplicationContext("Bean.xml");


		c = new HashMap<Integer, Competences>();
		sc = new HashMap<Integer, SousCompetences>();
		
		dao = (CompetencesJDBCTemplate) context.getBean("competencesDAO");
		
		List<Competences> allcompetences = dao.allCompetences();
		List<SousCompetences> allsouscompetences = dao.allSousCompetences();
	
	}

	

	@RequestMapping(value = "/addfamille", method = RequestMethod.GET)
	public String viewfamille(Model model)
	{
		Competences comp = new Competences();
		model.addAttribute("comp",comp);
		List<Competences> allcompetences = dao.allCompetences();
		model.addAttribute("allcompetences", allcompetences);
		
		List<SousCompetences> allsouscompetences = dao.allSousCompetences();
		model.addAttribute("allsouscompetences", allsouscompetences);
		
		
		return "AccueilRespo";
	}
	
	@RequestMapping(value = "/deletefamille", method = RequestMethod.POST)
	public String deletefamille(Competences comp,Model model)
	{
		c.put(comp.getId(),comp);
		dao.deleteCompetence(comp.getId());
		
		List<Competences> allcompetences = dao.allCompetences();
		model.addAttribute("allcompetences", allcompetences);
		
		List<SousCompetences> allsouscompetences = dao.allSousCompetences();
		model.addAttribute("allsouscompetences", allsouscompetences);
		
		
		return "AccueilRespo";
	}	
	
	
	@RequestMapping(value = "/deletecompetence", method = RequestMethod.POST)
	public String deletecompetence(SousCompetences souscomp,Model model){
		sc.put(souscomp.getId(), souscomp);
		dao.deleteSousCompetence(souscomp.getId());
		model.addAttribute("souscomp", souscomp);

		List<Competences> allcompetences = dao.allCompetences();
		model.addAttribute("allcompetences", allcompetences);
		
		List<SousCompetences> allsouscompetences = dao.allSousCompetences();
		model.addAttribute("allsouscompetences", allsouscompetences);
		
		
		
		return "AccueilRespo";
	}	
	
		
	
	@RequestMapping(value="/addfamille",method = RequestMethod.POST)
	public String addfamille(Competences comp,Model model){
		c.put(comp.getId(), comp);
		dao.insertCompetences(comp);
		
		List<Competences> allcompetences = dao.allCompetences();
		model.addAttribute("allcompetences", allcompetences);
		
		List<SousCompetences> allsouscompetences = dao.allSousCompetences();
		model.addAttribute("allsouscompetences", allsouscompetences);
		
		System.out.println(allsouscompetences);
		
		return "AccueilRespo";
	}
	
	@RequestMapping(value="/updatefamille",method = RequestMethod.POST)
	public String updateFamille(Competences comp,Model model){
		dao.updateCompetence(comp);
		
		List<Competences> allcompetences = dao.allCompetences();
		model.addAttribute("allcompetences", allcompetences);
		
		List<SousCompetences> allsouscompetences = dao.allSousCompetences();
		model.addAttribute("allsouscompetences", allsouscompetences);
		
		return "AccueilRespo";
	}	
	
	@RequestMapping(value="/updatecompetence",method = RequestMethod.POST)
	public String updateCompetence(SousCompetences souscomp,Model model){
		dao.updateSousCompetence(souscomp);
		
		List<Competences> allcompetences = dao.allCompetences();
		model.addAttribute("allcompetences", allcompetences);
		
		List<SousCompetences> allsouscompetences = dao.allSousCompetences();
		model.addAttribute("allsouscompetences", allsouscompetences);
		
		return "AccueilRespo";
	}		
	
	@RequestMapping(value = "/addcompetence", method = RequestMethod.GET)
	public String viewcompetences(Model model)
	{
		SousCompetences souscomp = new SousCompetences();
		model.addAttribute("souscomp",souscomp);

		List<Competences> allcompetences = dao.allCompetences();
		model.addAttribute("allcompetences", allcompetences);
		
		List<SousCompetences> allsouscompetences = dao.allSousCompetences();
		model.addAttribute("allsouscompetences", allsouscompetences);
		
		return "AccueilRespo";
	}
	
	@RequestMapping(value="/addcompetence",method = RequestMethod.POST)
	public String addcompetences(SousCompetences souscomp,Model model){
		sc.put(souscomp.getId(), souscomp);
		dao.insertSousCompetences(souscomp);
		model.addAttribute("souscomp", souscomp);

		List<Competences> allcompetences = dao.allCompetences();
		model.addAttribute("allcompetences", allcompetences);
		
		List<SousCompetences> allsouscompetences = dao.allSousCompetences();
		model.addAttribute("allsouscompetences", allsouscompetences);
		
		
		
		return "AccueilRespo";
	}	
	
}
