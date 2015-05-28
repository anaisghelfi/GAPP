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
import edu.isep.daoImp.elevesJDBCTemplate;
import edu.isep.daoImp.groupeJDBCTemplate;

@Controller
public class AttribGroupeController {
	
	private elevesJDBCTemplate daoEleve;
	private groupeJDBCTemplate daoGroupe;
	private Map<Integer, Eleve> e;
	private Map<Integer, Groupe> g;

	public AttribGroupeController(){
		ApplicationContext context = new ClassPathXmlApplicationContext("file:/Users/David/git/GAPP/src/main/java/edu/isep/gapp/Bean.xml");
		//		Declaration des DAO et variables
		daoEleve = (elevesJDBCTemplate) context.getBean("elevesDAO");
		e = new HashMap<Integer, Eleve>();
		daoGroupe = (groupeJDBCTemplate) context.getBean("groupeDAO");
		g = new HashMap<Integer, Groupe>();
		

//		Declaration des variables
	}
	
	@RequestMapping(value="/attribGroupe", method = RequestMethod.GET)
	public String Exemple(Model model){
		Groupe groupe = new Groupe();
		model.addAttribute("groupe", groupe);

		List<Groupe> groupes = daoGroupe.allGroupes();
		model.addAttribute("groupes", groupes);
		
		return "attribGroupe"; 
	}
	
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
		
		return "attribGroupe";
	}
}
