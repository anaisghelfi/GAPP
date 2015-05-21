package edu.isep.daoImp;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

import edu.isep.beans.Groupe;
import edu.isep.beans.User;
//import edu.isep.mappers.GroupeMapper;

public class groupeJDBCTemplate {

	private DataSource datasource;
	private JdbcTemplate jdbcTemplateObject;
	
	public void setDataSource(DataSource dataSource){
		this.datasource = dataSource;
		this.jdbcTemplateObject = new JdbcTemplate(dataSource);
	}
	
	public void addGroup(Groupe groupe){
		String sql = "INSERT INTO groupes(nom, tuteur_id) VALUES(?,?)";
		jdbcTemplateObject.update(sql,new Object[]{groupe.getNom(), groupe.getTuteur_id()});
		return;
	}
	
	public List<Groupe> allGroupes(){
		String sql = "SELECT * FROM groupes";
		
		ArrayList<Groupe> groupes =  new ArrayList<Groupe>();
		
		List<Map<String,Object>> rows = jdbcTemplateObject.queryForList(sql);
		
		for (Map row : rows) {
			Groupe groupe =  new Groupe();
			
			groupe.setId(Integer.parseInt(String.valueOf(row.get("id"))));
			groupe.setNom((String)row.get("nom"));
			groupe.setTuteur_id(Integer.parseInt(String.valueOf(row.get("tuteur_id"))));
			
			groupes.add(groupe);
		}

		return groupes;
	}
	
}
