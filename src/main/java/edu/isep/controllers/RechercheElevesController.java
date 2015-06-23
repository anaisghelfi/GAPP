package edu.isep.controllers;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.isep.beans.Eleve;
import edu.isep.beans.Groupe;
import edu.isep.beans.SousGroupe;
import edu.isep.beans.Tuteur;
import edu.isep.daoImp.EvalCroiseeJDBCTemplate;
import edu.isep.daoImp.RechercherJDBCTemplate;
import edu.isep.daoImp.SousGroupesJDBCTemplate;
import edu.isep.daoImp.elevesJDBCTemplate;
import edu.isep.daoImp.groupeJDBCTemplate;

@Controller
public class RechercheElevesController {
	
	private elevesJDBCTemplate daoEleve;
	private groupeJDBCTemplate daoGroupe;
	private SousGroupesJDBCTemplate daoSousGroupe;
	private EvalCroiseeJDBCTemplate daoEvalCroisee;
	private Map<Integer, Eleve> e;
	private Map<Integer, Groupe> g;
	private Map<Integer, SousGroupe> sg;

	
	public RechercheElevesController(){

		
		ApplicationContext context = new ClassPathXmlApplicationContext("Bean.xml");

//		Declaration des DAO et variables
		
		daoEleve = (elevesJDBCTemplate) context.getBean("elevesDAO");
		daoGroupe = (groupeJDBCTemplate) context.getBean("groupeDAO");
		daoSousGroupe = (SousGroupesJDBCTemplate) context.getBean("sousGroupeDAO");
		daoEvalCroisee = (EvalCroiseeJDBCTemplate) context.getBean("EvalCroiseeDAO");
		
		e = new HashMap<Integer, Eleve>();
		g = new HashMap<Integer, Groupe>();
		sg = new HashMap<Integer, SousGroupe>();
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}
	
	@RequestMapping(value = "/rechercheEleves", method = RequestMethod.POST)
	public String getNom(Eleve eleve, Model model)
	{
		e.put(eleve.getId(), eleve);
		List<Eleve> eleves = daoEleve.elevesParNom(eleve.getNom());
		model.addAttribute("eleves", eleves);
		
		

		return "rechercheEleves";
	}		
	
	
	//Chemin pour la page en GET normal
	@RequestMapping(value="/rechercheEleves", method = RequestMethod.GET)
	public String Exemple(Model model){
		
//		Pour récupérer tous les groupes
		List<Groupe> groupes = daoGroupe.allGroupes();
		model.addAttribute("groupes", groupes);
		
//		Pour récupérer tous les sous groupes
		List<SousGroupe> sousGroupes = daoSousGroupe.allSousGroupes();
		for( SousGroupe sg : sousGroupes){
			sg.setGroupe(daoGroupe.getGroupe(sg.getGroupes_id()));
		}
		model.addAttribute("sousGroupes", sousGroupes);
		
//		Pour savoir si on affiche le bouton pour activer l'evaluation croisée
	//	boolean afficheBouton = daoEvalCroisee.verifDispoEvalCroisee(code_eleve);
		
		


		return "rechercheEleves"; 
	}
	
	
}