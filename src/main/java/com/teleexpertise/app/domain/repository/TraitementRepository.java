package com.teleexpertise.app.domain.repository;

import com.teleexpertise.app.domain.model.Treatment;

import java.util.Optional;
import java.util.TreeMap;

public interface TraitementRepository {

    public Optional<Treatment> save(Treatment treatment);
    public Optional<Treatment> findById(String id);
    public Optional<Treatment> update(Treatment treatment);
    public boolean deleteById(String id);
    public TreeMap<String, Treatment> getAllTreatments();
}
