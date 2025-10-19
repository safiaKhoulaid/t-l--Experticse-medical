package com.teleexpertise.app.domain.repository;

import com.teleexpertise.app.domain.model.Specialty;

import java.util.List;

public interface SpecialityRepository {

Specialty findById(int id) ;
Specialty save(Specialty specialty);
Specialty update(Specialty specialty);
Specialty delete(Specialty specialty);
Specialty findByName(String name);
Specialty getSpecialtyById(int id);
List<Specialty> getAllSpecialties();
}
