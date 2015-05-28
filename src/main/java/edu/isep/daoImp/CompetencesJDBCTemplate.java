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
	
	public void insertSousCompetences(SousCompetences souscompetences){
		String sql = "INSERT INTO sous_competences(sous_competences,competences_id) VALUES(?,?)";
		jdbcTemplateObject.update(sql,new Object[]{souscompetences.getSous_competences(),souscompetences.getCompetences_id()});
		return;
	}
	
	
	private static final class CompetencesMapper implements RowMapper {

		 public Competences mapRow(ResultSet rs, int rowNum) throws SQLException {
		 Competences comp = new Competences();
		 
		 comp.setFamille(rs.getString("famille"));
		 comp.setCoefficient(rs.getDouble("coefficient"));
		 return comp;
		 }
	}
	
	public Collection<Competences> getAllCompetences() {
		 return this.jdbcTemplateObject.query( "select * from competences", new CompetencesMapper());
	}
	
	private static final class SousCompetencesMapper implements RowMapper {

		 public SousCompetences mapRow(ResultSet rs, int rowNum) throws SQLException {
		 SousCompetences souscomp = new SousCompetences();
		 
		 souscomp.setSous_competences(rs.getString("sous_competences"));
		 souscomp.setCompetences_id(rs.getInt("competences_id"));
		 return souscomp;
		 }
	}
	
	public Collection<SousCompetences> getAllSousCompetences() {
		 return this.jdbcTemplateObject.query( "select * from sous_competences", new SousCompetencesMapper());
	}	
	

	
	
}



