package com.jlcit.jarana.entities;

import lombok.Data;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "fiesta")
@Data
public class Fiesta {

    @Id
    @Column(name = "fiesta_id")
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    private Long id;

    @Column(nullable = false)
    private String nombre;

    @Column
    private String descripcion;

    @ManyToOne
    @JoinColumn(name="pueblo_id", nullable=false)
    private Pueblo pueblo;

    @OneToMany
    @JoinColumn(name="fiesta_id")
    private List<FiestaImagen> imagenes = new ArrayList<>();
}
