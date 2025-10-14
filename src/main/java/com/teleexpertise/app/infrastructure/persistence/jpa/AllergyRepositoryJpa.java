package com.teleexpertise.app.infrastructure.persistence.jpa;

import com.teleexpertise.app.domain.model.Allergy;
import com.teleexpertise.app.domain.repository.AllergyRepository;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

import java.util.Optional;


public class AllergyRepositoryJpa implements AllergyRepository {

    @PersistenceContext(unitName = "teleexpertisePU")
    private EntityManager entityManager;

    @Override
    public Optional<Allergy> findById(String id) {
        return Optional.empty();
    }

    @Override
    public Optional<Allergy> findByName(String name) {
        return Optional.empty();
    }

    @Override
    public Allergy save(Allergy allergy) {

        EntityManager em = entityManager;

        try{
            em.getTransaction().begin();
            em.persist(allergy);
            em.getTransaction().commit();
            return allergy;
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            e.printStackTrace();
        }

        return null;
    }

    @Override
    public Allergy update(Allergy allergy) {
        return null;
    }

    @Override
    public boolean deleteById(String id) {
        return false;
    }

    @Override
    public boolean existsById(String id) {
        return false;
    }

    @Override
    public boolean existsByName(String name) {
        return false;
    }
}
