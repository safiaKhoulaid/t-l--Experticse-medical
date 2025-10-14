package com.teleexpertise.app.application.service;

import com.teleexpertise.app.domain.model.Allergy;
import com.teleexpertise.app.domain.model.MedicalRecord;
import com.teleexpertise.app.domain.repository.AllergyRepository;

import java.util.Optional;
import java.util.UUID;

public class AllergyService {

    private final AllergyRepository allergyRepo;
public AllergyService(AllergyRepository allergyRepo) {
    this.allergyRepo = allergyRepo;

}


public Optional<Allergy> createAllergy(MedicalRecord record_id , String name , String notes){

    try {
        Allergy allergy = new Allergy();
        allergy.setId(UUID.randomUUID().toString());
        allergy.setRecord(record_id);
        allergy.setAllergyName(name);
        allergy.setNotes(notes);
        allergyRepo.save(allergy);
        return Optional.of(allergy);
    } catch (Exception e) {
        e.printStackTrace();
        return Optional.empty();
    }



}

}
