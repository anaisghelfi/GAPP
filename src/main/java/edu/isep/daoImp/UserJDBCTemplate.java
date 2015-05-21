package edu.isep.daoImp;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

import edu.isep.beans.Deadline;
import edu.isep.beans.InsertEleve;
import edu.isep.beans.User;
import edu.isep.daoImp.UserJDBCTemplate;

public class UserJDBCTemplate{
	
	private DataSource datasource;
	private JdbcTemplate jdbcTemplateObject;
	
	public void setDataSource(DataSource dataSource){
		this.datasource = dataSource;
		this.jdbcTemplateObject = new JdbcTemplate(dataSource);
	}
	
	public void insertUser(User user){
		String sql = "INSERT INTO users(user,password,type) VALUES(?,?,?)";
		jdbcTemplateObject.update(sql,new Object[]{user.getUser(),user.getPassword(),user.getType()});
		return;
	}
	
	public void insertEleve(InsertEleve eleve){
		String sql = "INSERT INTO eleve(nom, prenom, promo, mail, groupe) VALUES(?,?,?,?,?)";
		jdbcTemplateObject.update(sql,new Object[]{eleve.getNom(),eleve.getPrenom(),eleve.getPromo(), eleve.getMail(), eleve.getGroupe()});
		return;
	}
	
	public void ajout_deadline(Deadline deadline){
		String sql = "INSERT INTO deadlines(titre, description, date_limite, groupe) VALUES(?,?,?,?)";
		jdbcTemplateObject.update(sql,new Object[]{deadline.getTitre(),deadline.getDecription(),deadline.getDate_limite() , deadline.getGroupe()});
		return;
	}
}
