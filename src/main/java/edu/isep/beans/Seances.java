package edu.isep.beans;

import java.util.Date;

public class Seances {
	
	private int id;
	private int numero_seance;
	private int groupes_id;
	private String nom; 

	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Date getDate_seance() {
		return date_seance;
	}
	public void setDate_seance(Date date_seance) {
		this.date_seance = date_seance;
	}
	private Date date_seance;

	public int getNumero_seance() {
		return numero_seance;
	}
	public void setNumero_seance(int numero_seance) {
		this.numero_seance = numero_seance;
	}
	public int getGroupes_id() {
		return groupes_id;
	}
	public void setGroupes_id(int groupes_id) {
		this.groupes_id = groupes_id;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	
	
}
