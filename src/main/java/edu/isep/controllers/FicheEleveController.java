package edu.isep.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import edu.isep.beans.Eleve;
import edu.isep.beans.Seances;
import edu.isep.daoImp.elevesJDBCTemplate;

@Controller
public class FicheEleveController {

	private elevesJDBCTemplate daoEleve;

	public FicheEleveController(){
	
//		ApplicationContext context = new ClassPathXmlApplicationContext("file:/Users/Ana�s/git/GAPP/src/main/java/edu/isep/gapp/Bean.xml");
		
//		ApplicationContext context = new ClassPathXmlApplicationContext("file:/Users/David/git/GAPP/src/main/java/edu/isep/gapp/Bean.xml");
		ApplicationContext context = new ClassPathXmlApplicationContext("file:/Users/Victorien/git/GAPP2/src/main/java/edu/isep/gapp/Bean.xml");
//		Declaration des DAO et variables
		
		daoEleve = (elevesJDBCTemplate) context.getBean("elevesDAO");
			}


	@RequestMapping(value = "/ficheEleve", method = RequestMethod.GET)
	public  String Recherche(HttpServletRequest request, HttpSession session, @RequestParam("nom") String nom, Model model){
		
	session = request.getSession();
	session.getAttribute("login");
	session.getAttribute("number");

	
	model.addAttribute("nom", nom);// Param�tre de l'URL
	List<Eleve> eleves = daoEleve.elevesParNom(nom);
	model.addAttribute("eleves", eleves);
	
	List<Seances> seances = daoEleve.allSeances();
	model.addAttribute("seances",seances);
	
	
	
		return "ficheEleve";
	}
	
	
}