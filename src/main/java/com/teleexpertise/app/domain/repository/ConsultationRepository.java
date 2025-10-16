package com.teleexpertise.app.domain.repository;

import com.teleexpertise.app.domain.model.Consultation;

import java.util.Optional;

public interface ConsultationRepository {

    Optional<Consultation> save(Consultation consultation);
    Optional<Consultation> update(Consultation consultation);
    Optional<Consultation> findById(String id);
}
