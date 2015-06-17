package edu.isep.controllers;


import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Date;



import javax.servlet.http.HttpServletRequest;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import edu.isep.beans.Competences;
import edu.isep.beans.SousCompetences;
import edu.isep.beans.Eleve;
import edu.isep.beans.User;
import edu.isep.beans.Absences;
import edu.isep.daoImp.elevesJDBCTemplate;
import edu.isep.daoImp.AbsencesJDBCTemplate;
import edu.isep.daoImp.CompetencesJDBCTemplate;


@Controller
public class FicheGroupeController {
	
	private elevesJDBCTemplate dao;
	private AbsencesJDBCTemplate daoAbsences;
	private CompetencesJDBCTemplate daoCompetences;

	private Map<Integer, Eleve> e;
	private Map<Integer, Absences> a;
	private Map<Integer, Competences> c;
	private Map<Integer, SousCompetences> sc;

//A VERIFIER : S�ance pour le tuteur en session aujourd'hui ou non (Si oui envoyer la date dans le model + dans l'insertion de l'absence)
//A FAIRE EN PLUS : Ajouter le nom de la s�ance (plutot le num�ro) ??
	
	public FicheGroupeController(){

		ApplicationContext context = new ClassPathXmlApplicationContext("Bean.xml");
		
		
		dao = (elevesJDBCTemplate) context.getBean("elevesDAO");
		daoAbsences = (AbsencesJDBCTemplate) context.getBean("absencesDAO");
		daoCompetences = (CompetencesJDBCTemplate) context.getBean("competencesDAO");
		
		e = new HashMap<Integer, Eleve>();
		a = new HashMap<Integer, Absences>();
		c = new HashMap<Integer, Competences>();
		sc = new HashMap<Integer, SousCompetences>();
	
	}

	

	@RequestMapping(value = "/ficheGroupe-{numgroupe}", method = RequestMethod.GET)
	public String getEleves(@PathVariable String numgroupe,Model model) 
	{

		String groupeno = (String)numgroupe;
//		Pour récupérer tous les �l�ves d'un groupe

		List<Eleve> eleves = dao.elevesParGroupe((String)groupeno);
		model.addAttribute("numerogroupe", groupeno);
		model.addAttribute("alleleves", eleves);

		
		List<Competences> allcompetences = daoCompetences.allCompetences();
		model.addAttribute("allcompetences", allcompetences);
		
		List<SousCompetences> allsouscompetences = daoCompetences.allSousCompetences();
		model.addAttribute("allsouscompetences", allsouscompetences);
		

		return "ficheGroupe";
	}
	
	@RequestMapping(value ="/addAbsences-{numgroupe}", method = RequestMethod.POST)
	public String addAbsences(HttpServletRequest request,@PathVariable String numgroupe,Model model) 
	{
		String groupeno = (String)numgroupe;
//		Pour récupérer tous les �l�ves d'un groupe
		List<Eleve> eleves = dao.elevesParGroupe((String)groupeno);
		model.addAttribute("numerogroupe", groupeno);
		model.addAttribute("alleleves", eleves);
		
		
		
		for(int i=0;i<eleves.size();i++){
			int id = eleves.get(i).getId();
			Absences absences = new Absences();
			String absent = request.getParameter("absence-"+id);
						
				Date date = new Date();
				absences.setDate(date);
				absences.setEleves_id(id);
				absences.setAbscencescol(absent);
				
				daoAbsences.insertAbsence(absences);
			
		}
	
		return "ficheGroupe";
	}	
	

	
}


