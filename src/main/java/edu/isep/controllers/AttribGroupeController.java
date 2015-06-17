package edu.isep.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import edu.isep.beans.Eleve;
import edu.isep.beans.Groupe;
import edu.isep.beans.SousGroupe;
import edu.isep.beans.Tuteur;
import edu.isep.daoImp.SousGroupesJDBCTemplate;
import edu.isep.daoImp.TuteurJDBCTemplate;
import edu.isep.daoImp.elevesJDBCTemplate;
import edu.isep.daoImp.groupeJDBCTemplate;

@Controller
public class AttribGroupeController {
	
	private elevesJDBCTemplate daoEleve;
	private groupeJDBCTemplate daoGroupe;
	private SousGroupesJDBCTemplate daoSousGroupe;
	private TuteurJDBCTemplate daoTuteur;
	private Map<Integer, Eleve> e;
	private Map<Integer, Groupe> g;
	private Map<Integer, SousGroupe> sg;

	public AttribGroupeController(){


		ApplicationContext context = new ClassPathXmlApplicationContext("file:/Users/brandonemartins/Documents/A2/Web_Techno/GAPP/src/main/java/edu/isep/gapp/Bean.xml");
//		ApplicationContext context = new ClassPathXmlApplicationContext("file:/Users/Ana�s/git/GAPP/src/main/java/edu/isep/gapp/Bean.xml");

//		ApplicationContext context = new ClassPathXmlApplicationContext("file:/Users/Victorien/git/GAPP2/src/main/java/edu/isep/gapp/Bean.xml");
		//		Declaration des DAO et variables
		daoEleve = (elevesJDBCTemplate) context.getBean("elevesDAO");
		e = new HashMap<Integer, Eleve>();
		daoGroupe = (groupeJDBCTemplate) context.getBean("groupeDAO");
		g = new HashMap<Integer, Groupe>();

		
//		Declaration des DAO et variables

		daoEleve = (elevesJDBCTemplate) context.getBean("elevesDAO");
		daoTuteur = (TuteurJDBCTemplate) context.getBean("tuteurDAO");
		daoGroupe = (groupeJDBCTemplate) context.getBean("groupeDAO");
		daoSousGroupe = (SousGroupesJDBCTemplate) context.getBean("sousGroupeDAO");
		
		e = new HashMap<Integer, Eleve>();
		g = new HashMap<Integer, Groupe>();
		sg = new HashMap<Integer, SousGroupe>();
		
	}
	
	
//	FAIRE UNE FONCTION QUI RÉCUPÈRE les données et l'appeler dans tous les controllers
	
	
//	Chemin pour la page en GET normal
	@RequestMapping(value="/attribGroupe", method = RequestMethod.GET)
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
		
//		Pour récupérer tous les tuteurs
		List<Tuteur> tuteurs = daoTuteur.allTuteurs();
		model.addAttribute("tuteurs", tuteurs);
		
//		Pour récupérer tous les élèves
		List<Eleve> eleves = daoEleve.allEleves();
		model.addAttribute("eleves", eleves);

		return "attribGroupe"; 
	}
	
//	Chemin pour traiter l'ajout d'un groupe
	@RequestMapping(value = "/addGroupe", method = RequestMethod.POST)
	public String add(Groupe groupe, Model model)
	{
//		VOIR COMMENT METTRE LE TUTEUR ID
//		Pour ins�rer un groupe
//		groupe.setTuteur_id(1);
		g.put(groupe.getId(), groupe);
		daoGroupe.addGroup(groupe);
		
		List<Groupe> groupes = daoGroupe.allGroupes();
		model.addAttribute("groupes", groupes);
		
//		Pour récupérer tous les sous groupes
		List<SousGroupe> sousGroupes = daoSousGroupe.allSousGroupes();
		for( SousGroupe sg : sousGroupes){
			sg.setGroupe(daoGroupe.getGroupe(sg.getGroupes_id()));
		}
		model.addAttribute("sousGroupes", sousGroupes);
		
//		Pour récupérer tous les tuteurs
		List<Tuteur> tuteurs = daoTuteur.allTuteurs();
		model.addAttribute("tuteurs", tuteurs);
		
		return "attribGroupe";
	}
	
