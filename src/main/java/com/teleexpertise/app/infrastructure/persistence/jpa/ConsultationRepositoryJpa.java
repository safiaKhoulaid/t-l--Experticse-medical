package com.teleexpertise.app.infrastructure.persistence.jpa;

import com.teleexpertise.app.domain.model.Consultation;
import com.teleexpertise.app.domain.repository.ConsultationRepository;
import com.teleexpertise.app.infrastructure.persistence.JpaUtil;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

import java.util.Optional;

public class ConsultationRepositoryJpa implements ConsultationRepository {
    @PersistenceContext(unitName = "teleexpertisePU")
    private EntityManager entityManager;
    @Override
    public Optional<Consultation> save(Consultation consultation) {
        EntityManager em = JpaUtil.getEntityManager();

        try{
            em.getTransaction().begin();
            em.persist(consultation);
            em.getTransaction().commit();
            return Optional.of(consultation);
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            e.printStackTrace();
            return Optional.empty();
        }

    }

    @Override
    public Optional<Consultation> update(Consultation consultation) {
        return Optional.empty();
    }

    @Override
    public Optional<Consultation> findById(String id) {
        EntityManager em = JpaUtil.getEntityManager();
        try {
            Consultation consultation = em.find(Consultation.class, id);
            return Optional.ofNullable(consultation);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Optional.empty();
    }
}
