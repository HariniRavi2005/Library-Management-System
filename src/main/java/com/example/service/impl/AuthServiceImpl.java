package com.example.service.impl;

import com.example.model.User;
import com.example.repository.UserRepository;
import com.example.service.AuthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AuthServiceImpl implements AuthService {

    @Autowired
    private UserRepository userRepo;

    @Override
    public boolean userExists(String username) {
        return userRepo.findByUsername(username) != null;
    }

    


    @Override
    public User authenticate(String username, String password, String email, String role) {
        User user = userRepo.findByUsername(username);
        if (user != null &&
            user.getPassword().equals(password) &&
            user.getEmail().equalsIgnoreCase(email) &&
            user.getRole().equalsIgnoreCase(role)) {
            return user;
        }
        return null;
    }
    @Override
    public User registerUser(User user) {
        return userRepo.save(user);
    }


}
