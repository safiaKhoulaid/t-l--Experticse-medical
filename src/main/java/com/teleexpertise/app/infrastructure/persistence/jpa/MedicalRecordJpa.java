package com.teleexpertise.app.infrastructure.persistence.jpa;

import com.teleexpertise.app.domain.model.MedicalRecord;
import com.teleexpertise.app.domain.model.Patient;
import com.teleexpertise.app.domain.repository.RecordRepository;
import com.teleexpertise.app.infrastructure.persistence.JpaUtil;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

import java.util.List;
import java.util.Optional;

public class MedicalRecordJpa implements RecordRepository {

    @PersistenceContext(unitName = "teleexpertisePU")
    private EntityManager entityManager;

    @Override
    public Optional<Record> findById(Integer id) {
        return Optional.empty();
    }

    @Override
    public List<Record> findAll() {
        return List.of();
    }

    @Override
    public Optional<Record> findByName(String name) {
        return Optional.empty();
    }

    @Override
    public Optional<MedicalRecord> save(MedicalRecord medicalRecord) {
        EntityManager em = JpaUtil.getEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(medicalRecord);
            em.getTransaction().commit();
            return Optional.of(medicalRecord);
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            e.printStackTrace();
            return Optional.empty();
        }
    }

    @Override
    public void deleteById(Integer id) {
    // Not implemented
    }

    @Override
    public boolean existsById(String id) {
        EntityManager em = JpaUtil.getEntityManager();
        try {
            em.getTransaction().begin();
            MedicalRecord medicalRecord = em.find(MedicalRecord.class, id);
            em.getTransaction().commit();
            return medicalRecord != null;
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            e.printStackTrace();
        }
        return false;
    }


    @Override
    public boolean existsByName(String name) {
        return false;
    }

    @Override
    public Record update(Record medicalRecord) {
        return null;
    }

    @Override
    public Optional<MedicalRecord> findByPatient(Patient patient) {
        EntityManager em = JpaUtil.getEntityManager();
        try {
            // Utiliser getResultList() qui retourne une List
            List<MedicalRecord> results = em.createQuery(
                            "SELECT r FROM MedicalRecord r WHERE r.patient = :patient",
                            MedicalRecord.class
                    )
                    .setParameter("patient", patient)
                    .getResultList();

            if (results.isEmpty()) {
                return Optional.empty();
            } else {
                return Optional.of(results.get(0));
            }

        } catch (Exception e) {
            e.printStackTrace();
            return Optional.empty();
        }
    }

}
