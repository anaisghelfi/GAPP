package edu.isep.gapp;


import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import edu.isep.beans.User;

public class CsvFileReader {
	
	
	private static final String COMMA_DELIMITER = ";";
	private static final int STUDENT_LNAME_IDX = 0;
	private static final int STUDENT_FNAME_IDX = 1;
	
	
	public List<User> readCsvFile(String fileName) {

		BufferedReader fileReader = null;
		List users = new ArrayList();

        try {
        	
            String line = "";
            fileReader = new BufferedReader(new FileReader(fileName));
            
            fileReader.readLine();
            
            while ((line = fileReader.readLine()) != null) {
               
                String[] tokens = line.split(COMMA_DELIMITER);
                if (tokens.length > 0) {
                	User user = new User();
                	user.setLastname(tokens[STUDENT_LNAME_IDX]);
                	user.setFirstname(tokens[STUDENT_FNAME_IDX]);
                	users.add(user);
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
		return users;

	}
	

}