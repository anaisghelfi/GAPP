package edu.isep.daoImp;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import edu.isep.beans.Deadline;
import edu.isep.beans.Eleve;
import edu.isep.beans.Groupe;

public class RechercherJDBCTemplate {

	private DataSource datasource;
	private JdbcTemplate jdbcTemplateObject;
	
	public void setDataSource(DataSource dataSource){
		this.datasource = dataSource;
		this.jdbcTemplateObject = new JdbcTemplate(dataSource);
	}
	
			
public <List>Eleve getNom(String nom){
		
		class GroupeMapper implements RowMapper<Eleve> {
			   public Eleve mapRow(ResultSet rs, int rowNum) throws SQLException{
				   
				  Eleve allEleve =  new Eleve();
				  allEleve.setNom(rs.getString("nom"));
				  allEleve.setId(rs.getInt("id"));
				  allEleve.setNom(rs.getString("prenom"));
				  allEleve.setNom(rs.getString("promo"));
				  allEleve.setNom(rs.getString("mail"));
				  allEleve.setNom(rs.getString("groupe"));
				  allEleve.setNom(rs.getString("note"));
			      return allEleve;
			}  
		}
		
		String sql = "SELECT * FROM eleves where nom = ?";
		Eleve allEleve = jdbcTemplateObject.queryForObject(sql, new Object[]{nom}, new GroupeMapper());
		return allEleve;
	}
	
	
}
