package edu.isep.daoImp;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import edu.isep.beans.Competences;
import edu.isep.beans.Groupe;
import edu.isep.beans.SousCompetences;
import edu.isep.daoImp.CompetencesJDBCTemplate;

public class CompetencesJDBCTemplate {

	private DataSource datasource;
	private JdbcTemplate jdbcTemplateObject;
	
	public void setDataSource(DataSource dataSource){
		this.datasource = dataSource;
		this.jdbcTemplateObject = new JdbcTemplate(dataSource);
	}
	
	public void insertCompetences(Competences competences){
		String sql = "INSERT INTO competences(famille,coefficient) VALUES(?,?)";
		jdbcTemplateObject.update(sql,new Object[]{competences.getFamille(),competences.getCoefficient()});
		return;
	}

//	Supprimer une famille
	public void deleteCompetence(Integer id){
		String sql = "DELETE FROM competences WHERE id = ?";
		jdbcTemplateObject.update(sql,new Object[]{id});
		return;
	}	
	
//	Supprimer une souscompétence
	public void deleteSousCompetence(Integer id){
		String sql = "DELETE FROM sous_competences WHERE id = ?";
		jdbcTemplateObject.update(sql,new Object[]{id});
		return;
	}	
		
	
//	Update une famille
	public void updateCompetence(Competences competences){
		String sql = "UPDATE competences SET famille = ?, coefficient = ? WHERE id = ?";
		jdbcTemplateObject.update(sql,new Object[]{competences.getFamille(),competences.getCoefficient(),competences.getId()});
		return;
	}
	
	
	
	public void insertSousCompetences(SousCompetences souscompetences){
		String sql = "INSERT INTO sous_competences(sous_competences,competences_id,B,I,M,E) VALUES(?,?,?,?,?,?)";
		jdbcTemplateObject.update(sql,new Object[]{souscompetences.getSous_competences(),souscompetences.getCompetences_id(),souscompetences.getB(),souscompetences.getI(),souscompetences.getM(),souscompetences.getE()});
		return;
	}
	
	
	public List<Competences> allCompetences() {
		String sql = "SELECT * FROM competences";
		
		ArrayList<Competences> competences =  new ArrayList<Competences>();
		
		List<Map<String,Object>> rows = jdbcTemplateObject.queryForList(sql);
		
		for (Map row : rows) {
			Competences competence =  new Competences();
			
			competence.setId(Integer.parseInt(String.valueOf(row.get("id"))));
			competence.setFamille((String)row.get("famille"));
			competence.setCoefficient(Double.parseDouble(String.valueOf(row.get("coefficient"))));
			
			competences.add(competence);
		}

		return competences;
	}
	
	public List<SousCompetences> allSousCompetences(){
		String sql = "SELECT * FROM sous_competences";
		
		ArrayList<SousCompetences> souscompetences =  new ArrayList<SousCompetences>();
		
		List<Map<String,Object>> rows = jdbcTemplateObject.queryForList(sql);
		
		for (Map row : rows) {
			SousCompetences souscompetence =  new SousCompetences();
			
			souscompetence.setId(Integer.parseInt(String.valueOf(row.get("id"))));
			souscompetence.setSous_competences((String)row.get("sous_competences"));
			souscompetence.setCompetences_id((int) row.get("competences_id"));
			souscompetence.setSous_competences((String)row.get("B"));
			souscompetence.setSous_competences((String)row.get("I"));
			souscompetence.setSous_competences((String)row.get("M"));
			souscompetence.setSous_competences((String)row.get("E"));
			
			souscompetences.add(souscompetence);
		}

		return souscompetences;
	}
	


	
	
}



