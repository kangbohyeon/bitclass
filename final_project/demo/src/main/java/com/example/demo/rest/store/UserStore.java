package com.example.demo.rest.store;

import com.example.demo.rest.entity.User;

import java.util.List;

public interface UserStore {
    String create(User newUser);
    void update(User newUser);
    void delete(String id);

    User retrieve(String id);
    List<User> retrieveAll();
}
