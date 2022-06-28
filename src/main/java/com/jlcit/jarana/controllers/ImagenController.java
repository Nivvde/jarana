package com.jlcit.jarana.controllers;

import com.jlcit.jarana.entities.Imagen;
import com.jlcit.jarana.services.ImagenService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.server.ResponseStatusException;

@RestController
@RequestMapping("imagenes")
public class ImagenController {

    private final ImagenService service;

    ImagenController(ImagenService service){
        this.service = service;
    }

    @PostMapping
    ResponseEntity<Imagen> uploadImage(@RequestParam("file") final MultipartFile file){
        try{
            var response = service.uploadImage(file.getOriginalFilename(), file.getInputStream(), file.getContentType());
            return ResponseEntity.ok(response);
        } catch (Exception e){
            throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR, "No se ha podido guardar la imagen.", e);
        }
    }

    @GetMapping("/{objectName}")
    ResponseEntity<byte[]> downloadImage(@PathVariable(required = true) final String objectName){
        try {
            return service.downloadImage(objectName);
        } catch (Exception e) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "No se ha podido descargar la imagen.", e);
        }
    }
}
