package com.jlcit.jarana.entities;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "provincia")
@Data
public class Provincia {

    @Id
    @Column(name = "provincia_id")
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    private Long id;

    @Column(nullable = false)
    private String nombre;
}
