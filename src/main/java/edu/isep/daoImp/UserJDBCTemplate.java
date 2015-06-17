package edu.isep.daoImp;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import javax.sql.DataSource;
import org.springframework.jdbc.core.JdbcTemplate;
import edu.isep.beans.User;

public class UserJDBCTemplate{
	
	private DataSource datasource;
	private JdbcTemplate jdbcTemplateObject;
	private static final String COMMA_DELIMITER = ";";
	
	
	public void setDataSource(DataSource dataSource){
		this.datasource = dataSource;
		this.jdbcTemplateObject = new JdbcTemplate(dataSource);
	}
	
	public void insertUser(User user){
		String sql = "INSERT INTO eleves(nom,prenom,code_eleve,promo,mail,groupe,note) VALUES(?,?,?,2017,null,?,?)";
		jdbcTemplateObject.update(sql,new Object[]{user.getNom(),user.getPrenom(),user.getCodeEleve(),user.getGroupe(),user.getNote()});
		return;
	}
	public void readCsvFile(String fileName) {

		BufferedReader fileReader = null;
		

        try {
        	
            String line = "";
            fileReader = new BufferedReader(new FileReader(fileName));
            
            fileReader.readLine();
            
            while ((line = fileReader.readLine()) != null) {
              
                String[] tokens = line.split(COMMA_DELIMITER);
                if(tokens.length > 0) {
                	User user = new User();
                	user.setNom(tokens[0]);
                	user.setPrenom(tokens[1]);
                	user.setCodeEleve(Integer.parseInt(tokens[2]));
                	user.setGroupe(tokens[3]);
                	insertUser(user);
				}
            }
            
        } 
        catch (Exception e) {
        	System.out.println("Error in CsvFileReader !!!");
            e.printStackTrace();
        }finally {
            try {
                fileReader.close();
            } catch (IOException e) {
            	System.out.println("Error while closing fileReader !!!");
                e.printStackTrace();
            }
        }

	}
	
	
	
	
}
