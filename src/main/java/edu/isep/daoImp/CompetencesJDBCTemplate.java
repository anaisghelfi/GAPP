package edu.isep.daoImp;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import edu.isep.beans.Competences;
import edu.isep.daoImp.CompetencesJDBCTemplate;

public class CompetencesJDBCTemplate {

	private DataSource datasource;
	private JdbcTemplate jdbcTemplateObject;
	
	public void setDataSource(DataSource dataSource){
		this.datasource = dataSource;
		this.jdbcTemplateObject = new JdbcTemplate(dataSource);
	}
	
	public void insertUser(Competences competences){
		String sql = "INSERT INTO competences(famille,coefficient) VALUES(?,?)";
		jdbcTemplateObject.update(sql,new Object[]{competences.getFamille(),competences.getCoefficient()});
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
	
}



