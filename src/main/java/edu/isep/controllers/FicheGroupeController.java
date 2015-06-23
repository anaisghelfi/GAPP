package edu.isep.controllers;


import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Date;






<<<<<<< HEAD


=======
>>>>>>> branch 'master' of https://github.com/anaisghelfi/GAPP.git
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import edu.isep.beans.Competences;
import edu.isep.beans.SousCompetences;
import edu.isep.beans.Eleve;
import edu.isep.beans.User;
import edu.isep.beans.NoteCompetencesGroupe;
import edu.isep.beans.NoteCompetences;
import edu.isep.beans.Absences;
import edu.isep.daoImp.MainJDBCTemplate;
import edu.isep.daoImp.elevesJDBCTemplate;
import edu.isep.daoImp.AbsencesJDBCTemplate;
import edu.isep.daoImp.CompetencesJDBCTemplate;


@Controller
public class FicheGroupeController {
	
	private elevesJDBCTemplate dao;
	private AbsencesJDBCTemplate daoAbsences;
	private CompetencesJDBCTemplate daoCompetences;
	private MainJDBCTemplate daoMain;

	private Map<Integer, Eleve> e;
	private Map<Integer, Absences> a;
	private Map<Integer, Competences> c;
	private Map<Integer, SousCompetences> sc;

//A VERIFIER : S�ance pour le tuteur en session aujourd'hui ou non (Si oui envoyer la date dans le model + dans l'insertion de l'absence)
//A FAIRE EN PLUS : Ajouter le nom de la s�ance (plutot le num�ro) ??
	
	public FicheGroupeController(){

		ApplicationContext context = new ClassPathXmlApplicationContext("Bean.xml");
		
		
		dao = (elevesJDBCTemplate) context.getBean("elevesDAO");
		daoAbsences = (AbsencesJDBCTemplate) context.getBean("absencesDAO");
		daoCompetences = (CompetencesJDBCTemplate) context.getBean("competencesDAO");
		daoMain = (MainJDBCTemplate) context.getBean("mainDAO");
		
		e = new HashMap<Integer, Eleve>();
		a = new HashMap<Integer, Absences>();
		c = new HashMap<Integer, Competences>();
		sc = new HashMap<Integer, SousCompetences>();
	
	}

	

	@RequestMapping(value = "/ficheGroupe-{numgroupe}", method = RequestMethod.GET)
	public String getEleves(HttpSession session,HttpServletRequest request,@PathVariable String numgroupe,Model model) 
	{
		int tuteurType = daoMain.tuteurType((String) session.getAttribute("email"));
		System.out.println(tuteurType);
		model.addAttribute("typeTuteur",tuteurType);

		String groupeno = (String)numgroupe;
//		Pour récupérer tous les �l�ves d'un groupe

		List<Eleve> eleves = dao.elevesParGroupe((String)groupeno);
		model.addAttribute("numerogroupe", groupeno);
		model.addAttribute("alleleves", eleves);

		
		List<Competences> allcompetences = daoCompetences.allCompetences();
		model.addAttribute("allcompetences", allcompetences);
		
		List<SousCompetences> allsouscompetences = daoCompetences.allSousCompetences();
		model.addAttribute("allsouscompetences", allsouscompetences);
		
		//pour remplir la grille de comp�tences si ce n'est pas d�j� fait
		
		//r�cup�rer les lignes de notes_competences des �l�ves du groupe actif
		
		List<NoteCompetences> notecompParGroupe = daoCompetences.getGrilleParGroupe(groupeno);
		List<NoteCompetencesGroupe> notecompGroupe = daoCompetences.getGrilleGroupe(groupeno);
		

		model.addAttribute("notecompetences",notecompParGroupe);
		model.addAttribute("notecompetencesgroupe",notecompGroupe);

		
		//r�cup�rer les absences
		
		return "ficheGroupe";
	}
	
	@RequestMapping(value ="/addAbsences-{numgroupe}", method = RequestMethod.POST)
	public String addAbsences(HttpServletRequest request,@PathVariable String numgroupe,Model model) 
	{
		String groupeno = (String)numgroupe;
//		Pour récupérer tous les �l�ves d'un groupe
		List<Eleve> eleves = dao.elevesParGroupe((String)groupeno);
		model.addAttribute("numerogroupe", groupeno);
		model.addAttribute("alleleves", eleves);
		
		
		
		for(int i=0;i<eleves.size();i++){
			int id = eleves.get(i).getId();
			Absences absences = new Absences();
			String absent = request.getParameter("absence-"+id);
						
				Date date = new Date();
				absences.setDate(date);
				absences.setEleves_id(id);
				absences.setAbscencescol(absent);
				
				daoAbsences.insertAbsence(absences);
			
		}
	
		return "ficheGroupe";
	}	
	
