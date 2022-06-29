package com.jlcit.jarana.entities;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "fiesta_imagen")
@Data
public class FiestaImagen implements Serializable {

    @Id
    @ManyToOne
    @JoinColumn(name="fiesta_id", nullable=false, foreignKey = @ForeignKey(name = "fk_fiesta_imagen_fiesta"))
    private Fiesta fiesta;

    @Id
    @ManyToOne
    @JoinColumn(name="imagen_id", nullable=false, foreignKey = @ForeignKey(name = "fk_fiesta_imagen_imagen"))
    private Imagen imagen;
}
