package com.example.model;

import jakarta.persistence.*;

@Entity
@Table(name = "staff")
public class Staff {

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;
    private String position;
    private String email;

    // Getters and Setters
}
