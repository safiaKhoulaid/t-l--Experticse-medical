package com.teleexpertise.app.application.service;

import com.teleexpertise.app.domain.model.Consultation;
import com.teleexpertise.app.domain.model.MedicalRecord;
import com.teleexpertise.app.domain.model.enums.Priority;
import com.teleexpertise.app.domain.model.user.User;
import com.teleexpertise.app.domain.repository.ConsultationRepository;
import com.teleexpertise.app.domain.repository.RecordRepository;
import org.apache.commons.lang3.EnumUtils;

import java.util.Objects;
import java.util.UUID;

public class ConsultationService {

    private final ConsultationRepository consultationRepository;
    private RecordRepository recordRepository;

    public ConsultationService(ConsultationRepository consultationRepository , RecordRepository recordRepository) {
        this.consultationRepository = consultationRepository;
        this.recordRepository = recordRepository;
    }

    //fonction de création de consultation
    public Consultation createConsultation(MedicalRecord medicalRecord,
                                           User generalist,
                                           String motif,
                                           String observations,
                                           String diagnosis,
                                           String treatment,
                                           String priorityStr) {
        validateConsultationInput(medicalRecord, generalist, motif, priorityStr);

        Consultation consultation = new Consultation();
        consultation.setRecord(medicalRecord);
        consultation.setGeneralist(generalist);
        consultation.setMotive(motif);
        consultation.setObservations(observations);
        consultation.setDiagnosis(diagnosis);
        consultation.setTreatment(treatment);
        consultation.setPriority(Priority.valueOf(priorityStr.toUpperCase()));
        consultation.setId(null);
        try {
            return consultationRepository.save(consultation).orElseThrow(
                    () -> new RuntimeException("Erreur lors de la création de la consultation")
            );
        } catch (Exception e) {
            throw new RuntimeException("Erreur DB: " + e.getMessage(), e);
        }
    }

    //fonction de validation des entrées
    private void validateConsultationInput(MedicalRecord medicalRecord, User generalist, String motif, String priority) {
        if (medicalRecord == null || medicalRecord.getId() == null || !recordRepository.existsById(medicalRecord.getId())) {
            throw new IllegalArgumentException("Medical record introuvable");
        }
        Objects.requireNonNull(generalist, "Généraliste requis");
        if (motif == null || motif.isBlank()) throw new IllegalArgumentException("Motif requis");
        if (priority == null || !EnumUtils.isValidEnum(Priority.class, priority.toUpperCase())) {
            throw new IllegalArgumentException("Priorité invalide");
        }
    }

    public MedicalRecord getMedicalRecordById(String id) {
        return recordRepository.findById(id).orElseThrow(
                () -> new IllegalArgumentException("Dossier médical introuvable pour l'id: " + id)
        );
    }
}
