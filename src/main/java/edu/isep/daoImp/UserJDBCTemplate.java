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
	private static final int STUDENT_LNAME_IDX = 0;
	private static final int STUDENT_FNAME_IDX = 1;
	
	public void setDataSource(DataSource dataSource){
		this.datasource = dataSource;
		this.jdbcTemplateObject = new JdbcTemplate(dataSource);
	}
	
	public void insertUser(User user){
		String sql = "INSERT INTO users(lastname,firstname) VALUES(?,?)";
		jdbcTemplateObject.update(sql,new Object[]{user.getLastname(),user.getFirstname()});
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
                	user.setLastname(tokens[STUDENT_LNAME_IDX]);
                	user.setFirstname(tokens[STUDENT_FNAME_IDX]);
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
