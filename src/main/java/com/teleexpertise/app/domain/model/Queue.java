package com.teleexpertise.app.domain.model;

import com.teleexpertise.app.domain.model.enums.QueueStatus;
import com.teleexpertise.app.domain.model.enums.Priority;
import jakarta.persistence.*;
import java.time.LocalDateTime;


@Entity
@Table(name = "patient_queue")
public class Queue {
    
     @Id
    @Column(name = "id", nullable = false, length = 50)
    private String id;


    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "medical_record_id", nullable = false)
    private MedicalRecord medicalRecord;
    
    @Enumerated(EnumType.STRING)
    @Column(name = "status")
    private QueueStatus status;
    
    @Enumerated(EnumType.STRING)
    @Column(name = "priority")
    private Priority priority;
    
    @Column(name = "queue_number")
    private Integer queueNumber;
    
    @Column(name = "created_at", nullable = false)
    private LocalDateTime createdAt;
    
    @Column(name = "estimated_time")
    private LocalDateTime estimatedTime;

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    public LocalDateTime getEstimatedTime() {
        return estimatedTime;
    }

    public void setEstimatedTime(LocalDateTime estimatedTime) {
        this.estimatedTime = estimatedTime;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public Integer getQueueNumber() {
        return queueNumber;
    }

    public void setQueueNumber(Integer queueNumber) {
        this.queueNumber = queueNumber;
    }

    public Priority getPriority() {
        return priority;
    }

    public void setPriority(Priority priority) {
        this.priority = priority;
    }

    public QueueStatus getStatus() {
        return status;
    }

    public void setStatus(QueueStatus status) {
        this.status = status;
    }

    public MedicalRecord getMedicalRecord() {
        return medicalRecord;
    }

    public void setMedicalRecord(MedicalRecord medicalRecord) {
        this.medicalRecord = medicalRecord;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    @Column(name = "notes")
    private String notes;
    
    // Constructeurs
    public Queue() {
        this.createdAt = LocalDateTime.now();
        this.status = QueueStatus.valueOf("WAITING");
    }
    
    public Queue(MedicalRecord medicalRecord, Priority priority) {
        this();
        this.medicalRecord = medicalRecord;
        this.priority = priority;
    }
    

}