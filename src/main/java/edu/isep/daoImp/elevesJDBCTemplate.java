package edu.isep.daoImp;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

import edu.isep.beans.Eleve;
import edu.isep.beans.Tuteur;

public class elevesJDBCTemplate {
	private DataSource datasource;
	private JdbcTemplate jdbcTemplateObject;
	
	public void setDataSource(DataSource dataSource){
		this.datasource = dataSource;
		this.jdbcTemplateObject = new JdbcTemplate(dataSource);
	}
	
	public List<Eleve> allEleves(){
		String sql = "SELECT * FROM tuteur";
		
		ArrayList<Eleve> eleves =  new ArrayList<Eleve>();
		
		List<Map<String,Object>> rows = jdbcTemplateObject.queryForList(sql);
		
		for (Map row : rows) {
			Eleve eleve =  new Eleve();
			
			eleve.setId(Integer.parseInt(String.valueOf(row.get("id"))));
			eleve.setNom((String)row.get("nom"));
			eleve.setPrenom((String)row.get("prenom"));
			eleve.setMail((String)row.get("mail"));
			eleve.setCode_eleve(Integer.parseInt(String.valueOf(row.get("code_eleve"))));
			eleve.setPromo((String)row.get("promo"));
			eleve.setGroupe((String)row.get("groupe"));
			eleve.setNote(Integer.parseInt(String.valueOf(row.get("note"))));
			
			eleves.add(eleve);
		}

		return eleves;
	}
	
//	fonction pour selectionner les élèves qui n'ont pas de groupe
	
//	fonction pour selectionner les élèves qui ont un groupe
	
//	fonction pour selectionner les élèves d'un certain groupe en param
	
	
//	public void insertAttribution(User user){
//		String sql = "INSERT INTO users(user,password,type) VALUES(?,?,?)";
//		jdbcTemplateObject.update(sql,new Object[]{user.getUser(),user.getPassword(),user.getType()});
//		return;
//	}
}
