package com.example.demo.rest.service.logic;

import com.example.demo.rest.entity.User;
import com.example.demo.rest.service.UserService;
import com.example.demo.rest.store.UserStore;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class UserServiceLogic implements UserService {

    private final UserStore userStore;
//    public UserServiceLogic(UserStore userStore){
//        this.userStore=userStore;
//    }

//    @Autowired
//    private UserStore userStore;

    @Override
    public String register(User newUser) {
        return this.userStore.create(newUser);
    }

    @Override
    public void modify(User newUser) {
        this.userStore.update(newUser);
    }

    @Override
    public void remove(String id) {
        this.userStore.delete(id);
    }

    @Override
    public User find(String id) {
        return this.userStore.retrieve((id));
    }

    @Override
    public List<User> findAll() {
        return this.userStore.retrieveAll();
    }
}
