package edu.isep.daoImp;

import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

import edu.isep.beans.Eleve;

public class ExportNoteJDBCTemplate {
	
	private DataSource datasource;
	private static JdbcTemplate jdbcTemplateObject;
	private static final String COMMA_DELIMITER = ",";
	private static final String NEW_LINE_SEPARATOR = "\n";
	private static final String FILE_HEADER = "Nom,Prenom,Code eleve,Groupe,Note";
	
	public void setDataSource(DataSource dataSource){
		this.datasource = dataSource;
		this.jdbcTemplateObject = new JdbcTemplate(dataSource);
	}
	
	
	public void exportCSV(String fileName) {
				String sql = "SELECT * FROM eleves";
				
				ArrayList<Eleve> eleves =  new ArrayList<Eleve>();
				
				List<Map<String,Object>> rows = jdbcTemplateObject.queryForList(sql);
				
				for (Map row : rows) {
					Eleve eleve =  new Eleve();
					
					eleve.setNom((String)row.get("nom"));
					eleve.setPrenom((String)row.get("prenom"));
					eleve.setCode_eleve(Integer.parseInt(String.valueOf(row.get("code_eleve"))));
					eleve.setGroupe((String)row.get("groupe"));
					if(row.get("note") != null){eleve.setNote(Integer.parseInt(String.valueOf(row.get("note"))));}
					
					eleves.add(eleve);
				}
				
				FileWriter fileWriter = null;
						
				try {
					fileWriter = new FileWriter(fileName);

					//Write the CSV file header
					fileWriter.append(FILE_HEADER.toString());
					
					//Add a new line separator after the header
					fileWriter.append(NEW_LINE_SEPARATOR);
					
					//Write a new student object list to the CSV file
					for (Eleve eleve : eleves) {
						fileWriter.append(eleve.getNom());
						fileWriter.append(COMMA_DELIMITER);
						fileWriter.append(eleve.getPrenom());
						fileWriter.append(COMMA_DELIMITER);
						fileWriter.append(Integer.toString((int)eleve.getCode_eleve()));
						fileWriter.append(COMMA_DELIMITER);
						fileWriter.append(eleve.getGroupe());
						fileWriter.append(COMMA_DELIMITER);
						fileWriter.append(Integer.toString((int) eleve.getNote()));
						fileWriter.append(NEW_LINE_SEPARATOR);
					}

					
					
					System.out.println("CSV file was created successfully !!!");
					
				} catch (Exception e) {
					System.out.println("Error in CsvFileWriter !!!");
					e.printStackTrace();
				} finally {
					
					try {
						fileWriter.flush();
						fileWriter.close();
					} catch (IOException e) {
						System.out.println("Error while flushing/closing fileWriter !!!");
		                e.printStackTrace();
					}
					
				}
	}
}
