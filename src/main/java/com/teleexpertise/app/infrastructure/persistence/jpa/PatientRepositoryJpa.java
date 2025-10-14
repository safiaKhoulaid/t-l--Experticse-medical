package com.teleexpertise.app.infrastructure.persistence.jpa;

import com.teleexpertise.app.domain.model.Patient;
import com.teleexpertise.app.domain.repository.PatientRepository;
import com.teleexpertise.app.domain.vo.Email;
import com.teleexpertise.app.infrastructure.persistence.JpaUtil;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

import java.util.List;
import java.util.Optional;

public class PatientRepositoryJpa implements PatientRepository {

    @PersistenceContext(unitName = "teleexpertisePU")
    private EntityManager entityManager;

    @Override
    public Optional<Patient> save(Patient patient) {
        EntityManager em = JpaUtil.getEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(patient);
            em.getTransaction().commit();
            return Optional.of(patient);
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            e.printStackTrace();
            return Optional.empty();
        } finally {
            em.close();
        }
    }

    @Override
    public Optional<Patient> findById(String id) {
        return Optional.empty();
    }

    @Override
    public Optional<Patient> update(Patient patient) {
        return Optional.empty();
    }

    @Override
    public boolean deleteById(String id) {
        return false;
    }

    @Override
    public Optional<Patient> findByEmail(Email email) {
        return Optional.empty();
    }

    @Override
    public List<Patient> getAllPatients() {
        return List.of();
    }
}
