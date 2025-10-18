// java
// File: `src/main/java/com/teleexpertise/app/infrastructure/persistence/jpa/QueueRepositoryJpa.java`
package com.teleexpertise.app.infrastructure.persistence.jpa;

import com.teleexpertise.app.domain.model.Queue;
import com.teleexpertise.app.domain.model.enums.QueueStatus;
import com.teleexpertise.app.domain.repository.QueueRepository;
import com.teleexpertise.app.infrastructure.persistence.JpaUtil;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

public class QueueRepositoryJpa implements QueueRepository {

    @Override
    public Optional<Queue> save(Queue queue) {
        EntityManager em = JpaUtil.getEntityManager();
        try {
            em.getTransaction().begin();

            if (queue.getId() == null) {
                int nextNumber = getNextQueueNumber(em);
                queue.setQueueNumber(nextNumber);
                em.persist(queue);
            } else {
                queue = em.merge(queue);
            }

            em.getTransaction().commit();
            return Optional.of(queue);
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            throw new RuntimeException("Erreur lors de la sauvegarde de la file d'attente", e);
        } finally {
            em.close();
        }
    }

    private int getNextQueueNumber(EntityManager em) {
        LocalDate today = LocalDate.now();

        Integer maxNumber = em.createQuery(
                        "SELECT MAX(q.queueNumber) FROM Queue q WHERE q.createdAt >= :startOfDay AND q.createdAt < :endOfDay",
                        Integer.class)
                .setParameter("startOfDay", today.atStartOfDay())
                .setParameter("endOfDay", today.plusDays(1).atStartOfDay())
                .getSingleResult();

        return (maxNumber != null ? maxNumber + 1 : 1);
    }

    @Override
    public Optional<Queue> findById(String id) {
        EntityManager em = JpaUtil.getEntityManager();
        try {
            TypedQuery<Queue> query = em.createQuery(
                    "SELECT q FROM Queue q " +
                            "LEFT JOIN FETCH q.medicalRecord mr " +
                            "LEFT JOIN FETCH mr.patient p " +
                            "LEFT JOIN FETCH mr.vitalSigns vs " +
                            "LEFT JOIN FETCH mr.allergies a " +
                            "LEFT JOIN FETCH mr.antecedents ant " +
                            "LEFT JOIN FETCH mr.traitementsActuels t " +
                            "WHERE q.id = :id",
                    Queue.class);
            query.setParameter("id", id);
            List<Queue> result = query.getResultList();
            return result.isEmpty() ? Optional.empty() : Optional.of(result.get(0));
        } finally {
            em.close();
        }
    }

    @Override
    public List<Queue> findByStatus(QueueStatus status) {
        EntityManager em = JpaUtil.getEntityManager();
        try {
            TypedQuery<Queue> query = em.createQuery(
                    "SELECT DISTINCT q FROM Queue q " +
                            "LEFT JOIN FETCH q.medicalRecord mr " +
                            "LEFT JOIN FETCH mr.patient p " +
                            "LEFT JOIN FETCH mr.vitalSigns vs " +
                            "LEFT JOIN FETCH mr.allergies a " +
                            "LEFT JOIN FETCH mr.antecedents ant " +
                            "LEFT JOIN FETCH mr.traitementsActuels t " +
                            "WHERE q.status = :status " +
                            "ORDER BY q.createdAt ASC",
                    Queue.class
            );
            query.setParameter("status", status);
            return query.getResultList();
        } finally {
            em.close();
        }
    }

    @Override
    public List<Queue> findByStatusOrderByPriorityDescCreatedAtAsc(QueueStatus status) {
        EntityManager em = JpaUtil.getEntityManager();
        try {
            TypedQuery<Queue> query = em.createQuery(
                    "SELECT DISTINCT q FROM Queue q " +
                            "LEFT JOIN FETCH q.medicalRecord mr " +
                            "LEFT JOIN FETCH mr.patient p " +
                            "LEFT JOIN FETCH mr.vitalSigns vs " +
                            "LEFT JOIN FETCH mr.allergies a " +
                            "LEFT JOIN FETCH mr.antecedents ant " +
                            "WHERE q.status = :status " +
                            "ORDER BY q.priority DESC, q.createdAt ASC",
                    Queue.class
            );
            query.setParameter("status", status);
            return query.getResultList();
        } finally {
            em.close();
        }
    }

    @Override
    public List<Queue> findWaitingPatients() {
        return findByStatusOrderByPriorityDescCreatedAtAsc(QueueStatus.WAITING);
    }

    @Override
    public List<Queue> findAll() {
        EntityManager em = JpaUtil.getEntityManager();
        try {
            return em.createQuery(
                            "SELECT DISTINCT q FROM Queue q " +
                                    "LEFT JOIN FETCH q.medicalRecord mr " +
                                    "LEFT JOIN FETCH mr.patient p " +
                                    "LEFT JOIN FETCH mr.vitalSigns vs " +
                                    "LEFT JOIN FETCH mr.allergies a " +
                                    "LEFT JOIN FETCH mr.antecedents ant " +
                                    "LEFT JOIN FETCH mr.traitementsActuels t " +
                                    "ORDER BY q.createdAt",
                            Queue.class)
                    .getResultList();
        } finally {
            em.close();
        }
    }

    @Override
    public void delete(Queue queue) {
        EntityManager em = JpaUtil.getEntityManager();
        try {
            em.getTransaction().begin();
            Queue managedQueue = em.merge(queue);
            em.remove(managedQueue);
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            throw new RuntimeException("Erreur lors de la suppression de la file d'attente", e);
        } finally {
            em.close();
        }
    }

    @Override
    public int getNextQueueNumber() {
        EntityManager em = JpaUtil.getEntityManager();
        try {
            TypedQuery<Integer> query = em.createQuery(
                    "SELECT COALESCE(MAX(q.queueNumber), 0) + 1 FROM Queue q " +
                            "WHERE DATE(q.createdAt) = CURRENT_DATE",
                    Integer.class
            );
            return query.getSingleResult();
        } finally {
            em.close();
        }
    }
}
