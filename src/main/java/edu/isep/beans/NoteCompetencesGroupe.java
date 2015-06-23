package edu.isep.beans;

public class NoteCompetencesGroupe {
	private int id;
	private int niveaux_competences_id;
	private String groupe;
	private int competences_id;
	private int sous_competences_id;
	private String remarques;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getNiveaux_competences_id() {
		return niveaux_competences_id;
	}
	public void setNiveaux_competences_id(int niveaux_competences_id) {
		this.niveaux_competences_id = niveaux_competences_id;
	}

	public String getGroupe() {
		return groupe;
	}
	public void setGroupe(String groupe) {
		this.groupe = groupe;
	}
	public int getCompetences_id() {
		return competences_id;
	}
	public void setCompetences_id(int competences_id) {
		this.competences_id = competences_id;
	}
	public int getSous_competences_id() {
		return sous_competences_id;
	}
	public void setSous_competences_id(int sous_competences_id) {
		this.sous_competences_id = sous_competences_id;
	}
	public String getRemarques() {
		return remarques;
	}
	public void setRemarques(String remarques) {
		this.remarques = remarques;
	}
	
}
