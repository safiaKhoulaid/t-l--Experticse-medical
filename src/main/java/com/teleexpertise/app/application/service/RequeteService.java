package com.teleexpertise.app.application.service;

import com.teleexpertise.app.domain.model.Requete;
import com.teleexpertise.app.domain.repository.RequeteRepository;

public class RequeteService {

    private RequeteRepository requeteRepository;
    public RequeteService(RequeteRepository requeteRepository) {
        this.requeteRepository = requeteRepository;
    }

    public Requete createRequete(Requete requete) {
        return requeteRepository.save(requete).orElse(null);
    }
}
