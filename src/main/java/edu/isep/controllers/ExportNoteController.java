package edu.isep.controllers;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import edu.isep.beans.Eleve;
import edu.isep.daoImp.ExportNoteJDBCTemplate;

@Controller
public class ExportNoteController {
	
	private ExportNoteJDBCTemplate daoExportNote;
	
		public ExportNoteController(){
			
			ApplicationContext context = new ClassPathXmlApplicationContext("Bean.xml");
			daoExportNote = (ExportNoteJDBCTemplate) context.getBean("exportNoteDAO");
			
		}
		
		@RequestMapping(value="/exportNote",method = RequestMethod.GET)
		public String afficher(Model model){
					
			return "exportNote";
		}
		@RequestMapping(value="/exportNote",method = RequestMethod.POST)
		public String exporter(Eleve eleve,Model model){
			 
			String fileName = System.getProperty("user.home")+"/Desktop/note.csv";

			daoExportNote.exportCSV(fileName);		
			return "exportNote";
		}
	
}
