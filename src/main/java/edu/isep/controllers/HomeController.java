package edu.isep.controllers;

import edu.isep.gapp.LdapAccess;
import edu.isep.beans.LdapObject;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/")
	public String home() {
		logger.info("Page d'accueil");
		
		return "home";
	}
	@RequestMapping(value = "/connexion", method = RequestMethod.POST)
	public String connexion(@RequestParam("login") String login,@RequestParam("password") String password,Model model){
		
		try {
			LdapObject newUser = LdapAccess.LDAPget(login,password);

			switch (newUser.getType()) {
			
				case "eleve":
					System.out.println("eleve");
					return "accueilEleve";
				case "professeur":
					System.out.println("prof");
					break;
			}
			
		} catch(Exception e) {
			System.out.println("utilisateur non trouvé !");
			return "home";
		}
		return "home";
	}
	
}
