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
import org.springframework.web.bind.annotation.ResponseBody;

import edu.isep.beans.Competences;
import edu.isep.beans.Eleve;
import edu.isep.beans.EvalCroisee;
import edu.isep.beans.Groupe;
import edu.isep.beans.SousGroupe;
import edu.isep.beans.Tuteur;
import edu.isep.daoImp.CompetencesJDBCTemplate;
import edu.isep.daoImp.EvalCroiseeJDBCTemplate;
import edu.isep.daoImp.elevesJDBCTemplate;

@Controller
public class EvalCroiseeController {
	
	private elevesJDBCTemplate daoEleve;
	private CompetencesJDBCTemplate daoCompetences;
	private EvalCroiseeJDBCTemplate daoEvalCroisee;
	
	private Map<Integer, Eleve> e;
	private Map<Integer, EvalCroisee> ec;

	public EvalCroiseeController(){
		
		ApplicationContext context = new ClassPathXmlApplicationContext("Bean.xml");
		
		daoEleve = (elevesJDBCTemplate) context.getBean("elevesDAO");
		daoCompetences = (CompetencesJDBCTemplate) context.getBean("competencesDAO");
		daoEvalCroisee = (EvalCroiseeJDBCTemplate) context.getBean("EvalCroiseeDAO");
		
		e = new HashMap<Integer, Eleve>();
		ec = new HashMap<Integer, EvalCroisee>();


	}
		@RequestMapping(value="/evalCroisee", method = RequestMethod.GET)
		public String Exemple(HttpServletRequest request, HttpSession session, Model model){
	
			session = request.getSession();
			session.getAttribute("login");
			int code_eleve = Integer.parseInt(String.valueOf(session.getAttribute("number")));
			
//			Verifier que l'éval croisée est dispo (pas dejà faites et autorisés)
			boolean affichageTableau = daoEvalCroisee.verifDispoEvalCroisee(code_eleve);
			model.addAttribute("affichageTableau", affichageTableau);
			
//			Fonction qui va chercher les élèves du groupe de la personne connecté
			List<Eleve> eleves = daoEleve.elevesDeMemeGroupe(code_eleve);
			model.addAttribute("eleves", eleves);
			
//			Fonction qui va chercher toutes les compétences
			List<Competences> competences = daoCompetences.allCompetences();
			model.addAttribute("competences", competences);
			
//			Fonction qui va chercher toutes les notes eval croisees déjà remplies
			List<EvalCroisee> evalCroisees = daoEvalCroisee.evalCroiseeParGroupe(code_eleve);
			model.addAttribute("evalCroisees", evalCroisees);
			
			return "evalCroisee"; 
		}
		
//		Pour terminer l'évaluation croisée des compétences (bloquer les notes)
		@RequestMapping(value="/validerEvalCroisee", method = RequestMethod.POST)
		public String Expl(HttpServletRequest request, HttpSession session, Model model, EvalCroisee evalcroisee){
			
			int code_eleve = Integer.parseInt(String.valueOf(session.getAttribute("number")));
			
//			requete pour valider la fin de l'éval croisee
			daoEvalCroisee.validationEvalCroisee(code_eleve);
			
			model.addAttribute("message_validation", true);
			
//			On va sur la fiche élève
			return "evalCroisee";
		}
		
		
		
//		Pour traiter l'envoi de l'eval croisee en AJAX
		@RequestMapping(value="/insererNoteEvalCroisee", method = RequestMethod.POST)
		public @ResponseBody void Note(HttpServletRequest request, HttpSession session, Model model, EvalCroisee evalcroisee){
			
			evalcroisee.setEleve_juge_code_eleve(Integer.parseInt(String.valueOf(session.getAttribute("number"))));
			ec.put(evalcroisee.getId(), evalcroisee);
			daoEvalCroisee.InsertNote(evalcroisee);
			
		}
		
	}


