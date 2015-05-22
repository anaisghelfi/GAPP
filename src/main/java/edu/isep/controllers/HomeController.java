package edu.isep.controllers;

import edu.isep.gapp.LdapAccess;
import edu.isep.beans.LdapObject;


import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

@Controller
@SessionAttributes(value="SessionBean")
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	ModelAndView modelAndView = new ModelAndView();

	
	@RequestMapping(value = "/")
	public String home() {
		logger.info("Page d'accueil");
		return "home";
	}
	@RequestMapping(value = "/connexion",method = RequestMethod.POST)
	public ModelAndView connexion(@RequestParam("login") String login,@RequestParam("password") String password){
		
		try {
			LdapObject newUser = LdapAccess.LDAPget(login,password);

			switch (newUser.getType()){
			
				case "eleve":
					System.out.println("eleve");
					
					 modelAndView.addObject("SessionBean", login);
					 modelAndView.addObject("nom",newUser.getNomFamille());
					 modelAndView.addObject("number",newUser.getNumber());
					 modelAndView.addObject("type",newUser.getType());
					 modelAndView.setViewName("AccueilRespo");
					 return modelAndView;
				case "professeur":
					System.out.println("prof");
					break;
			}
			
		} catch(Exception e) {
			System.out.println("utilisateur non trouvé !");
			 modelAndView.setViewName("home");
			return modelAndView;
		}
		modelAndView.setViewName("home");
		return modelAndView;
	}
	
}
