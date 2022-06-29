package com.jlcit.jarana.entities;

import lombok.Data;
import org.hibernate.annotations.Type;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "pueblo")
@Data
public class Pueblo {

    @Id
    @Column(name = "pueblo_id")
    @GeneratedValue(generator="puebloSecuencia")
    @SequenceGenerator(name="puebloSecuencia",sequenceName="sq_pueblo", allocationSize=1)
    private Long id;

    @Column(nullable = false)
    private String nombre;

    @Column(columnDefinition="text")
    private String descripcion;

    @ManyToOne
    @JoinColumn(name="provincia_id", nullable=false, foreignKey = @ForeignKey(name = "fk_pueblo_provincia"))
    private Provincia provincia;

    @OneToMany
    @JoinColumn(name="pueblo_id")
    private List<PuebloImagen> imagenes = new ArrayList<>();

}
