package edu.isep.beans;

import java.util.Date;

public class Absences {
	private int id;
	private String date;
	private int eleves_id;
	private String abscencescol;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getEleves_id() {
		return eleves_id;
	}
	public void setEleves_id(int eleves_id) {
		this.eleves_id = eleves_id;
	}
	public String getAbscencescol() {
		return abscencescol;
	}
	public void setAbscencescol(String abscencescol) {
		this.abscencescol = abscencescol;
	}
	
}
