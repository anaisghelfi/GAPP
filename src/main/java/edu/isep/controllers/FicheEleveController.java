package edu.isep.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;




import org.json.JSONArray;
//import org.json.JSONArray;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import edu.isep.beans.Deadline;
import edu.isep.beans.Eleve;
import edu.isep.beans.Seances;
import edu.isep.beans.Tuteur;
import edu.isep.daoImp.DeadlineJDBCTemplate;
import edu.isep.daoImp.MainJDBCTemplate;
import edu.isep.daoImp.elevesJDBCTemplate;

@Controller
public class FicheEleveController {

	private elevesJDBCTemplate daoEleve;
	private MainJDBCTemplate daoMain;
	private DeadlineJDBCTemplate daoDeadline;


	public FicheEleveController(){
	
		ApplicationContext context = new ClassPathXmlApplicationContext("Bean.xml");
//		Declaration des DAO et variables
		
		daoEleve = (elevesJDBCTemplate) context.getBean("elevesDAO");
		daoMain = (MainJDBCTemplate) context.getBean("mainDAO");
		daoDeadline = (DeadlineJDBCTemplate) context.getBean("deadlineDAO");

			}


	@RequestMapping(value = "/ficheEleve", method = RequestMethod.GET)
	public  String Recherche(HttpServletRequest request, HttpSession session, @RequestParam("codeEleve") int codeEleve, Model model){
		
	session = request.getSession();
	session.getAttribute("login");
	session.getAttribute("number");
	if(session.getAttribute("type") == "professeur"){
		int tuteurType = daoMain.tuteurType((String) session.getAttribute("email"));
		System.out.println(tuteurType);
		model.addAttribute("typeTuteur",tuteurType);
	}
	
	List<Eleve> eleves = daoEleve.elevesParNomInt(codeEleve);
	model.addAttribute("eleves", eleves);
	
	List<Seances> seances = daoEleve.allSeances(codeEleve);
	JSONArray seancesJS = new JSONArray(seances);

	model.addAttribute("seances",seances);
	model.addAttribute("seancesJS",seancesJS);
	
	List<Tuteur> tuteurs = daoEleve.tuteurEleve(codeEleve);
	model.addAttribute("tuteurs",tuteurs);
	
	List<Deadline> deadlines = daoDeadline.allDeadline();
	model.addAttribute("deadlines",deadlines);
	
		return "ficheEleve";
	}
	
	
}