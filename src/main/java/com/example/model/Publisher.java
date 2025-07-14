package com.example.model;

import jakarta.persistence.*;

@Entity
@Table(name = "publishers")
public class Publisher {

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;
    private String address;
    private String contact;

    // Getters and Setters
}
