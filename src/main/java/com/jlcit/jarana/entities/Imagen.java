package com.jlcit.jarana.entities;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "imagen")
@Data
public class Imagen {

    @Id
    @Column(name = "imagen_id")
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    private Long id;

    @Column
    private String url;
}
