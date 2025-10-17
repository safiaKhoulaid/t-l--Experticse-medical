package com.teleexpertise.app.domain.repository;

import com.teleexpertise.app.domain.model.VitalSign;

import java.util.Optional;

public interface  SigneVitauxRepository {
    Optional<VitalSign> save(VitalSign vitalSign);
    Optional<VitalSign> findById(String id);
}
