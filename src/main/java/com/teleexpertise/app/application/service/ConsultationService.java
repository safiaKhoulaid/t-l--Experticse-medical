package com.teleexpertise.app.application.service;

import com.teleexpertise.app.domain.model.Consultation;
import com.teleexpertise.app.domain.model.MedicalRecord;
import com.teleexpertise.app.domain.model.enums.Priority;
import com.teleexpertise.app.domain.model.user.User;
import com.teleexpertise.app.domain.repository.ConsultationRepository;

public class ConsultationService {

    private final ConsultationRepository consultationRepository;

    ConsultationService(ConsultationRepository consultationRepository) {
        this.consultationRepository = consultationRepository;
    }

    //fonction de création de consultation
    public Consultation createConsultation(MedicalRecord medicalRecord , User generalist , String motif, String observations, String diagnosis, String treatment, String priority ) {
        Consultation consultation = new Consultation();
        consultation.setRecord(medicalRecord);
        consultation.setGeneralist(generalist);
        consultation.setMotive(motif);
        consultation.setObservations(observations);
        consultation.setDiagnosis(diagnosis);
        consultation.setTreatment(treatment);
        consultation.setPriority(Priority.valueOf(priority));
        return consultationRepository.save(consultation).orElseThrow(() -> new RuntimeException("Erreur lors de la création de la consultation"));

    }

}
