package com.example.service;

import com.example.model.User;

public interface UserService {
    User getUserByUsername(String username);
    void saveUser(User user);
}
