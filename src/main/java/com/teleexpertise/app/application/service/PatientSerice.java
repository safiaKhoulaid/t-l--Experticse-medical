package com.teleexpertise.app.application.service;

import com.teleexpertise.app.domain.model.Patient;
import com.teleexpertise.app.domain.repository.PatientRepository;

import java.util.Optional;

public class PatientSerice {

    private final PatientRepository  patientRepository ;

    public PatientSerice(PatientRepository patientRepository) {
        this.patientRepository = patientRepository;
    }

    public Optional<Patient> createPatient(String firstName, String lastName, String phone, String email, String password , String gender , String mutuelle  , String adress , String numero_ss) {
        try {
            Patient patient = new Patient();
            patient.setFirstName(firstName);
            patient.setLastName(lastName);
            patient.setPhone(phone);
           patient.setAddress(adress);
           patient.setGender(gender);
              patient.setMutuelle(mutuelle);
              patient.setNumeroSs(numero_ss);
            return patientRepository.save(patient);
        } catch (Exception e) {
            e.printStackTrace();
            return Optional.empty();
        }
    }

}
