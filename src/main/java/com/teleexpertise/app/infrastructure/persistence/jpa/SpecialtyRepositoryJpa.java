package com.teleexpertise.app.infrastructure.persistence.jpa;

import com.teleexpertise.app.domain.model.Specialty;
import com.teleexpertise.app.domain.repository.SpecialityRepository;
import com.teleexpertise.app.infrastructure.persistence.JpaUtil;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

import java.util.List;

@PersistenceContext(unitName = "teleexpertisePU")

public class SpecialtyRepositoryJpa implements SpecialityRepository {

    @Override
    public Specialty findById(int id) {
        return null;
    }

    @Override
    public Specialty save(Specialty specialty) {
        return null;
    }

    @Override
    public Specialty update(Specialty specialty) {
        return null;
    }

    @Override
    public Specialty delete(Specialty specialty) {
        return null;
    }

    @Override
    public Specialty findByName(String name) {
        return null;
    }

    @Override
    public Specialty getSpecialtyById(int id) {
        return null;
    }

    @Override
    public List<Specialty> getAllSpecialties() {
        EntityManager em = JpaUtil.getEntityManager();
        try{
            em.getTransaction().begin();
            List<Specialty> specialties = em.createQuery("SELECT s FROM Specialty s", Specialty.class).getResultList();
            em.getTransaction().commit();
            return specialties;
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            e.printStackTrace();
        }
        return List.of();
    }
}
