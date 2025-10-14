package com.teleexpertise.app.application.service;

import com.teleexpertise.app.domain.model.MedicalRecord;
import com.teleexpertise.app.domain.model.Treatment;
import com.teleexpertise.app.domain.repository.TraitementRepository;

import java.util.Optional;

public class TreatementService {

    private final TraitementRepository traitementRepository;

    TreatementService(TraitementRepository traitementRepository) {
        this.traitementRepository = traitementRepository;
    }

    public Optional<Treatment> createTreatment(MedicalRecord record ,String  name, String notes) {
        try {
            Treatment treatment = new Treatment();
            treatment.setRecord(record);
            treatment.setTreatmentName(name);
            treatment.setNotes(notes);
            traitementRepository.save(treatment);
            return Optional.of(treatment);
        } catch (Exception e) {
            e.printStackTrace();
            return Optional.empty();
        }
    }
}
