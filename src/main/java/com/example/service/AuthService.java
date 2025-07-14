package com.example.service;

import com.example.model.User;

public interface AuthService {
    boolean userExists(String username);
    User registerUser(User user);
    User authenticate(String username, String password,String email, String role);
    
}
