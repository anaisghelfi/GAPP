package edu.isep.daoImp;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

import edu.isep.beans.Deadline;
import edu.isep.beans.Groupe;
import edu.isep.beans.Seances;

public class DeadlineJDBCTemplate {
	
	private DataSource datasource;
	private JdbcTemplate jdbcTemplateObject;
	
	public void setDataSource(DataSource dataSource){
		this.datasource = dataSource;
		this.jdbcTemplateObject = new JdbcTemplate(dataSource);
	}
	
	
	//Ajouter une deadline
	public void ajout_deadline(Deadline deadline){
		String sql = "INSERT INTO deadlines(titre, description, date_limite, groupes_id) VALUES(?,?,?,?)";
		jdbcTemplateObject.update(sql,new Object[]{deadline.getTitre(),deadline.getDescription(),deadline.getDate_limite() , deadline.getGroupes_id()});
		return ;
	}
	
	//Supprimer une deadline
	public void delete_deadline(Deadline deadline){
		String sql = "DELETE FROM deadlines WHERE titre = ?";
		jdbcTemplateObject.update(sql,new Object[]{deadline.getTitre()});
		return;
	}
	
	
	
	public List<Deadline> allDeadline(){
		String sql = "SELECT * FROM deadlines";
		
		ArrayList<Deadline> deadlines =  new ArrayList<Deadline>();
		
		List<Map<String,Object>> rows = jdbcTemplateObject.queryForList(sql);
		
		for (Map row : rows) {
			Deadline deadline =  new Deadline();
			
			SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd");
			deadline.setId(Integer.parseInt(String.valueOf(row.get("id"))));
			deadline.setTitre((String)row.get("titre"));
			deadline.setDescription((String)row.get("description"));
			deadline.setDate_limite((Date) row.get("date_limite"));
			deadline.setGroupes_id(Integer.parseInt(String.valueOf(row.get("groupes_id"))));
			
			deadlines.add(deadline);
		}

		return deadlines;
	}
	
	//Voir toutes les séances d'APP de tout les groupes
	public List<Seances> allSeance(){
		String sql = "SELECT seances.id, numero_seance, date_seance, groupes.nom FROM seances INNER JOIN groupes ON seances.groupes_id = groupes.id";
		
		ArrayList<Seances> seances =  new ArrayList<Seances>();
		
		List<Map<String,Object>> rows = jdbcTemplateObject.queryForList(sql);
		
		for (Map row : rows) {
			Seances seance =  new Seances();
			
			SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd");
			seance.setId(Integer.parseInt(String.valueOf(row.get("id"))));
			seance.setNumero_seance(Integer.parseInt(String.valueOf(row.get("numero_seance"))));
			seance.setDate_seance((Date)row.get("date_seance"));
			seance.setNom((String)row.get("nom"));
			//seance.setGroupes_id(Integer.parseInt(String.valueOf(row.get("groupes_id"))));
			
			seances.add(seance);
		}

		return seances;
	}
	
	//Ajouter une séance d'APP
	public void ajout_seance(Seances seance){
		String sql = "INSERT INTO seances(numero_seance, date_seance, groupes_id) VALUES(?,?,?)";
		jdbcTemplateObject.update(sql,new Object[]{seance.getNumero_seance(),seance.getDate_seance(),seance.getGroupes_id()});
		return ;
	}
	
	//Supprimer une seance
		public void delete_seance(Seances seances){
			String sql = "DELETE FROM seances WHERE id = ?";
			jdbcTemplateObject.update(sql,new Object[]{seances.getId()});
			return;
		}
	
	
}