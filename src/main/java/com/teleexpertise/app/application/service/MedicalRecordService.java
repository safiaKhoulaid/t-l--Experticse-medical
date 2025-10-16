package com.teleexpertise.app.application.service;

import com.teleexpertise.app.domain.model.MedicalRecord;
import com.teleexpertise.app.domain.model.Patient;
import com.teleexpertise.app.domain.repository.RecordRepository;

import java.time.Instant;
import java.util.Optional;
import java.util.UUID;

public class MedicalRecordService {

    private final RecordRepository recordRepository;

    public MedicalRecordService(RecordRepository recordRepository) {
        this.recordRepository = recordRepository;
    }

    public Optional<MedicalRecord> createMedicalRecord(Patient patient) {
        // Vérifie si un dossier médical existe déjà pour ce patient
        Optional<MedicalRecord> existingRecord = recordRepository.findByPatient(patient);
        if (existingRecord.isPresent()) {
            throw new IllegalStateException("Medical record for this patient already exists.");
        }

        // Crée un nouveau dossier médical
        MedicalRecord medicalRecord = new MedicalRecord();
        medicalRecord.setPatient(patient);
        medicalRecord.setId(UUID.randomUUID().toString());
        medicalRecord.setCreatedAt(Instant.now());
        medicalRecord.setTitle("Dossier Médical de " + patient.getFirstName() + " " + patient.getLastName());
        medicalRecord.setDescription("Dossier médical créé automatiquement lors de l'enregistrement du patient.");
        // Sauvegarde dans la base
        return recordRepository.save(medicalRecord);
    }

    //fonction qui récupère un dossier médical par son id
    public MedicalRecord getMedicalRecordById(String id) {

        Optional<MedicalRecord> recordOpt = recordRepository.findById(id);

        if (recordOpt.isPresent()) {
            return recordOpt.get();
        } else {
            throw new IllegalArgumentException("Medical record not found for id: " + id);
        }
    }

}
