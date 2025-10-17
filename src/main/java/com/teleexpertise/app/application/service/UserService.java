package com.teleexpertise.app.application.service;

import com.teleexpertise.app.domain.model.user.User;
import com.teleexpertise.app.domain.repository.UserRepository;

import java.util.Optional;

public class UserService {

    private final UserRepository userRepository;

    UserService(UserRepository userRepository)
    {
        this.userRepository = userRepository;
    }

    //fonction de getUserById
    public User getUserById(String id)
    {
        Optional<User> user = userRepository.getUserById(id);
        if(user.isPresent())
        {
            return user.get();
        }
        return null;
    }
}
