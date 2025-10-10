package com.teleexpertise.app.infrastructure.persistence.jpa;

import com.teleexpertise.app.domain.model.user.User;
import com.teleexpertise.app.domain.repository.UserRepository;
import com.teleexpertise.app.domain.vo.Email;
import com.teleexpertise.app.infrastructure.persistence.JpaUtil;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

import java.util.List;
import java.util.Optional;

public class UserRepositoryJpa implements UserRepository {

    @PersistenceContext(unitName = "teleexpertisePU")
    private EntityManager entityManager;

    // Méthode pour sauvegarder un utilisateur
    public Optional<User> createUser(User user) {

        EntityManager em = JpaUtil.getEntityManager();

        try {
            em.getTransaction().begin();
            em.persist(user);
            em.getTransaction().commit();
            return Optional.of(user);
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
    public Optional<User> getUserById(String id) {
        EntityManager em = JpaUtil.getEntityManager();
        try {
            User user = em.find(User.class, id);
            return Optional.ofNullable(user);
        } catch (RuntimeException e) {
            System.err.println("Erreur lors de la récupération de l'utilisateur : " + e.getMessage());
            throw e; // relancer l'exception pour que l'appelant sache
        } finally {
            if (em.isOpen()) {
                em.close(); // toujours fermer l'EntityManager
            }
        }
    }


    @Override
    public Optional<User> updateUser(User user) {
        return Optional.empty();
    }

    @Override
    public boolean deleteUser(String id) {
        return false;
    }

    @Override
    public List<User> getAllUsers() {
        return List.of();
    }

    @Override
    public Optional<User> getUserByEmail(Email email) {
        EntityManager em = JpaUtil.getEntityManager();
        try{
            User user = em.createQuery("SELECT u FROM User u WHERE u.email = :email", User.class)
                    .setParameter("email", email)
                    .getSingleResult();
            return Optional.ofNullable(user);
        }catch (Exception e){
            e.printStackTrace();
        }
        finally {
            if (em.isOpen()) em.close(); // toujours fermer l'EntityManager
        }
        return Optional.empty();
    }

    @Override
    public boolean userExistsByEmail(Email email) {
        EntityManager em = JpaUtil.getEntityManager();
        Email emailObj = em.find(Email.class, email.getValue());
        try {
            // JPQL : on compte combien d'utilisateurs ont cet email
            Long count = em.createQuery(
                            "SELECT COUNT(u) FROM User u WHERE u.email = :email", Long.class)
                    .setParameter("email", emailObj)
                    .getSingleResult();

            return count > 0;
        } finally {
            if (em.isOpen()) em.close(); // toujours fermer l'EntityManager
        }
    }

    @Override
    public boolean userExistsById(String id) {
        EntityManager em = JpaUtil.getEntityManager();
        try{
            Long count = em.createQuery("SELECT u FROM User u WHERE u.id = :id", Long.class)
                    .setParameter("id", id)
                    .getSingleResult();
            return count > 0;
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if (em.isOpen()) em.close(); // toujours fermer l'EntityManager
        }
        return false;
    }

}
