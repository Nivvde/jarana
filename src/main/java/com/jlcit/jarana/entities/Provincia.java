package com.jlcit.jarana.entities;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "provincia")
@Data
public class Provincia {

    @Id
    @Column(name = "provincia_id")
    @GeneratedValue(generator="provinciaSecuencia")
    @SequenceGenerator(name="provinciaSecuencia",sequenceName="sq_provincia", allocationSize=1)
    private Long id;

    @Column(nullable = false)
    private String nombre;

    @ManyToOne
    @JoinColumn(name="cautonoma_id", nullable=false, foreignKey = @ForeignKey(name = "fk_provincia_cautonoma"))
    private CAutonoma cautonoma;
}
