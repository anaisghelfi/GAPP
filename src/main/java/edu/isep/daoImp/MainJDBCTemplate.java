package edu.isep.daoImp;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

import edu.isep.beans.Tuteur;

public class MainJDBCTemplate {
	private DataSource datasource;
	private JdbcTemplate jdbcTemplateObject;
	
	public void setDataSource(DataSource dataSource){
		this.datasource = dataSource;
		this.jdbcTemplateObject = new JdbcTemplate(dataSource);
	}
	
	public int tuteurType(String mail){
		String sql = "SELECT type FROM tuteur WHERE mail = ?";
		
		int rows = jdbcTemplateObject.queryForInt(sql,new Object[]{mail});
	
		return rows;
	}
	
}