	@RequestMapping(value ="/addGrilleE-{numgroupe}-{numfamille}", method = RequestMethod.POST)
	public String addGrilleE(HttpServletRequest request,@PathVariable String numgroupe,@PathVariable String numfamille,Model model) 
	{
		String groupeno = (String)numgroupe;
//		Pour récupérer tous les �l�ves d'un groupe
		List<Eleve> eleves = dao.elevesParGroupe((String)numgroupe);
		model.addAttribute("numerogroupe", numgroupe);
		model.addAttribute("alleleves", eleves);
		
		Integer famillenumber = Integer.parseInt(numfamille);
		
		//r�cup�rer toutes les comp�tences de la famille � remplir
		List<SousCompetences> scs = daoCompetences.souscompParFamille(famillenumber);
		
		//pour toutes les comp�tences de la famille soumise au remplissage
		for (int i=0;i<scs.size();i++) {
			int scid = scs.get(i).getId();
			//pour tous les membres du groupe 
			for(int j=0;j<eleves.size();j++) {
				//r�cup�re les valeurs de tous les inputs remplis
				int ideleve = eleves.get(j).getId();
				
				//r�cup�re la valeur de l'input pour chaque comp�tence/famille/�l�ve du groupe
				String levelid = request.getParameter("eleve-"+numfamille+"-"+scid+"-"+ideleve);
				
				//test si les bonnes variables sont r�cup�r�es
				System.out.println(scid);
				System.out.println(numfamille);
				System.out.println(ideleve);
				
				
				
				String remarques = request.getParameter("eleveremarques-"+numfamille+"-"+scid+"-"+ideleve);
				//ins�re dans la table notes_competences
				//!!!!!!!!!!!!!! remplace table notes_sous_competences par notes_competences_groupe (INUTILE)
				
				//nouvel objet note pour les �l�ves
				
				//si la valeur de l'input est undefined on n'ins�re rien dans la BDD
				if (levelid != null) {
					Integer levelIdInt = Integer.parseInt(levelid);
					NoteCompetences notecomp = new NoteCompetences();
					notecomp.setEleves_id(ideleve);
					notecomp.setCompetences_id(famillenumber);
					notecomp.setNiveaux_competences_id(levelIdInt);
					notecomp.setRemarques(remarques);
					notecomp.setSous_competences_id(scid);
					
					//v�rifier en m�me temps si la comp�tence a d�j� �t� not�e
					daoCompetences.ajoutGrilleEleve(notecomp);
					}
				
			}
		}
	
		return "ficheGroupe";
	}	
	
	@RequestMapping(value ="/addGrilleG-{numgroupe}-{numfamille}", method = RequestMethod.POST)
	public String addGrilleG(HttpServletRequest request,@PathVariable String numgroupe,@PathVariable String numfamille,Model model) 
	{
		String groupeno = (String)numgroupe;
//		Pour récupérer tous les �l�ves d'un groupe
		List<Eleve> eleves = dao.elevesParGroupe((String)numgroupe);
		model.addAttribute("numerogroupe", numgroupe);
		model.addAttribute("alleleves", eleves);
		
		Integer famillenumber = Integer.parseInt(numfamille);
		
		//r�cup�rer toutes les comp�tences de la famille � remplir
		List<SousCompetences> scs = daoCompetences.souscompParFamille(famillenumber);
		
		//pour toutes les comp�tences de la famille soumise au remplissage
		for (int i=0;i<scs.size();i++) {
			int scid = scs.get(i).getId();
			//pour tous les membres du groupe 

				
				//r�cup�re la valeur de l'input pour chaque comp�tence/famille/�l�ve du groupe
				String levelid = request.getParameter("groupe-"+numfamille+"-"+scid);
				
				//test si les bonnes variables sont r�cup�r�es
				System.out.println(scid);
				System.out.println(numfamille);
				
				
				
				String remarques = request.getParameter("grouperemarques-"+numfamille+"-"+scid);
				//ins�re dans la table notes_competences
				//!!!!!!!!!!!!!! remplace table notes_sous_competences par notes_competences_groupe (INUTILE)
				
				//nouvel objet note pour les �l�ves
				
				//si la valeur de l'input est undefined on n'ins�re rien dans la BDD
				if (levelid != null) {
					NoteCompetencesGroupe notecompgroupe = new NoteCompetencesGroupe();
					Integer levelIdInt = Integer.parseInt(levelid);
					notecompgroupe.setCompetences_id(famillenumber);
					notecompgroupe.setNiveaux_competences_id(levelIdInt);
					notecompgroupe.setRemarques(remarques);
					notecompgroupe.setSous_competences_id(scid);
					notecompgroupe.setGroupe(numgroupe);
					
					//v�rifier en m�me temps si la comp�tence a d�j� �t� not�e
					daoCompetences.ajoutGrilleGroupe(notecompgroupe);
					}
				
		}
	
		return "ficheGroupe";
	}		
	

	
}


