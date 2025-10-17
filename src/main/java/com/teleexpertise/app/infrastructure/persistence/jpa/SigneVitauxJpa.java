package com.teleexpertise.app.infrastructure.persistence.jpa;

import com.teleexpertise.app.domain.model.VitalSign;
import com.teleexpertise.app.domain.repository.SigneVitauxRepository;
import com.teleexpertise.app.infrastructure.persistence.JpaUtil;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

import java.util.Optional;



public class SigneVitauxJpa implements SigneVitauxRepository {
    @PersistenceContext(unitName = "teleexpertisePU")
    private EntityManager entityManager;
    @Override
    public Optional<VitalSign> save(VitalSign vitalSign) {
        EntityManager em = JpaUtil.getEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(vitalSign);
            em.getTransaction().commit();
            return Optional.of(vitalSign);
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
    public Optional<VitalSign> findById(String id) {
        return Optional.empty();
    }
}
