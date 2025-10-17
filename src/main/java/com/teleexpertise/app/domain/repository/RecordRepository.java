package com.teleexpertise.app.domain.repository;

import com.teleexpertise.app.domain.model.MedicalRecord;

import java.util.List;
import java.util.Optional;

public interface RecordRepository {

    public Optional<MedicalRecord> findById(String id);

    public List<Record> findAll();

    public Optional<Record> findByName(String name);

    public Optional<MedicalRecord> save(MedicalRecord record);

    public void deleteById(Integer id);

    public boolean existsById(String id);

    public boolean existsByName(String name);

    public Record update(Record record);

    public Optional<MedicalRecord> findByPatient(com.teleexpertise.app.domain.model.Patient patient);
}
