package edu.isep.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RechercheController {
	
	@RequestMapping(value = "/recherche")
	public String Recherche(){
		return "recherche";
	}
}
