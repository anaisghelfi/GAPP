package edu.isep.daoImp;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

import edu.isep.beans.Competences;
import edu.isep.beans.Tuteur;


public class HomeJDBCTemplate {
	
	private DataSource datasource;
	private JdbcTemplate jdbcTemplateObject;
	
	public void setDataSource(DataSource dataSource){
		this.datasource = dataSource;
		this.jdbcTemplateObject = new JdbcTemplate(dataSource);
	}
	
	public int tuteurExist(String mail){
		String sql = "SELECT COUNT(*) FROM tuteur WHERE mail = ?";
		
		int numRows =  jdbcTemplateObject.queryForInt(sql,new Object[]{mail});
		
		return numRows;
	}
	
	public void insertTuteur(Tuteur tuteur){
		String sql = "INSERT INTO tuteur(nom,prenom,mail,type) VALUES(?,?,?,1)";
		jdbcTemplateObject.update(sql,new Object[]{tuteur.getNom(),tuteur.getPrenom(),tuteur.getMail()});
		return;
	}
	
	
	
}
