package edu.isep.daoImp;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

import edu.isep.beans.Groupe;
import edu.isep.beans.Tuteur;

public class TuteurJDBCTemplate {
	
	private DataSource datasource;
	private JdbcTemplate jdbcTemplateObject;
	
	public void setDataSource(DataSource dataSource){
		this.datasource = dataSource;
		this.jdbcTemplateObject = new JdbcTemplate(dataSource);
	}
	
	public List<Tuteur> allTuteurs(){
		String sql = "SELECT * FROM tuteur";
		
		ArrayList<Tuteur> tuteurs =  new ArrayList<Tuteur>();
		
		List<Map<String,Object>> rows = jdbcTemplateObject.queryForList(sql);
		
		for (Map row : rows) {
			Tuteur tuteur =  new Tuteur();
			
			tuteur.setId(Integer.parseInt(String.valueOf(row.get("id"))));
			tuteur.setNom((String)row.get("nom"));
			tuteur.setPrenom((String)row.get("prenom"));
			tuteur.setMail((String)row.get("mail"));
			
			tuteurs.add(tuteur);
		}

		return tuteurs;
	}
}
