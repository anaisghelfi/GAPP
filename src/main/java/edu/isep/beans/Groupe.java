package edu.isep.beans;

public class Groupe {
	private int id;
	private String nom;
	private int tuteur_id;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public int getTuteur_id() {
		return tuteur_id;
	}
	public void setTuteur_id(int tuteur_id) {
		this.tuteur_id = tuteur_id;
	}
}
