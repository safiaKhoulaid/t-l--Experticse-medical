package com.teleexpertise.app.application.service;


import com.teleexpertise.app.domain.model.user.Role;
import com.teleexpertise.app.domain.model.user.User;
import com.teleexpertise.app.domain.repository.UserRepository;
import com.teleexpertise.app.domain.vo.Email;
import com.teleexpertise.app.domain.vo.Password;
import org.mindrot.jbcrypt.BCrypt;

import java.util.Optional;
import java.util.UUID;

import static com.teleexpertise.app.domain.model.user.Role.*;

public class AuthService {
    private final UserRepository userRepo;

    public AuthService(UserRepository userRepo) {
        this.userRepo = userRepo;
    }

    public boolean register(String email, String password, String role , String firstName, String lastName , boolean isActive , String phoneNumber) {
        if (email == null || password == null || role == null) return false;

        Email emailObj = new Email(email.trim().toLowerCase());

        // ❌ Retourner false si l'email existe déjà
        if (userRepo.getUserByEmail(emailObj).isPresent()) return false;
        Password passwordObj = new Password(password);
        // Création de l'utilisateur
        User user = new User();
        user.setId(UUID.randomUUID().toString()); // Obligatoire pour String ID
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setEmail(new Email(email));
        user.setPasswordHash(passwordObj);
        user.setRole(valueOf(role));
        user.setActive(true);
        user.setPhone(phoneNumber);


        Optional<User> savedUser = userRepo.createUser(user);

        return savedUser.isPresent();
    }



    // Login method that returns an Optional<User>

    public Optional<User> login(String email, String rawPassword) {
        if (email == null || rawPassword == null) return Optional.empty();

        // Normalisation de l'email
        Email emailVO = new Email(email.trim().toLowerCase());

        // Recherche de l'utilisateur
        Optional<User> userOpt = userRepo.getUserByEmail(emailVO);

        if (userOpt.isEmpty()) {
            return Optional.empty(); // email non trouvé
        }

        User user = userOpt.get();

        System.out.println("user found: " + user.getEmail().getValue());

        // Vérification si l'utilisateur est actif
        if (Boolean.FALSE.equals(user.getActive())) {
            return Optional.empty();
        }

        // Récupération du hash stocké en base
        String storedHash = user.getPasswordHash().getHash(); // ne pas re-hasher
        System.out.println("stored hash: " + storedHash);
        // Vérification du mot de passe clair avec le hash
        System.out.println(BCrypt.checkpw(rawPassword, storedHash));
        if (BCrypt.checkpw(rawPassword, storedHash)) {
            return Optional.of(user);
        }

        return Optional.empty(); // mot de passe incorrect
    }

    //logout method (placeholder, actual session management would be needed)
    public void logout() {

        System.out.println("User logged out");
    }

}
