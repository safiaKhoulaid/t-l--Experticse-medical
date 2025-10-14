package com.teleexpertise.app.domain.repository;

import com.teleexpertise.app.domain.model.Antecedent;
import com.teleexpertise.app.domain.model.Treatment;

import java.util.List;
import java.util.Optional;
import java.util.Set;

public interface AntecedentRepository {

    public Optional<Antecedent> findById(String id);
    public List<Antecedent> findAll();
    public Set<Antecedent> findByPatientId(String patientId);
    public Optional<Antecedent> save(Antecedent antecedent);
    public boolean deleteById(String id);
    public boolean existsById(String id);
    public Antecedent update(Antecedent antecedent);


}
