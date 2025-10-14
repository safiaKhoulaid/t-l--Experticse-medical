package com.teleexpertise.app.domain.repository;

import com.teleexpertise.app.domain.model.Allergy;

import java.util.Optional;

public interface AllergyRepository {

    public Optional<Allergy> findById(String id);
    public Optional<Allergy> findByName(String name);
    public Allergy save(Allergy allergy);
    public Allergy update(Allergy allergy);
    public boolean deleteById(String id);
    public boolean existsById(String id);
    public boolean existsByName(String name);
}
