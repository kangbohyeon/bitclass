package com.example.demo.rest.controller;



import com.example.demo.rest.entity.User;
import com.example.demo.rest.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController

public class UserController {
    @Autowired
    private UserService userService;


    @PostMapping("/users")
    public String register(@RequestBody User newUser){
        return userService.register(newUser);
    }

    @GetMapping("/users/{id}")
    public User find(@PathVariable String id){
        return userService.find(id);
    }

    @GetMapping("/users")
    public List<User>findAll(){
        return userService.findAll();
    }

    @PutMapping("/users")
    public void modify(@RequestBody User newUser){
           userService.modify(newUser);
    }

    @DeleteMapping("/users/{id}")
    public void remove(@PathVariable String id){
            userService.remove(id);
    }

}
