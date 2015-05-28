package edu.isep.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.isep.beans.Eleve;
import edu.isep.beans.Groupe;
import edu.isep.beans.SousGroupe;
import edu.isep.daoImp.SousGroupesJDBCTemplate;
import edu.isep.daoImp.elevesJDBCTemplate;
import edu.isep.daoImp.groupeJDBCTemplate;

@Controller
public class AttribGroupeController {
	
	private elevesJDBCTemplate daoEleve;
	private groupeJDBCTemplate daoGroupe;
	private SousGroupesJDBCTemplate daoSousGroupe;
	private Map<Integer, Eleve> e;
	private Map<Integer, Groupe> g;
	private Map<Integer, SousGroupe> sg;

	public AttribGroupeController(){
		ApplicationContext context = new ClassPathXmlApplicationContext("file:/Users/brandonemartins/Documents/A2/Web_Techno/GAPP/src/main/java/edu/isep/gapp/Bean.xml");

//		Declaration des DAO et variables
		daoEleve = (elevesJDBCTemplate) context.getBean("elevesDAO");
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

		return "attribGroupe"; 
	}
	
//	Chemin pour traiter l'ajout d'un groupe
	@RequestMapping(value = "/addGroupe", method = RequestMethod.POST)
	public String add(Groupe groupe, Model model)
	{
//		VOIR COMMENT METTRE LE TUTEUR ID
//		Pour ins�rer un groupe
		groupe.setTuteur_id(1);
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
		
		return "attribGroupe";
	}
	
//	Chemin pour traiter la suppression d'un groupe
	@RequestMapping(value = "/deleteGroupe", method = RequestMethod.POST)
	public String delete(Groupe groupe, Model model)
	{
		g.put(groupe.getId(), groupe);
		daoGroupe.deleteGroupe(groupe);
		
		List<Groupe> groupes = daoGroupe.allGroupes();
		model.addAttribute("groupes", groupes);
		
//		Pour récupérer tous les sous groupes
		List<SousGroupe> sousGroupes = daoSousGroupe.allSousGroupes();
		for( SousGroupe sg : sousGroupes){
			sg.setGroupe(daoGroupe.getGroupe(sg.getGroupes_id()));
		}
		model.addAttribute("sousGroupes", sousGroupes);
		
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
		
		return "attribGroupe";
	}
	
//	Attribution d'élèves à un groupe
	@RequestMapping(value = "/attribEleve", method = RequestMethod.POST)
	public String attribSousGroupe(SousGroupe sousGroupe, Model model)
	{
		
		return "attribGroupe";
	}
}