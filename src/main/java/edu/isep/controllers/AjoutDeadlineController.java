package edu.isep.controllers;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.isep.beans.Deadline;
import edu.isep.beans.Groupe;
import edu.isep.beans.Seances;
import edu.isep.daoImp.DeadlineJDBCTemplate;
import edu.isep.daoImp.MainJDBCTemplate;
import edu.isep.daoImp.groupeJDBCTemplate;


@Controller
public class AjoutDeadlineController {
	
	private DeadlineJDBCTemplate daoDeadline;
	private groupeJDBCTemplate daoGroupe;
	private MainJDBCTemplate daoMain;
	
	private Map<Integer, Deadline> u;
	private Map<String,Deadline> d;
	private Map<Integer,Seances> s;
	private Map<Integer,Seances> v;

	
	
	public AjoutDeadlineController(){

		ApplicationContext context = new ClassPathXmlApplicationContext("Bean.xml");

		daoDeadline = (DeadlineJDBCTemplate) context.getBean("deadlineDAO");
		daoGroupe = (groupeJDBCTemplate) context.getBean("groupeDAO");
		daoMain = (MainJDBCTemplate) context.getBean("mainDAO");
		
		u = new HashMap<Integer, Deadline>();	
		d = new HashMap<String, Deadline>();
		s = new HashMap<Integer, Seances>();
		v = new HashMap<Integer, Seances>();



	}
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}
	@RequestMapping(value="/ajoutDeadline",method = RequestMethod.GET)
	public String Exemple(HttpSession session, Model model){
		
		int tuteurType = daoMain.tuteurType((String) session.getAttribute("email"));
		System.out.println(tuteurType);
		model.addAttribute("typeTuteur",tuteurType);
		
		List<Deadline> deadlines = daoDeadline.allDeadline();
		model.addAttribute("deadlines",deadlines);
		
		List<Groupe> groupes = daoGroupe.allGroupes();
		model.addAttribute("groupes", groupes);
		
		List<Seances> seances = daoDeadline.allSeance();
		model.addAttribute("seances", seances);
		
		return "ajoutDeadline";
	}
	
	
	@RequestMapping(value = "/add_deadline", method = RequestMethod.POST)
	public String ajout_deadline(Deadline deadline, Model model)
	{
		
		u.put(deadline.getId(), deadline);
		daoDeadline.ajout_deadline(deadline);
		model.addAttribute("deadline", u);
		
		List<Deadline> deadlines = daoDeadline.allDeadline();
		model.addAttribute("deadlines",deadlines);
		
		List<Groupe> groupes = daoGroupe.allGroupes();
		model.addAttribute("groupes", groupes);
		
		return "redirect:ajoutDeadline";
	}
	
	@RequestMapping(value = "/delete_deadline", method = RequestMethod.POST)
	public String delete_deadline(Deadline deadline, Model model)
	{
		
		d.put(deadline.getTitre(), deadline);
		daoDeadline.delete_deadline(deadline);
		model.addAttribute("deadline", d);
		
		List<Deadline> deadlines = daoDeadline.allDeadline();
		model.addAttribute("deadlines",deadlines);
		
		List<Groupe> groupes = daoGroupe.allGroupes();
		model.addAttribute("groupes", groupes);
		
		List<Seances> seances_delete = daoDeadline.allSeance();
		model.addAttribute("seances", seances_delete);
		
		return "redirect:ajoutDeadline";
	}
	
	@RequestMapping(value = "/add_seance", method = RequestMethod.POST)
	public String ajout_seance(Seances seance, Model model)
	{
		
		s.put(seance.getId(), seance);
		daoDeadline.ajout_seance(seance);
		model.addAttribute("seance", s);
		
		List<Seances> seances = daoDeadline.allSeance();
		model.addAttribute("seances", seances);
		
		List<Groupe> groupes = daoGroupe.allGroupes();
		model.addAttribute("groupes", groupes);
		
		return "redirect:ajoutDeadline";
	}
	
	
	@RequestMapping(value = "/delete_seance", method = RequestMethod.POST)
	public String delete_seance(Seances seances, Model model)
	{
		
		v.put(seances.getId(), seances);
		daoDeadline.delete_seance(seances);
		model.addAttribute("seance_delete", v);
		
		List<Seances> seances_delete = daoDeadline.allSeance();
		model.addAttribute("seances", seances_delete);
				
		List<Deadline> deadlines = daoDeadline.allDeadline();
		model.addAttribute("deadlines",deadlines);
		
		List<Groupe> groupes = daoGroupe.allGroupes();
		model.addAttribute("groupes", groupes);
		
		return "redirect:ajoutDeadline";
	}

}
