package com.jlcit.jarana.entities;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "pueblo_imagen")
@Data
public class PuebloImagen implements Serializable {

    @Id
    @ManyToOne
    @JoinColumn(name="pueblo_id", nullable=false, foreignKey = @ForeignKey(name = "fk_pueblo_imagen_pueblo"))
    private Pueblo pueblo;

    @Id
    @ManyToOne
    @JoinColumn(name="imagen_id", nullable=false, foreignKey = @ForeignKey(name = "fk_pueblo_imagen_imagen"))
    private Imagen imagen;
}
