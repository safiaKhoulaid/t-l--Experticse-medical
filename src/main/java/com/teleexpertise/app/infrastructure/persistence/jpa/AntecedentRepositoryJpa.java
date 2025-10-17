package com.teleexpertise.app.infrastructure.persistence.jpa;

import com.teleexpertise.app.domain.model.Antecedent;
import com.teleexpertise.app.domain.repository.AntecedentRepository;
import com.teleexpertise.app.infrastructure.persistence.JpaUtil;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

import java.util.List;
import java.util.Optional;
import java.util.Set;
import java.util.jar.JarEntry;

public class AntecedentRepositoryJpa implements AntecedentRepository {
    @PersistenceContext(unitName = "teleexpertisePU")
    private EntityManager entityManager;


    @Override
    public Optional<Antecedent> findById(String id) {
        return Optional.empty();
    }

    @Override
    public List<Antecedent> findAll() {
        return List.of();
    }

    @Override
    public Set<Antecedent> findByPatientId(String patientId) {
        return Set.of();
    }

    @Override
    public Optional<Antecedent> save(Antecedent antecedent) {

        EntityManager em = JpaUtil.getEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(antecedent);
            em.getTransaction().commit();
            return Optional.of(antecedent);
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            e.printStackTrace();
            return Optional.empty();
        }
    }
        @Override
        public boolean deleteById (String id){
            return false;
        }

        @Override
        public boolean existsById (String id){
            return false;
        }

        @Override
        public Antecedent update (Antecedent antecedent){
            return null;
        }
    }