package edu.isep.daoImp;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;


import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

import edu.isep.beans.Eleve;
import edu.isep.beans.Seances;
import edu.isep.beans.Tuteur;

public class elevesJDBCTemplate {
	private DataSource datasource;
	private JdbcTemplate jdbcTemplateObject;
	
	public void setDataSource(DataSource dataSource){
		this.datasource = dataSource;
		this.jdbcTemplateObject = new JdbcTemplate(dataSource);
	}
	
	public List<Eleve> allEleves(){
		String sql = "SELECT * FROM tuteur";
		
		ArrayList<Eleve> eleves =  new ArrayList<Eleve>();
		
		List<Map<String,Object>> rows = jdbcTemplateObject.queryForList(sql);
		
		for (Map row : rows) {
			Eleve eleve =  new Eleve();
			
			eleve.setId(Integer.parseInt(String.valueOf(row.get("id"))));
			eleve.setNom((String)row.get("nom"));
			eleve.setPrenom((String)row.get("prenom"));
			eleve.setMail((String)row.get("mail"));
			eleve.setCode_eleve(Integer.parseInt(String.valueOf(row.get("code_eleve"))));
			eleve.setPromo((String)row.get("promo"));
			eleve.setGroupe((String)row.get("groupe"));
			eleve.setNote(Integer.parseInt(String.valueOf(row.get("note"))));
			
			eleves.add(eleve);
		}

		return eleves;
	}
	
//	fonction qui retourne une liste d'eleve avec nom en parametre
	public List<Eleve> elevesParNom(String nom){
		String sql = "SELECT * FROM eleves where nom LIKE ?";
		
		ArrayList<Eleve> eleves =  new ArrayList<Eleve>();
		
		List<Map<String,Object>> rows = jdbcTemplateObject.queryForList(sql, new Object[]{nom});
		
		for (Map row : rows) {
			Eleve eleve =  new Eleve();
			
			eleve.setId(Integer.parseInt(String.valueOf(row.get("id"))));
			eleve.setNom((String)row.get("nom"));
			eleve.setPrenom((String)row.get("prenom"));
			eleve.setMail((String)row.get("mail"));
			eleve.setPromo((String)row.get("promo"));
			eleve.setGroupe((String)row.get("groupe"));
			eleve.setNote(Integer.parseInt(String.valueOf(row.get("note"))));
			
			eleves.add(eleve);
		}

		return eleves;
	}
	
	public List<Seances> allSeances(){
		String sql = "SELECT * FROM seances";
		
		ArrayList<Seances> seances =  new ArrayList<Seances>();
		
		List<Map<String,Object>> rows = jdbcTemplateObject.queryForList(sql);
		
		for (Map row : rows) {
			Seances seance =  new Seances();
			
			seance.setId(Integer.parseInt(String.valueOf(row.get("id"))));
			//seance.setDate_seance((String)row.get("date_seance"));
			seance.setNumero_seance(Integer.parseInt(String.valueOf(row.get("numero_seance"))));
			
			
			seances.add(seance);
		}

		return seances;
	}
	


//fonction qui retourne le tuteur de l'élève

public List<Tuteur> tuteurEleve(String nom){
	String sql = "SELECT tuteur.nom, tuteur.prenom, tuteur.mail FROM tuteur JOIN groupes ON tuteur.id = groupes.tuteur_id JOIN eleves ON groupes.nom = eleves.groupe WHERE eleves.nom LIKE ?";
	
	ArrayList<Tuteur> tuteurs =  new ArrayList<Tuteur>();
	
	List<Map<String,Object>> rows = jdbcTemplateObject.queryForList(sql, new Object[]{nom});
	
	for (Map row : rows) {
		Tuteur tuteur =  new Tuteur();
		
	//	tuteur.setId(Integer.parseInt(String.valueOf(row.get("id"))));
		tuteur.setNom((String)row.get("nom"));
		tuteur.setPrenom((String)row.get("prenom"));
		tuteur.setMail((String)row.get("mail"));
		
		
		tuteurs.add(tuteur);
	}

	return tuteurs;
}

}