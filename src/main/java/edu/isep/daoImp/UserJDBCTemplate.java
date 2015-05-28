package edu.isep.daoImp;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

import edu.isep.beans.Deadline;
import edu.isep.beans.User;


public class UserJDBCTemplate{
	
	private DataSource datasource;
	private JdbcTemplate jdbcTemplateObject;
	
	public void setDataSource(DataSource dataSource){
		this.datasource = dataSource;
		this.jdbcTemplateObject = new JdbcTemplate(dataSource);
	}
	
	public void insertUser(User user){
		String sql = "INSERT INTO users(user,password,type) VALUES(?,?,?)";
		jdbcTemplateObject.update(sql,new Object[]{user.getUser(),user.getPassword(),user.getType()});
		return;
	}
	
	
	
	
}
