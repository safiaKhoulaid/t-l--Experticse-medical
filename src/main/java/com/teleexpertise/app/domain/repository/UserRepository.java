package com.teleexpertise.app.domain.repository;

import com.teleexpertise.app.domain.model.user.User;
import com.teleexpertise.app.domain.vo.Email;

import java.util.Optional ;
import java.util.List;

public interface UserRepository {

    //creation d un user
    public Optional<User> createUser(User user);

    //recuperer un user par son id
    public Optional<User> getUserById(String id);

    //mettre a jour un user
    public Optional<User> updateUser(User user);

    //supprimer un user
    public boolean deleteUser(String id);

    //recuperer tous les users
    public List<User> getAllUsers();

    //recuperer un user par son email
    public Optional<User> getUserByEmail(Email email);

    //verifier si un user existe par son email
    public boolean userExistsByEmail(Email email);

    //verifier si un user existe par son id
    public boolean userExistsById(String id);
}
