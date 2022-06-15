package com.jlcit.jarana.entities;

import lombok.Data;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "pueblo")
@Data
public class Pueblo {

    @Id
    @Column(name = "pueblo_id")
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    private Long id;

    @Column(nullable = false)
    private String nombre;

    @Column
    private String descripcion;

    @ManyToOne
    @JoinColumn(name="cautonoma_id", nullable=false)
    private CAutonoma cautonoma;

    @ManyToOne
    @JoinColumn(name="provincia_id", nullable=false)
    private Provincia provincia;

    @OneToMany
    @JoinColumn(name="pueblo_id")
    private List<PuebloImagen> imagenes = new ArrayList<>();

}
