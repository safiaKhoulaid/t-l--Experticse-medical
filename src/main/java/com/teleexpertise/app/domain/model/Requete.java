package com.teleexpertise.app.domain.model;

import com.teleexpertise.app.domain.model.user.User;
import jakarta.persistence.*;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import java.time.Instant;

@Entity
@Table(name = "requetes")
public class Requete {
    @Id
    @Column(name = "id_requete", nullable = false, length = 50)
    private String idRequete;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "id_medecin_emetteur", nullable = false)
    private User idMedecinEmetteur;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "id_medecin_expert", nullable = false)
    private User idMedecinExpert;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "id_record", nullable = false)
    private MedicalRecord idRecord;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.SET_NULL)
    @JoinColumn(name = "id_consultation")
    private Consultation idConsultation;

    @ColumnDefault("CURRENT_TIMESTAMP")
    @Column(name = "date_creation")
    private Instant dateCreation;

    @Column(name = "objet")
    private String objet;

    @Column(name = "description", length = Integer.MAX_VALUE)
    private String description;

    @ColumnDefault("'En attente'")
    @Column(name = "etat", length = 50)
    private String etat;

    @ColumnDefault("'Normale'")
    @Column(name = "priorite", length = 20)
    private String priorite;

    @Column(name = "date_reponse")
    private Instant dateReponse;

    @Column(name = "commentaire_expert", length = Integer.MAX_VALUE)
    private String commentaireExpert;

    public String getIdRequete() {
        return idRequete;
    }

    public void setIdRequete(String idRequete) {
        this.idRequete = idRequete;
    }

    public User getIdMedecinEmetteur() {
        return idMedecinEmetteur;
    }

    public void setIdMedecinEmetteur(User idMedecinEmetteur) {
        this.idMedecinEmetteur = idMedecinEmetteur;
    }

    public User getIdMedecinExpert() {
        return idMedecinExpert;
    }

    public void setIdMedecinExpert(User idMedecinExpert) {
        this.idMedecinExpert = idMedecinExpert;
    }

    public MedicalRecord getIdRecord() {
        return idRecord;
    }

    public void setIdRecord(MedicalRecord idRecord) {
        this.idRecord = idRecord;
    }

    public Consultation getIdConsultation() {
        return idConsultation;
    }

    public void setIdConsultation(Consultation idConsultation) {
        this.idConsultation = idConsultation;
    }

    public Instant getDateCreation() {
        return dateCreation;
    }

    public void setDateCreation(Instant dateCreation) {
        this.dateCreation = dateCreation;
    }

    public String getObjet() {
        return objet;
    }

    public void setObjet(String objet) {
        this.objet = objet;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getEtat() {
        return etat;
    }

    public void setEtat(String etat) {
        this.etat = etat;
    }

    public String getPriorite() {
        return priorite;
    }

    public void setPriorite(String priorite) {
        this.priorite = priorite;
    }

    public Instant getDateReponse() {
        return dateReponse;
    }

    public void setDateReponse(Instant dateReponse) {
        this.dateReponse = dateReponse;
    }

    public String getCommentaireExpert() {
        return commentaireExpert;
    }

    public void setCommentaireExpert(String commentaireExpert) {
        this.commentaireExpert = commentaireExpert;
    }

}