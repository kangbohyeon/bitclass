package io.namoosori.rest.service.logic;

import io.namoosori.rest.entity.User;
import io.namoosori.rest.service.UserService;
import io.namoosori.rest.store.Userstore;
import io.namoosori.rest.store.logic.UserStoreLogic;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
@RequiredArgsConstructor
public class UserServiceLogic implements UserService {

    private final  Userstore userstore;


    @Override
    public String register(User newUser) {
        return this.userstore.create(newUser);
    }

    @Override
    public void modify(User newUser) {
        this.userstore.update(newUser);
    }

    @Override
    public void remove(String id) {
        this.userstore.delete(id);
    }

    @Override
    public User find(String id) {
        return this.userstore.retrieve(id);
    }

    @Override
    public List<User> findALL() {
        return this.userstore.retrieveAll();
    }
}
