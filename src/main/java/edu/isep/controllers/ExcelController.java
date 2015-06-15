package edu.isep.controllers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.isep.beans.User;
import edu.isep.daoImp.UserJDBCTemplate;


@Controller
public class ExcelController {

	private UserJDBCTemplate daoUser;
	
	
	public ExcelController(){
		ApplicationContext context = new ClassPathXmlApplicationContext("file:/Users/David/git/GAPP/src/main/java/edu/isep/gapp/Bean.xml");
		//		Declaration des DAO et variables
		daoUser = (UserJDBCTemplate) context.getBean("userDAO");
	
	}
	
	@RequestMapping(value = "/addUser", method = RequestMethod.GET)
	public void addUser(User user, Model model){
		
		daoUser.readCsvFile("/Users/Victorien/git/GAPP2/E1415_groupes APP S2.csv");
		
	}
}
