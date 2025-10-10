package com.teleexpertise.app.application.service;


import com.teleexpertise.app.domain.model.user.User;
import com.teleexpertise.app.domain.repository.UserRepository;
import com.teleexpertise.app.domain.vo.Email;
import com.teleexpertise.app.domain.vo.Password;

import java.util.Optional;

public class AuthService {
    private final UserRepository userRepo;

    public AuthService(UserRepository userRepo) {
        this.userRepo = userRepo;
    }

//    public boolean register(String email, String password , String role) {
//        if (userRepo.getUserByEmail(email) != null) return false;
//        Email emailObj = new Email(email);
//        Password passwordObj = new Password(password);
//        userRepo.createUser(emailObj, passwordObj ,  "USER"));
//        return true;
//    }


    // Login method that returns an Optional<User>
    public Optional<User> login(String email, String rawPassword) {
        Email emailVO = new Email(email); // conversion ici
        Password passwordVO = new Password(rawPassword); // juste pour matcher

        Optional<User> userOpt = userRepo.getUserByEmail(emailVO);
        if (userOpt.isPresent() && userOpt.get().getPasswordHash().matches(rawPassword)) {
            return userOpt;
        }
        return Optional.empty();
    }

    //logout method (placeholder, actual session management would be needed)
    public void logout() {

        System.out.println("User logged out");
    }

}
