package edu.isep.controllers;

import java.util.List;

import edu.isep.gapp.LdapAccess;
import edu.isep.beans.LdapObject;
import edu.isep.beans.Tuteur;
import edu.isep.daoImp.CompetencesJDBCTemplate;
import edu.isep.daoImp.HomeJDBCTemplate;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	private HomeJDBCTemplate h;
	
	public HomeController(){

		ApplicationContext context = new ClassPathXmlApplicationContext("Bean.xml");
		h = (HomeJDBCTemplate) context.getBean("sessionDAO");
		
	}
	
	@RequestMapping(value = "/")
	public String home() {
		logger.info("Page d'accueil");
		return "home";
	}
	
	@RequestMapping(value = "/connexion",method = RequestMethod.POST)
	public String connexion(HttpServletRequest request ,HttpSession session, @RequestParam("login") String login,@RequestParam("password") String password){
		
		/*session = request.getSession();
		session.setAttribute("login", login);
		session.setAttribute("email","mohamed.sellami@isep.fr");
		session.setAttribute("nom", "Sellami");
		session.setAttribute("prenom", "Mohamed");
		session.setAttribute("type", "professeur");*/
		
		session = request.getSession();
		session.setAttribute("login", login);
		session.setAttribute("email","victorien.gauch@isep.fr");
		 session.setAttribute("number", 7335);
		session.setAttribute("nom", "Gauch");
		session.setAttribute("prenom", "Victorien");
		session.setAttribute("type", "eleve");
		
	
		try {
			LdapObject newUser = LdapAccess.LDAPget(login,password);
			
			switch (newUser.getType()){
			
				case "eleve":
					System.out.println("eleve");

					 session = request.getSession();
					 session.setAttribute("login", login);
					 session.setAttribute("number", newUser.getNumber());
					 session.setAttribute("email", newUser.getMail());
					 session.setAttribute("nom", newUser.getNomFamille());
					 session.setAttribute("prenom", newUser.getPrenom());
					 session.setAttribute("type", newUser.getType());
					 

					 return "redirect:ficheEleve?codeEleve="+newUser.getNumber();
					 
				case "professeur":
					int tuteurExist = h.tuteurExist(newUser.getMail());
					if(tuteurExist == 0){
						Tuteur t = new Tuteur();
						t.setNom(newUser.getNom());
						t.setPrenom(newUser.getPrenom());
						t.setMail(newUser.getMail());
						h.insertTuteur(t);
					}
					session = request.getSession();
					session.setAttribute("login", login);
					session.setAttribute("email", newUser.getMail());
					session.setAttribute("nom", newUser.getNomFamille());
					session.setAttribute("prenom", newUser.getPrenom());
					session.setAttribute("type", newUser.getType());
					
					return "redirect:rechercheEleves";
						
			}
			
		} catch(Exception e) {

			System.out.println("utilisateur non trouvé !");

			return "home";
		}
		return "home";
	}
	@RequestMapping(value="/deconnexion", method=RequestMethod.GET)
	public String endSession(HttpSession session,SessionStatus status){
		session.removeAttribute("login");
		session.removeAttribute("number");
		session.removeAttribute("email");
		session.removeAttribute("nom");
		session.removeAttribute("prenom");
		session.removeAttribute("type");
	    return "home";
	}
	
}
