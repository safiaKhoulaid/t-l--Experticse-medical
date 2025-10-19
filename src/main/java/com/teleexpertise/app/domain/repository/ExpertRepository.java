package com.teleexpertise.app.domain.repository;

import com.teleexpertise.app.domain.model.Specialty;
import com.teleexpertise.app.domain.model.user.User;

import java.util.List;

public interface ExpertRepository
{
List<User> findExpertsBySpecialty(String specialty);
List <User> findAllExperts();

}