//	Chemin pour traiter la suppression d'un groupe
	@RequestMapping(value = "/deleteGroupe", method = RequestMethod.POST)
	public String delete(Groupe groupe, Model model)
	{		
		g.put(groupe.getId(), groupe);
		daoGroupe.deleteGroupe(groupe.getId());
		
		List<Groupe> groupes = daoGroupe.allGroupes();
		model.addAttribute("groupes", groupes);
		
//		Pour récupérer tous les sous groupes
		List<SousGroupe> sousGroupes = daoSousGroupe.allSousGroupes();
		for( SousGroupe sg : sousGroupes){
			sg.setGroupe(daoGroupe.getGroupe(sg.getGroupes_id()));
		}
		model.addAttribute("sousGroupes", sousGroupes);
		
//		Pour récupérer tous les tuteurs
		List<Tuteur> tuteurs = daoTuteur.allTuteurs();
		model.addAttribute("tuteurs", tuteurs);
		
		return "attribGroupe";
	}
	
//	Chemin pour traiter l'ajout d'un sous-groupe
	@RequestMapping(value = "/addSousGroupe", method = RequestMethod.POST)
	public String addSousGroupe(SousGroupe sousGroupe, Groupe groupe, Model model)
	{
//		Définir l'objet sous-groupe qui va etre envoyé (attention objet Groupe à l'intérieur, définir son id car utilisé dans la sth)
		
		sg.put(sousGroupe.getId(), sousGroupe);
		daoSousGroupe.addSousGroupe(sousGroupe);
		
//		Pour récupérer tous les groupes
		List<Groupe> groupes = daoGroupe.allGroupes();
		model.addAttribute("groupes", groupes);
		
//		Pour récupérer tous les sous groupes
		List<SousGroupe> sousGroupes = daoSousGroupe.allSousGroupes();
		for( SousGroupe sg : sousGroupes){
			sg.setGroupe(daoGroupe.getGroupe(sg.getGroupes_id()));
		}
		model.addAttribute("sousGroupes", sousGroupes);
		
//		Pour récupérer tous les tuteurs
		List<Tuteur> tuteurs = daoTuteur.allTuteurs();
		model.addAttribute("tuteurs", tuteurs);
		
		return "attribGroupe";
	}
	
//	Chemin pour traiter la suppression d'un sous-groupe
	@RequestMapping(value = "/deleteSousGroupe", method = RequestMethod.POST)
	public String deleteSousGroupe(SousGroupe sousGroupe, Model model)
	{
		sg.put(sousGroupe.getId(), sousGroupe);
		daoSousGroupe.deleteSousGroupe(sousGroupe);
		
//		Pour récupérer tous les groupes
		List<Groupe> groupes = daoGroupe.allGroupes();
		model.addAttribute("groupes", groupes);
		
//		Pour récupérer tous les sous groupes
		List<SousGroupe> sousGroupes = daoSousGroupe.allSousGroupes();
		for( SousGroupe sg : sousGroupes){
			sg.setGroupe(daoGroupe.getGroupe(sg.getGroupes_id()));
		}
		model.addAttribute("sousGroupes", sousGroupes);
		
//		Pour récupérer tous les tuteurs
		List<Tuteur> tuteurs = daoTuteur.allTuteurs();
		model.addAttribute("tuteurs", tuteurs);
		
		return "attribGroupe";
	}
	
//	A FAIIIIIIIIIRE
	@RequestMapping(value = "/updateGroupe", method = RequestMethod.POST)
	public String updateGroupe(SousGroupe sousGroupe, Groupe groupe, Model model)
	{
//		Mettre à jour le groupe
		daoGroupe.updateGroupe(groupe.getNom());
		
//		Pour récupérer tous les groupes
		List<Groupe> groupes = daoGroupe.allGroupes();
		model.addAttribute("groupes", groupes);
		
//		Pour récupérer tous les sous groupes
		List<SousGroupe> sousGroupes = daoSousGroupe.allSousGroupes();
		for( SousGroupe sg : sousGroupes){
			sg.setGroupe(daoGroupe.getGroupe(sg.getGroupes_id()));
		}
		model.addAttribute("sousGroupes", sousGroupes);
		
//		Pour récupérer tous les tuteurs
		List<Tuteur> tuteurs = daoTuteur.allTuteurs();
		model.addAttribute("tuteurs", tuteurs);
		
		return "attribGroupe";
	}
	
//	Attribution d'élèves à un groupe
	@RequestMapping(value = "/attribEleve", method = RequestMethod.POST)
	public String attribSousGroupe(SousGroupe sousGroupe, Model model)
	{
		
		return "attribGroupe";
	}
}
