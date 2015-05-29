package edu.isep.daoImp;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

import edu.isep.beans.Deadline;

public class DeadlineJDBCTemplate {
	
	private DataSource datasource;
	private JdbcTemplate jdbcTemplateObject;
	
	public void setDataSource(DataSource dataSource){
		this.datasource = dataSource;
		this.jdbcTemplateObject = new JdbcTemplate(dataSource);
	}
	
	public void ajout_deadline(Deadline deadline){
		String sql = "INSERT INTO deadlines(titre, description, date_limite, groupes_id) VALUES(?,?,?,?)";
		jdbcTemplateObject.update(sql,new Object[]{deadline.getTitre(),deadline.getDescription(),deadline.getDate_limite() , deadline.getGroupes_id()});
		return ;
	}
	
	
//	Récupérer tous les groupes
	public List<Deadline> allDeadline(){
		String sql = "SELECT * FROM deadlines";
		
		ArrayList<Deadline> deadlines =  new ArrayList<Deadline>();
		
		List<Map<String,Object>> rows = jdbcTemplateObject.queryForList(sql);
		
		for (Map row : rows) {
			Deadline deadline =  new Deadline();
			
			deadline.setId(Integer.parseInt(String.valueOf(row.get("id"))));
			deadline.setTitre((String)row.get("titre"));
			deadline.setDescription((String)row.get("description"));
			deadline.setDate_limite((Date)row.get("date_limite"));
			deadline.setGroupes_id(Integer.parseInt(String.valueOf(row.get("groupes_id"))));
			
			deadlines.add(deadline);
		}

		return deadlines;
	}
	
}