package com.jlcit.jarana.controllers;

import com.jlcit.jarana.entities.Pueblo;
import com.jlcit.jarana.repositories.PuebloRepository;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class PuebloController {
    private final PuebloRepository respository;

    PuebloController(PuebloRepository repository){
        this.respository = repository;
    }
    @GetMapping("/pueblos")
    List<Pueblo> all(){
        return (List<Pueblo>) respository.findAll();
    }
}
