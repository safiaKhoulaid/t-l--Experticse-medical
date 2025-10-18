package com.teleexpertise.app.application.service;

import com.teleexpertise.app.domain.model.*;
import com.teleexpertise.app.domain.model.enums.Priority;
import com.teleexpertise.app.domain.model.enums.QueueStatus;
import com.teleexpertise.app.domain.repository.QueueRepository;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

public class QueueService {

    private final QueueRepository queueRepository;

    public QueueService(QueueRepository queueRepository) {
        this.queueRepository = queueRepository;
    }

    /**
     * Ajouter un patient à la file d'attente
     */
    public Queue addPatientToQueue(MedicalRecord medicalRecord, Priority priority) {
        Queue queue = new Queue(medicalRecord, priority);
        queue.setEstimatedTime(calculateEstimatedTime());
        queue.setId(UUID.randomUUID().toString());
        Optional<Queue> res = queueRepository.save(queue);
        if (res.isPresent()) {
            return res.get();
        }
        return null;
    }


    /**
     * Obtenir la liste des patients en attente (triée par priorité puis par heure d'arrivée)
     */
    public List<Queue> getWaitingPatients() {
        return queueRepository.findWaitingPatients();
    }

    /**
     * Obtenir le prochain patient à traiter
     */
    public Optional<Queue> getNextPatient() {
        List<Queue> waitingPatients = getWaitingPatients();
        return waitingPatients.isEmpty() ? Optional.empty() : Optional.of(waitingPatients.get(0));
    }

    /**
     * Commencer la consultation d'un patient
     */
    public Queue startConsultation(String queueId) {
        Optional<Queue> queueOpt = queueRepository.findById(queueId);
        if (queueOpt.isPresent()) {
            Queue queue = queueOpt.get();
            queue.setStatus(QueueStatus.IN_PROGRESS);
            Optional<Queue> res = queueRepository.save(queue);
        }
        throw new RuntimeException("Patient non trouvé dans la file d'attente");
    }

    /**
     * Terminer la consultation d'un patient
     */
    public Queue completeConsultation(String queueId) {
        Optional<Queue> queueOpt = queueRepository.findById(queueId);
        if (queueOpt.isPresent()) {
            Queue queue = queueOpt.get();
            queue.setStatus(QueueStatus.COMPLETED);
            Optional<Queue> res = queueRepository.save(queue);

            if (res.isPresent()) {
                return res.get();
            }


            return null;
        }
        throw new RuntimeException("Patient non trouvé dans la file d'attente");
    }

    /**
     * Annuler une consultation
     */
    public Queue cancelConsultation(String queueId, String reason) {
        Optional<Queue> queueOpt = queueRepository.findById(queueId);
        if (queueOpt.isPresent()) {
            Queue queue = queueOpt.get();
            queue.setStatus(QueueStatus.CANCELLED);
            queue.setNotes(reason);
            Optional<Queue> res = queueRepository.save(queue);

            if (res.isPresent()) {
                return res.get();
            }


            return null;
        }
        throw new RuntimeException("Patient non trouvé dans la file d'attente");
    }

    /**
     * Obtenir la position d'un patient dans la file
     */
    public int getPatientPosition(Long queueId) {
        List<Queue> waitingPatients = getWaitingPatients();
        for (int i = 0; i < waitingPatients.size(); i++) {
            if (waitingPatients.get(i).getId().equals(queueId)) {
                return i + 1;
            }
        }
        return -1; // Patient non trouvé dans la file d'attente
    }

    /**
     * Calculer le temps d'attente estimé
     */
    private LocalDateTime calculateEstimatedTime() {
        List<Queue> waitingPatients = getWaitingPatients();
        // Estimation : 15 minutes par patient
        int estimatedMinutes = waitingPatients.size() * 15;
        return LocalDateTime.now().plusMinutes(estimatedMinutes);
    }

    /**
     * Obtenir toutes les consultations
     */
    public List<Queue> getAllQueues() {
        return queueRepository.findAll();
    }

    /**
     * Mettre à jour la priorité d'un patient
     */
    public Queue updatePriority(String  queueId, Priority priority) {
        Optional<Queue> queueOpt = queueRepository.findById(queueId);
        if (queueOpt.isPresent()) {
            Queue queue = queueOpt.get();
            queue.setPriority(priority);
            Optional<Queue> res = queueRepository.save(queue);

            if (res.isPresent()) {
                return res.get();
            }


        }

        return null;
    }

    public Queue getQueueById(String queueId) {
        Optional<Queue> queueOpt = queueRepository.findById(queueId);
        if (queueOpt.isPresent()) {
            return queueOpt.get();
        }
        throw new RuntimeException("Patient non trouvé dans la file d'attente");
    }

    public void updateQueue(Queue queue) {
        queueRepository.save(queue);
    }
}