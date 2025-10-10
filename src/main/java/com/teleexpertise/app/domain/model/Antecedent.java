package com.teleexpertise.app.domain.model;

import jakarta.persistence.*;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import java.time.LocalDate;

@Entity
@Table(name = "antecedent")
public class Antecedent {
    @Id
    @Column(name = "id", nullable = false, length = 50)
    private String id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "record_id", nullable = false)
    private MedicalRecord record;

    @Column(name = "type_antecedent", nullable = false, length = 100)
    private String typeAntecedent;

    @Column(name = "description", length = Integer.MAX_VALUE)
    private String description;

    @Column(name = "date_diagnostic")
    private LocalDate dateDiagnostic;

    @Column(name = "statut", length = 50)
    private String statut;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public MedicalRecord getRecord() {
        return record;
    }

    public void setRecord(MedicalRecord record) {
        this.record = record;
    }

    public String getTypeAntecedent() {
        return typeAntecedent;
    }

    public void setTypeAntecedent(String typeAntecedent) {
        this.typeAntecedent = typeAntecedent;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public LocalDate getDateDiagnostic() {
        return dateDiagnostic;
    }

    public void setDateDiagnostic(LocalDate dateDiagnostic) {
        this.dateDiagnostic = dateDiagnostic;
    }

    public String getStatut() {
        return statut;
    }

    public void setStatut(String statut) {
        this.statut = statut;
    }

}