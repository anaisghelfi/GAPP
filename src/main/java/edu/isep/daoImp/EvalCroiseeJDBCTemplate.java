package edu.isep.daoImp;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import edu.isep.beans.EvalCroisee;
import edu.isep.beans.Groupe;

public class EvalCroiseeJDBCTemplate {


	private DataSource datasource;
	private JdbcTemplate jdbcTemplateObject;
	
	public void setDataSource(DataSource dataSource){
		this.datasource = dataSource;
		this.jdbcTemplateObject = new JdbcTemplate(dataSource);
	}
	
	public void InsertNote(EvalCroisee evalcroisee){
		
//		On fait un select pour voir si cette evalcroisee est deja présente en base		
		String sql = "SELECT COUNT(*) FROM notes_evaluations_croisees "
				+ "WHERE competences_id = ? AND eleve_note_code_eleve = ? AND eleve_juge_code_eleve = ?";
		int rownum = jdbcTemplateObject.queryForInt(sql, new Object[]{evalcroisee.getCompetences_id(), evalcroisee.getEleve_note_code_eleve(), evalcroisee.getEleve_juge_code_eleve()});
//		int eval_croisee_test = ((Object) evalcroisee_test).intValue();
		
		
//		Faire la vérif que la note n'existe pas déjà
		if(rownum == 0){
//			On insere si la note existe pas déjà
			sql = "INSERT INTO notes_evaluations_croisees(competences_id, niveau_competences_id, eleve_note_code_eleve, eleve_juge_code_eleve) "
					+ "VALUES(?, ?, ?, ?)";
			jdbcTemplateObject.update(sql,new Object[]{evalcroisee.getCompetences_id(), evalcroisee.getNiveau_competences_id(), evalcroisee.getEleve_note_code_eleve(), evalcroisee.getEleve_juge_code_eleve() });
			return;
		}
		else{
//			On update si la note existe deja
			sql = "UPDATE notes_evaluations_croisees "
					+ "SET niveau_competences_id = ? "
					+ " WHERE competences_id = ? AND eleve_note_code_eleve = ? AND eleve_juge_code_eleve = ?";
			jdbcTemplateObject.update(sql,new Object[]{evalcroisee.getNiveau_competences_id(), evalcroisee.getCompetences_id(), evalcroisee.getEleve_note_code_eleve(), evalcroisee.getEleve_juge_code_eleve() });
			return;
		}
	}
		
//		Va chercher les evals croisees des personne du meme groupe que la personne connecté
		public List<EvalCroisee> evalCroiseeParGroupe(int code_eleve_connecte){
			
			String sql = "SELECT * FROM notes_evaluations_croisees WHERE eleve_juge_code_eleve =" + code_eleve_connecte;
			
			ArrayList<EvalCroisee> evalcroisees =  new ArrayList<EvalCroisee>();
			
			List<Map<String,Object>> rows = jdbcTemplateObject.queryForList(sql);
			
			for (Map row : rows) {
				EvalCroisee evalcroisee =  new EvalCroisee(); 
				
				evalcroisee.setCompetences_id(Integer.parseInt(String.valueOf(row.get("competences_id"))));
				evalcroisee.setNiveau_competences_id(Integer.parseInt(String.valueOf(row.get("niveau_competences_id"))));
				evalcroisee.setEleve_note_code_eleve(Integer.parseInt(String.valueOf(row.get("eleve_note_code_eleve"))));
				evalcroisee.setEleve_juge_code_eleve(Integer.parseInt(String.valueOf(row.get("eleve_juge_code_eleve"))));
				
				evalcroisees.add(evalcroisee);
			}

			return evalcroisees;
				
		}
		
//		Pour rendre l'evalcroisee disponible
		public void autorisationEvalCroisee(int code_eleve){
			
			String sql = "INSERT INTO evaluations_croisees(code_eleve, termine) VALUES(?, 0)";
			jdbcTemplateObject.update(sql,new Object[]{ code_eleve });
			return;
		}
		
		
//		Indiquer l'evaluation croisée est terminée
		public void validationEvalCroisee(int code_eleve){
			
			String sql = "UPDATE evaluations_croisees SET termine = 1 WHERE code_eleve = ?";
			jdbcTemplateObject.update(sql,new Object[]{code_eleve });
			return;

			
		}
		
//		Verifie que l'on peut afficher le tableau d'evaluation croise pour un élève
		public boolean verifDispoEvalCroisee(int code_eleve){
			
			String sql = "SELECT Count(*) FROM evaluations_croisees WHERE code_eleve = ? AND termine = 0";
			int rownum = jdbcTemplateObject.queryForInt(sql, new Object[]{code_eleve});
			
			if(rownum == 1)
				return true;
			else
				return false;

		}
		
//		Verifie que l'on peut afficher le tableau d'evaluation croise pour un élève
		public boolean verifDispoEvalCroiseeTuteur(int code_eleve){
			
			String sql = "SELECT Count(*) FROM evaluations_croisees WHERE code_eleve = ? AND termine = 0";
			int rownum = jdbcTemplateObject.queryForInt(sql, new Object[]{code_eleve});
			
			if(rownum == 1)
				return true;
			else
				return false;

		}
		
	}
