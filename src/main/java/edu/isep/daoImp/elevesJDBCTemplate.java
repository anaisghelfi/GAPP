package edu.isep.daoImp;


import java.sql.Date;
import java.text.SimpleDateFormat;
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
	
//	Fonction qui retourne tous les élèves
	public List<Eleve> allEleves(){
		String sql = "SELECT * FROM eleves";
		
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
			if(row.get("note") != null){eleve.setNote((double) row.get("note"));}
			
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
			eleve.setCode_eleve(Integer.parseInt(String.valueOf(row.get("code_eleve"))));
			eleve.setMail((String)row.get("mail"));
			eleve.setPromo((String)row.get("promo"));
			eleve.setGroupe((String)row.get("groupe"));
			if(row.get("note") != null){eleve.setNote((double) row.get("note"));}
			
			eleves.add(eleve);
		}

		return eleves;
	}
	

	public List<Eleve> elevesParNomInt(int code_eleve){
		String sql = "SELECT * FROM eleves where code_eleve = ?";
		
		ArrayList<Eleve> elevesInt =  new ArrayList<Eleve>();
		
		List<Map<String,Object>> rows = jdbcTemplateObject.queryForList(sql, new Object[]{code_eleve});
		
		for (Map row : rows) {
			Eleve eleve =  new Eleve();
			
			eleve.setId(Integer.parseInt(String.valueOf(row.get("id"))));
			eleve.setNom((String)row.get("nom"));
			eleve.setPrenom((String)row.get("prenom"));
			eleve.setCode_eleve(Integer.parseInt(String.valueOf(row.get("code_eleve"))));
			eleve.setMail((String)row.get("mail"));
			eleve.setPromo((String)row.get("promo"));
			eleve.setGroupe((String)row.get("groupe"));
			if(row.get("note") != null){eleve.setNote((double) row.get("note"));}
			
			elevesInt.add(eleve);
		}

		return elevesInt;
	}
	
	public List<Seances> allSeances(int codeEleve){
		String sql = "SELECT seances.date_seance, seances.numero_seance, seances.groupes_id FROM seances JOIN groupes ON seances.groupes_id = groupes.id JOIN eleves ON eleves.groupe LIKE CONCAT('%',groupes.nom,'%') WHERE eleves.code_eleve = ?";
		
		ArrayList<Seances> seances =  new ArrayList<Seances>();
		
		List<Map<String,Object>> rows = jdbcTemplateObject.queryForList(sql,new Object[]{codeEleve});
		
		for (Map row : rows) {
			Seances seance =  new Seances();
			
			SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd");
			seance.setDate_seance((Date)row.get("date_seance"));
			seance.setNumero_seance(Integer.parseInt(String.valueOf(row.get("numero_seance"))));
			
			
			seances.add(seance);
		}

		return seances;
	}
	public int countSeances(int codeEleve){
		String sql = "SELECT COUNT(*) FROM seances JOIN groupes ON seances.groupes_id = groupes.id JOIN eleves ON eleves.groupe LIKE CONCAT('%',groupes.nom,'%') WHERE eleves.code_eleve = ?";
		
		int rows = jdbcTemplateObject.queryForInt(sql,new Object[]{codeEleve});
		
		return rows;
	}
	public int countAbsences(int codeEleve){
		String sql = "SELECT COUNT(*) FROM absences A, eleves E WHERE A.eleves_id = E.id AND A.absencescol = 'absent' AND E.code_eleve = ?";
		
		int rows = jdbcTemplateObject.queryForInt(sql,new Object[]{codeEleve});
		
		return rows;
	}

	
	//Liste des s�ances si il y en a aujourd'hui
	public List<Seances> seanceParDate(Date date, String groupeno){
		String sql = "select * from seances S, groupes G where S.date_seance = ? AND S.groupes_id = G.id AND G.nom = ? ";
		
		ArrayList<Seances> seances =  new ArrayList<Seances>();
		
		List<Map<String,Object>> rows = jdbcTemplateObject.queryForList(sql,new Object[]{date,groupeno});
		
		for (Map row : rows) {
			Seances seance =  new Seances();
			
			SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd");
			seance.setDate_seance((Date)row.get("date_seance"));
			seance.setNumero_seance(Integer.parseInt(String.valueOf(row.get("numero_seance"))));
			
			
			seances.add(seance);
		}

		return seances;
	}
	

//fonction qui retourne le tuteur de l'eleve
	

public List<Tuteur> tuteurEleve(int code_eleve){
	String sql = "SELECT tuteur.nom, tuteur.prenom, tuteur.mail FROM tuteur JOIN groupes ON tuteur.id = groupes.tuteur_id JOIN eleves ON eleves.groupe LIKE CONCAT('%',groupes.nom,'%') WHERE eleves.code_eleve = ?";
	
	ArrayList<Tuteur> tuteurs =  new ArrayList<Tuteur>();
	
	List<Map<String,Object>> rows = jdbcTemplateObject.queryForList(sql, new Object[]{code_eleve});
	
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

	//	fonction qui retourne une liste d'eleve par groupe
	public List<Eleve> elevesParGroupe(String groupe){
		String sql = "SELECT * FROM eleves where groupe = ?";
		
		ArrayList<Eleve> eleves =  new ArrayList<Eleve>();
		
		List<Map<String,Object>> rows = jdbcTemplateObject.queryForList(sql, new Object[]{groupe});
		
		for (Map row : rows) {
			Eleve eleve =  new Eleve();
			
			eleve.setId(Integer.parseInt(String.valueOf(row.get("id"))));
			eleve.setNom((String)row.get("nom"));
			eleve.setPrenom((String)row.get("prenom"));
			eleve.setMail((String)row.get("mail"));
			eleve.setPromo((String)row.get("promo"));
			eleve.setGroupe((String)row.get("groupe"));
			eleve.setCode_eleve(Integer.parseInt(String.valueOf(row.get("code_eleve"))));
			if(row.get("note") != null){eleve.setNote((double)row.get("note"));}
			
			eleves.add(eleve);
		}

		return eleves;
	}	
	
//	fonction qui retourne la liste d'élève du meme groupe que l'élève donné en param (par son code élève)
	public List<Eleve> elevesDeMemeGroupe(int code_eleve){
		String sql = "SELECT * FROM eleves where groupe = (SELECT groupe FROM eleves WHERE code_eleve = ?)";
		
		ArrayList<Eleve> eleves =  new ArrayList<Eleve>();
		
		List<Map<String,Object>> rows = jdbcTemplateObject.queryForList(sql, new Object[]{code_eleve});
		
		for (Map row : rows) {
			Eleve eleve =  new Eleve();
			
			eleve.setId(Integer.parseInt(String.valueOf(row.get("id"))));
			eleve.setNom((String)row.get("nom"));
			eleve.setPrenom((String)row.get("prenom"));
			eleve.setMail((String)row.get("mail"));
			eleve.setPromo((String)row.get("promo"));
			eleve.setGroupe((String)row.get("groupe"));
			eleve.setCode_eleve(Integer.parseInt(String.valueOf(row.get("code_eleve"))));
			eleve.setNote((double)row.get("note"));
			
			eleves.add(eleve);
		}

		return eleves;
	}
	
	
	
}