package edu.isep.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.isep.beans.Competences;
import edu.isep.beans.Eleve;
import edu.isep.beans.Groupe;
import edu.isep.beans.SousGroupe;
import edu.isep.beans.Tuteur;
import edu.isep.daoImp.CompetencesJDBCTemplate;
import edu.isep.daoImp.elevesJDBCTemplate;

@Controller
public class EvalCroiseeController {
	
	private elevesJDBCTemplate daoEleve;
	private CompetencesJDBCTemplate daoCompetences;
	
	private Map<Integer, Eleve> e;

	public EvalCroiseeController(){
		
		ApplicationContext context = new ClassPathXmlApplicationContext("Bean.xml");
		
		daoEleve = (elevesJDBCTemplate) context.getBean("elevesDAO");
		daoCompetences = (CompetencesJDBCTemplate) context.getBean("competencesDAO");
		
		e = new HashMap<Integer, Eleve>();


	}
		@RequestMapping(value="/evalCroisee", method = RequestMethod.GET)
		public String Exemple(HttpServletRequest request, HttpSession session, Model model){
			
			session = request.getSession();
			session.getAttribute("login");
			Object code_eleve = session.getAttribute("number");//Demander Vico comment recup ca
			
//			Fonction qui va chercher les élèves du groupe de la personne connecté
//			List<Eleve> eleves = daoEleve.elevesDeMemeGroupe(code_eleve);
//			model.addAttribute("eleves", eleves);
			
			
			
//			Fonction qui va chercher toutes les compétences
			List<Competences> competences = daoCompetences.allCompetences();
			model.addAttribute("competences", competences);
			
			

			return "evalCroisee"; 
		}
		
	}


