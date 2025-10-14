package com.teleexpertise.app.infrastructure.persistence.jpa;

import com.teleexpertise.app.domain.model.Treatment;
import com.teleexpertise.app.domain.repository.TraitementRepository;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

import java.util.Optional;
import java.util.TreeMap;

public class TraitementRepositoryJpa implements TraitementRepository {
    @PersistenceContext(unitName = "teleexpertisePU")
    private EntityManager entityManager;

    @Override
    public Optional<Treatment> save(Treatment treatment) {
        EntityManager em = entityManager;

        try {
            em.getTransaction().begin();
            em.persist(treatment);
            em.getTransaction().commit();
            return Optional.of(treatment);
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            e.printStackTrace();
        }
        return Optional.empty();
    }
    @Override
    public Optional<Treatment> findById(String id) {
        return Optional.empty();
    }

    @Override
    public Optional<Treatment> update(Treatment treatment) {
        return Optional.empty();
    }

    @Override
    public boolean deleteById(String id) {
        return false;
    }

    @Override
    public TreeMap<String, Treatment> getAllTreatments() {
        return null;
    }
}
