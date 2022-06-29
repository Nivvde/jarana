package com.jlcit.jarana.entities;

import lombok.Builder;
import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "imagen")
@Data
@Builder
public class Imagen {

    @Id
    @Column(name = "imagen_id")
    @GeneratedValue(generator="imagenSecuencia")
    @SequenceGenerator(name="imagenSecuencia",sequenceName="sq_imagen", allocationSize=1)
    private Long id;

    @Column
    private String url;
}
