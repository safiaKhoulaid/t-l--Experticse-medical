package com.teleexpertise.app.domain.model;

import com.teleexpertise.app.domain.model.enums.ConsultationStatus;
import com.teleexpertise.app.domain.model.enums.Priority;
import com.teleexpertise.app.domain.model.user.User;
import jakarta.persistence.*;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import java.math.BigDecimal;
import java.time.Instant;

@Entity
@Table(name = "consultations")
public class Consultation {
    @Id
    @Column(name = "id", nullable = false, length = 50)
    private String id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "record_id", nullable = false)
    private MedicalRecord medicalRecord;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "generalist_id", nullable = false)
    private User generalist;

    @ColumnDefault("CURRENT_TIMESTAMP")
    @Column(name = "consultation_date")
    private Instant consultationDate;

    @Column(name = "motive", nullable = false, length = Integer.MAX_VALUE)
    private String motive;

    @Column(name = "observations", length = Integer.MAX_VALUE)
    private String observations;

    @Column(name = "diagnosis", length = Integer.MAX_VALUE)
    private String diagnosis;

    @Column(name = "treatment", length = Integer.MAX_VALUE)
    private String treatment;

    @Enumerated(EnumType.STRING)
    @Column(name = "status", length = 30, nullable = false)
    private ConsultationStatus status = ConsultationStatus.EN_COURS;

    @ColumnDefault("150.00")
    @Column(name = "cost", precision = 10, scale = 2)
    private BigDecimal cost;

    @Enumerated(EnumType.STRING)
    @Column(name = "priority", length = 20, nullable = false)
    private Priority priority = Priority.NORMAL;


    @ColumnDefault("CURRENT_TIMESTAMP")
    @Column(name = "updated_at")
    private Instant updatedAt;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public MedicalRecord getRecord() {
        return medicalRecord;
    }

    public void setRecord(MedicalRecord medicalRecord) {
        this.medicalRecord = medicalRecord;
    }

    public User getGeneralist() {
        return generalist;
    }

    public void setGeneralist(User generalist) {
        this.generalist = generalist;
    }

    public Instant getConsultationDate() {
        return consultationDate;
    }

    public void setConsultationDate(Instant consultationDate) {
        this.consultationDate = consultationDate;
    }

    public String getMotive() {
        return motive;
    }

    public void setMotive(String motive) {
        this.motive = motive;
    }

    public String getObservations() {
        return observations;
    }

    public void setObservations(String observations) {
        this.observations = observations;
    }

    public String getDiagnosis() {
        return diagnosis;
    }

    public void setDiagnosis(String diagnosis) {
        this.diagnosis = diagnosis;
    }

    public String getTreatment() {
        return treatment;
    }

    public void setTreatment(String treatment) {
        this.treatment = treatment;
    }

    public ConsultationStatus getStatus() {
        return status;
    }

    public void setStatus(ConsultationStatus status) {
        this.status = status;
    }

    public BigDecimal getCost() {
        return cost;
    }

    public void setCost(BigDecimal cost) {
        this.cost = cost;
    }

    public Priority getPriority() {
        return priority;
    }

    public void setPriority(Priority priority) {
        this.priority = priority;
    }

    public Instant getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Instant updatedAt) {
        this.updatedAt = updatedAt;
    }

}