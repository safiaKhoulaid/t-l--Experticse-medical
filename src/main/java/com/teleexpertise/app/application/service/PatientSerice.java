package com.teleexpertise.app.application.service;

import com.teleexpertise.app.domain.model.Patient;
import com.teleexpertise.app.domain.repository.PatientRepository;

import java.time.LocalDate;
import java.util.Optional;
import java.util.UUID;

public class PatientSerice {

    private final PatientRepository  patientRepository ;

    public PatientSerice(PatientRepository patientRepository) {
        this.patientRepository = patientRepository;
    }

    public Optional<Patient> createPatient(String firstName, String lastName, String phone,String gender , String mutuelle  , String adress , String numero_ss, LocalDate birthDate ){
        try {
            Patient patient = new Patient();
            patient.setId(UUID.randomUUID().toString());
            patient.setFirstName(firstName);
            patient.setFirstName(firstName);
            patient.setLastName(lastName);
            patient.setPhone(phone);
           patient.setAddress(adress);
           patient.setGender(gender);
              patient.setMutuelle(mutuelle);
              patient.setNumeroSs(numero_ss);
            patient.setBirthDate(birthDate);
            return patientRepository.save(patient);
        } catch (Exception e) {
            e.printStackTrace();
            return Optional.empty();
        }
    }

}
