package com.example.demo.rest.controller;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class hello {

    @GetMapping("/hi")
    public String hi(){
        return "hi hello";
    }

}
