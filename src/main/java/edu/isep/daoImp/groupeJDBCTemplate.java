package edu.isep.daoImp;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

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
	
//	Récupérer un groupe grâce à son id
	public Groupe getGroupe(int id){
		
		class GroupeMapper implements RowMapper<Groupe> {
			   public Groupe mapRow(ResultSet rs, int rowNum) throws SQLException{
				   
				  Groupe groupe =  new Groupe();
			      groupe.setId(rs.getInt("id"));
			      groupe.setNom(rs.getString("nom"));
			      return groupe;
			}  
		}
		
		String sql = "SELECT * FROM groupes where id = ?";
		Groupe groupe = jdbcTemplateObject.queryForObject(sql, new Object[]{id}, new GroupeMapper());
		return groupe;
	}
	
//	Récupérer tous les groupes
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
	
//	Ajouter un groupe
	public void addGroup(Groupe groupe){
		String sql = "INSERT INTO groupes(nom, tuteur_id) VALUES(?,?)";
		jdbcTemplateObject.update(sql,new Object[]{groupe.getNom(), groupe.getTuteur_id()});
		return;
	}

//	Supprimer un groupe
	public void deleteGroupe(Groupe groupe){
		String sql = "DELETE FROM groupes WHERE nom = ?";
		jdbcTemplateObject.update(sql,new Object[]{groupe.getNom()});
		return;
	}
	
}