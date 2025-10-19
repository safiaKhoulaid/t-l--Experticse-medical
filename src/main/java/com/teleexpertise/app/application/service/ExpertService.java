package com.teleexpertise.app.application.service;

import com.teleexpertise.app.domain.model.Specialty;
import com.teleexpertise.app.domain.model.user.User;
import com.teleexpertise.app.domain.repository.ExpertRepository;

import java.util.List;

public class ExpertService {
    private ExpertRepository expertRepository;

    public ExpertService  (ExpertRepository expertRepository) {
        this.expertRepository = expertRepository;
    }

    public List<User> findAllExperts() {
        return expertRepository.findAllExperts();
    }

    public List<User> findExpertsBySpecialty(String specialty) {
        return expertRepository.findExpertsBySpecialty(specialty);
    }
}
