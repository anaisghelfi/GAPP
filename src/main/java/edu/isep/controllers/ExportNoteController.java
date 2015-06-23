package edu.isep.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.isep.beans.Eleve;
import edu.isep.daoImp.ExportNoteJDBCTemplate;
import edu.isep.daoImp.MainJDBCTemplate;

@Controller
public class ExportNoteController {
	
	private ExportNoteJDBCTemplate daoExportNote;
	private MainJDBCTemplate daoMain;
	
	
		public ExportNoteController(){
			
			ApplicationContext context = new ClassPathXmlApplicationContext("Bean.xml");
			daoExportNote = (ExportNoteJDBCTemplate) context.getBean("exportNoteDAO");
			daoMain = (MainJDBCTemplate) context.getBean("mainDAO");
			
		}
		
		@RequestMapping(value="/exportNote",method = RequestMethod.GET)
		public String afficher(HttpSession session,Model model){
			
			if(session.getAttribute("type") == "professeur"){
				int tuteurType = daoMain.tuteurType((String) session.getAttribute("email"));
				System.out.println(tuteurType);
				model.addAttribute("typeTuteur",tuteurType);
			}
			
			
			return "exportNote";
		}
		@RequestMapping(value="/exportNote",method = RequestMethod.POST)
		public String exporter(Eleve eleve,Model model){
			 
			String fileName = System.getProperty("user.home")+"/Desktop/note.csv";

			daoExportNote.exportCSV(fileName);		
			return "exportNote";
		}
	
}
