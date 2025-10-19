package com.teleexpertise.app.infrastructure.persistence.jpa;

import com.teleexpertise.app.domain.model.Specialty;
import com.teleexpertise.app.domain.model.user.User;
import com.teleexpertise.app.domain.repository.ExpertRepository;
import com.teleexpertise.app.infrastructure.persistence.JpaUtil;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

import java.util.List;


@PersistenceContext(unitName = "teleexpertisePU")
public class ExpertRepositoryJpa implements ExpertRepository {
    @Override
    public List<User> findExpertsBySpecialty(String specialty) {
        EntityManager em = JpaUtil.getEntityManager();
        try{
            var query = em.createQuery("SELECT u FROM User u JOIN u.specialty s WHERE s = :specialty", User.class);
            query.setParameter("specialty", specialty);
            return query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            em.close();
        }
        return List.of();
    }

    @Override
    public List<User> findAllExperts() {
        EntityManager em = JpaUtil.getEntityManager();
        try{
            var query = em.createQuery("SELECT u FROM User u WHERE u.role = 'EXPERT'", User.class);
            return query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return List.of();
    }
}
