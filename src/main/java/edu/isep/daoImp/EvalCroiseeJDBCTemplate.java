package edu.isep.daoImp;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

public class EvalCroiseeJDBCTemplate {


	private DataSource datasource;
	private JdbcTemplate jdbcTemplateObject;
	
	public void setDataSource(DataSource dataSource){
		this.datasource = dataSource;
		this.jdbcTemplateObject = new JdbcTemplate(dataSource);
	}
	
	public void InsertNote(){
		
	}
}
