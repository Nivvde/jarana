package com.jlcit.jarana.controllers;

import com.jlcit.jarana.entities.Pueblo;
import com.jlcit.jarana.repositories.PuebloRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("pueblos")
public class PuebloController {

    @Autowired
    private PuebloRepository repository;

    @GetMapping
    ResponseEntity<List<Pueblo>> all(){
        var pueblos = (List<Pueblo>) repository.findAll();
        if(pueblos.isEmpty()){
            return ResponseEntity.noContent().build();
        }
        return ResponseEntity.ok(pueblos);
    }
}
