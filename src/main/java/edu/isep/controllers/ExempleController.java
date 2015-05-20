package edu.isep.controllers;

import java.util.HashMap;
import java.util.Map;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


import edu.isep.beans.User;
import edu.isep.daoImp.UserJDBCTemplate;

@Controller
public class ExempleController {
	private UserJDBCTemplate dao;
	private Map<Integer, User> u;
	
	
	public ExempleController(){
		ApplicationContext context = new ClassPathXmlApplicationContext("file:/Users/Anaïs/git/GAPP/src/main/java/edu/isep/gapp/Bean.xml");
		dao = (UserJDBCTemplate) context.getBean("userDAO");
		u = new HashMap<Integer, User>();
		
	}
	@RequestMapping(value="/exemple",method = RequestMethod.GET)
	public String Exemple(){
		return "exemple";
	}
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String add(User user, Model model)
	{
		u.put(user.getId(), user);
		dao.insertUser(user);
		model.addAttribute("user", u);
		return "exemple";
	}
}
