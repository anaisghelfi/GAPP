package edu.isep.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import edu.isep.beans.Tuteur;
import edu.isep.daoImp.AttribRoleJDBCTemplate;


@Controller
public class AttribRoleController {
	
	private AttribRoleJDBCTemplate daoAttribRole;
	private Map<Integer, Tuteur> t;
	
	public AttribRoleController(){
		
		ApplicationContext context = new ClassPathXmlApplicationContext("Bean.xml");
		daoAttribRole = (AttribRoleJDBCTemplate) context.getBean("attribRoleDAO");
		
		t = new HashMap<Integer, Tuteur>();
	}
	
	@RequestMapping(value="/attribRole",method = RequestMethod.GET)
	public String allTuteurs(Model model){
		
		List<Tuteur> tuteurs = daoAttribRole.getTuteurs();
		model.addAttribute("tuteurs",tuteurs);
		
		return "attribRole";
	}
	
	@RequestMapping(value="/attribRole",method = RequestMethod.POST)
	public String updateRole(HttpServletRequest request, Model model){
		
		List<Tuteur> tuteurs = daoAttribRole.getTuteurs();
		model.addAttribute("tuteurs",tuteurs);
		
		for(int i=0;i<tuteurs.size();i++){
			int id = tuteurs.get(i).getId();
			if(request.getParameter("type-"+id) == null){
				
			}else{
				Tuteur tuteur = new Tuteur();
				String type = request.getParameter("type-"+id);
							
				tuteur.setId(id);
				tuteur.setType(Integer.parseInt(type));
				daoAttribRole.updateRole(tuteur);
			}
		}
		
		return "attribRole";
	}
	
}
