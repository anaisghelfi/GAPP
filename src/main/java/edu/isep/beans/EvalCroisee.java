package edu.isep.beans;

public class EvalCroisee {
	private int id;
	private int competences_id;
	private int niveau_competences_id;
	private int eleve_note_code_eleve;
	private int eleve_juge_code_eleve;
//	Voir si on met le couple competence, et code_eleve du la persone noté
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getCompetences_id() {
		return competences_id;
	}
	public void setCompetences_id(int competences_id) {
		this.competences_id = competences_id;
	}
	public int getNiveau_competences_id() {
		return niveau_competences_id;
	}
	public void setNiveau_competences_id(int niveau_competence_id) {
		this.niveau_competences_id = niveau_competence_id;
	}
	public int getEleve_note_code_eleve() {
		return eleve_note_code_eleve;
	}
	public void setEleve_note_code_eleve(int eleve_note_code_eleve) {
		this.eleve_note_code_eleve = eleve_note_code_eleve;
	}
	public int getEleve_juge_code_eleve() {
		return eleve_juge_code_eleve;
	}
	public void setEleve_juge_code_eleve(int eleve_juge_code_eleve) {
		this.eleve_juge_code_eleve = eleve_juge_code_eleve;
	}
}
