package edu.isep.beans;

public class SousGroupe {
	private int id;
	private String nom;
//	private String groupe_parent;
	private int groupes_id;
	private Groupe groupe;
	
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
	
	public int getGroupes_id() {
		return groupes_id;
	}
	public void setGroupes_id(int groupes_id) {
		this.groupes_id = groupes_id;
	}
	
	public Groupe getGroupe() {
		return groupe;
	}
	public void setGroupe(Groupe groupe) {
		this.groupe = groupe;
	}
}
