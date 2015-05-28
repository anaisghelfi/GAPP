package edu.isep.daoImp;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

import edu.isep.beans.SousGroupe;
import edu.isep.beans.Groupe;

public class SousGroupesJDBCTemplate {

	private DataSource datasource;
	private JdbcTemplate jdbcTemplateObject;
	
	public void setDataSource(DataSource dataSource){
		this.datasource = dataSource;
		this.jdbcTemplateObject = new JdbcTemplate(dataSource);
	}
	
	public List<SousGroupe> allSousGroupes(){
		String sql = "SELECT * FROM sous_groupes";
		
		ArrayList<SousGroupe> sousGroupes =  new ArrayList<SousGroupe>();
		
		List<Map<String,Object>> rows = jdbcTemplateObject.queryForList(sql);
		
		for (Map row : rows) {
			SousGroupe sousGroupe =  new SousGroupe();
			
			sousGroupe.setId(Integer.parseInt(String.valueOf(row.get("id"))));
			sousGroupe.setNom((String)row.get("nom"));
			sousGroupe.setGroupes_id(Integer.parseInt(String.valueOf(row.get("groupes_id"))));
			
			sousGroupes.add(sousGroupe);
		}

		return sousGroupes;
	}

	public void addSousGroupe(SousGroupe sousgroupe) {
		// TODO Auto-generated method stub
		String sql = "INSERT INTO sous_groupes(nom, groupes_id) VALUES (?,?)";
		jdbcTemplateObject.update(sql, new Object[]{sousgroupe.getNom(), sousgroupe.getGroupes_id()});
		return;
		
	}

	public void deleteSousGroupe(SousGroupe sousGroupe) {
		// TODO Auto-generated method stub
		String sql = "DELETE FROM sous_groupes WHERE id = ?";
		jdbcTemplateObject.update(sql,new Object[]{sousGroupe.getId()});
		return;
	}
	
	
}
