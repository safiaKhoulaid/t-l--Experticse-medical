package com.teleexpertise.app.domain.repository;

import com.teleexpertise.app.domain.model.Requete;

import java.util.Optional;

public interface RequeteRepository {
    Optional<Requete> getRequestById(String id);
    Optional<Requete> save (Requete request);
    Optional<Requete> update (Requete request);
}
