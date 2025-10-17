package com.teleexpertise.app.application.service;

import com.teleexpertise.app.domain.model.MedicalRecord;
import com.teleexpertise.app.domain.model.VitalSign;
import com.teleexpertise.app.domain.repository.SigneVitauxRepository;

import java.math.BigDecimal;
import java.util.Optional;
import java.util.UUID;

public class SigneVitauxService {
   private final SigneVitauxRepository signeVitauxRepository;
   public SigneVitauxService(SigneVitauxRepository signeVitauxRepository) {
       this.signeVitauxRepository = signeVitauxRepository;
   }
    public Optional<VitalSign> createVitalSign(MedicalRecord record ,BigDecimal  temperature , BigDecimal tention , BigDecimal taille , BigDecimal poids , int frequenceCardiaque , int frequenceRespiratoire)  {
        try {
            VitalSign vitalSign = new VitalSign();
            vitalSign.setHeartRate(frequenceCardiaque);
            vitalSign.setRespiratoryRate(frequenceRespiratoire);
            vitalSign.setTemperature(temperature);
            vitalSign.setId(UUID.randomUUID().toString());
            vitalSign.setWeight(taille);
            vitalSign.setRecord(record);
             Optional<VitalSign> savedVitalSign = signeVitauxRepository.save(vitalSign);
            if (savedVitalSign.isEmpty()) {
                return Optional.empty();
            }
            return Optional.of(vitalSign);
        } catch (Exception e) {
            e.printStackTrace();
            return Optional.empty();
        }
    }
}
