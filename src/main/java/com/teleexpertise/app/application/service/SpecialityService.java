package com.teleexpertise.app.application.service;

import com.teleexpertise.app.domain.model.Specialty;
import com.teleexpertise.app.domain.repository.SpecialityRepository;

import java.util.List;

public class SpecialityService {

    private final SpecialityRepository specialityRepository;

    //constructor
    public SpecialityService(SpecialityRepository specialityRepository) {
        this.specialityRepository = specialityRepository;
    }

    public List<Specialty> getAllSpecialties() {
        return specialityRepository.getAllSpecialties();

    }
}
