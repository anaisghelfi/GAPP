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

import edu.isep.beans.Absences;
import edu.isep.beans.Competences;

public class AbsencesJDBCTemplate {

	private DataSource datasource;
	private JdbcTemplate jdbcTemplateObject;
	
	public void setDataSource(DataSource dataSource){
		this.datasource = dataSource;
		this.jdbcTemplateObject = new JdbcTemplate(dataSource);
	}
	

	public void insertAbsence(Absences absences){
		String sql = "INSERT INTO absences(date,eleves_id,absencescol) VALUES(?,?,?)";
		jdbcTemplateObject.update(sql,new Object[]{absences.getDate(),absences.getEleves_id(),absences.getAbscencescol()});
		return;
	}

	
	
}



