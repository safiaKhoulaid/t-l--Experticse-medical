package com.teleexpertise.app.domain.repository;

import com.teleexpertise.app.domain.model.Patient;
import com.teleexpertise.app.domain.vo.Email;

import java.util.List;
import java.util.Optional;

public interface   PatientRepository {

    public Optional<Patient> save(Patient patient) ;
    public Optional<Patient> findById(String id) ;
    public Optional<Patient> update(Patient patient) ;
    public boolean deleteById(String id) ;
    public Optional<Patient> findByEmail(Email email);
    public List<Patient> getAllPatients();


}
