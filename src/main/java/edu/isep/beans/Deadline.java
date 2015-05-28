package edu.isep.beans;

import java.util.Date;

public class Deadline {
	
	private int id;
	private String titre;
	private String decription;	
	private Date date_limite;
	private int groupes_id;

	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitre() {
		return titre;
	}
	public void setTitre(String titre) {
		this.titre = titre;
	}
	public String getDecription() {
		return decription;
	}
	public void setDecription(String decription) {
		this.decription = decription;
	}
	public Date getDate_limite() {
		return date_limite;
	}
	public void setDate_limite(Date date_limite) {
		this.date_limite = date_limite;
	}
	public int getGroupes_id() {
		return groupes_id;
	}
	public void setGroupes_id(int groupes_id) {
		this.groupes_id = groupes_id;
	}

	

}