package com.teleexpertise.app.application.service;

import com.teleexpertise.app.domain.model.Antecedent;
import com.teleexpertise.app.domain.model.MedicalRecord;
import com.teleexpertise.app.domain.repository.AntecedentRepository;

import java.util.Optional;
import java.util.UUID;

public class AntecedentService {

    private final AntecedentRepository antecedentRepository;

    public AntecedentService(AntecedentRepository antecedentRepository) {
        this.antecedentRepository = antecedentRepository;
    }

    public Optional<Antecedent> createAntecedent(MedicalRecord record_id , String name , String descreption){
        try {
            Antecedent antecedent = new Antecedent();
            antecedent.setId(UUID.randomUUID().toString());
            antecedent.setTypeAntecedent(name);
            antecedent.setDescription(descreption);
            antecedentRepository.save(antecedent);
            return Optional.of(antecedent);
        } catch (Exception e) {
            e.printStackTrace();
            return Optional.empty();
        }
    }
}
