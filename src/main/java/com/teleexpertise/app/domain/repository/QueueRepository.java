package com.teleexpertise.app.domain.repository;

import com.teleexpertise.app.domain.model.Queue;
import com.teleexpertise.app.domain.model.enums.QueueStatus;
import com.teleexpertise.app.domain.model.enums.Priority;
import java.util.List;
import java.util.Optional;

public interface QueueRepository {
    Optional<Queue> save(Queue queue);
    Optional<Queue> findById(String id);
    List<Queue> findByStatus(QueueStatus status);
    List<Queue> findByStatusOrderByPriorityDescCreatedAtAsc(QueueStatus status);
    List<Queue> findAll();
    void delete(Queue queue);
    int getNextQueueNumber();
    List<Queue> findWaitingPatients();
}