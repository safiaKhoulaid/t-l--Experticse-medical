package com.teleexpertise.app.infrastructure.persistence.jpa;

import com.teleexpertise.app.domain.model.Requete;
import com.teleexpertise.app.domain.repository.RequeteRepository;
import com.teleexpertise.app.infrastructure.persistence.JpaUtil;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

import java.util.Optional;

public class RequeteRepositoryJpa implements RequeteRepository {

    @PersistenceContext(unitName = "teleexpertisePU")

    @Override
    public Optional<Requete> getRequestById(String id) {
        return Optional.empty();
    }

    @Override
    public Optional<Requete> save(Requete request) {
         EntityManager em = JpaUtil.getEntityManager();
          try {
                em.getTransaction().begin();
                em.persist(request);
                em.getTransaction().commit();
                return Optional.of(request);
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
    public Optional<Requete> update(Requete request) {
        return Optional.empty();
    }
}
