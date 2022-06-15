package com.jlcit.jarana.entities;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "cautonoma")
@Data
public class CAutonoma {

    @Id
    @Column(name = "cautonoma_id")
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    private Long id;

    @Column(nullable = false)
    private String nombre;
}
