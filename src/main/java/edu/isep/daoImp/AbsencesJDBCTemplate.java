package edu.isep.daoImp;

import java.sql.Date;
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
import edu.isep.beans.Tuteur;

public class AbsencesJDBCTemplate {

	private DataSource datasource;
	private JdbcTemplate jdbcTemplateObject;
	
	public void setDataSource(DataSource dataSource){
		this.datasource = dataSource;
		this.jdbcTemplateObject = new JdbcTemplate(dataSource);
	}
	

	public void insertAbsence(Absences absences){
//		On fait un select pour voir si cette evalcroisee est deja présente en base		
		String sql = "SELECT COUNT(*) FROM absences WHERE date = ? AND eleves_id = ?";
		int rownum = jdbcTemplateObject.queryForInt(sql, new Object[]{absences.getDate(), absences.getEleves_id()});
		
		
//		Faire la vérif que la note n'existe pas déjà
		if(rownum == 0){
//			On insere si la note existe pas déjà
			sql = "INSERT INTO absences(date,eleves_id,absencescol) VALUES(?,?,?)";
			jdbcTemplateObject.update(sql,new Object[]{absences.getDate(),absences.getEleves_id(),absences.getAbscencescol()});
			return;
		}
		else{
//			On update si la note existe deja
			sql = "UPDATE absences "
					+ "SET absencescol = ? "
					+ " WHERE date = ? AND eleves_id = ?";
			jdbcTemplateObject.update(sql,new Object[]{absences.getAbscencescol(),absences.getDate(),absences.getEleves_id()});
			return;
		}
	}
	
	//select absences pour la journ�e en cours et le groupe en cours
	
	public List<Absences> absencesToday(Date date,String groupe){
		String sql = "SELECT A.absencescol, A.eleves_id FROM absences A, eleves E WHERE A.date = ? AND A.eleves_id = E.id AND E.groupe = ?";
		
		ArrayList<Absences> absences =  new ArrayList<Absences>();
		
		List<Map<String,Object>> rows = jdbcTemplateObject.queryForList(sql, new Object[]{date,groupe});
		
		for (Map row : rows) {
			Absences absence =  new Absences();
			
			absence.setEleves_id(Integer.parseInt(String.valueOf(row.get("eleves_id"))));
			absence.setAbscencescol((String)row.get("absencescol"));
			
			
			absences.add(absence);
		}

		return absences;
	}
	


	
	
}



