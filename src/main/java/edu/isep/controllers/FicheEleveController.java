package edu.isep.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FicheEleveController {

	@RequestMapping(value = "/ficheEleve")
	public String Recherche(){
		return "ficheEleve";
	}
	
}
