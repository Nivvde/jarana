package com.jlcit.jarana.entities;

import lombok.Data;
import org.hibernate.annotations.Type;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "fiesta")
@Data
public class Fiesta {

    @Id
    @Column(name = "fiesta_id")
    @GeneratedValue(generator="fiestaSecuencia")
    @SequenceGenerator(name="fiestaSecuencia",sequenceName="sq_fiesta", allocationSize=1)
    private Long id;

    @Column(nullable = false)
    private String nombre;

    @Column(columnDefinition="text")
    private String descripcion;

    @ManyToOne
    @JoinColumn(name="pueblo_id", nullable=false, foreignKey = @ForeignKey(name = "fk_fiesta_pueblo"))
    private Pueblo pueblo;

    @OneToMany
    @JoinColumn(name="fiesta_id")
    private List<FiestaImagen> imagenes = new ArrayList<>();

    @Column
    private Date inicio;

    @Column
    private Date fin;
}
