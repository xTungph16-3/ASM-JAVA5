package com.example.demo.Repositories;

import com.example.demo.entities.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class UserRepo {
    private List<User> users = new ArrayList<>();

    public UserRepo() {
        // Khởi tạo dữ liệu gán sẵn
        User admin = new User();
        admin.setUsername("admin");
        admin.setPassword("admin123");

        User user = new User();
        user.setUsername("user");
        user.setPassword("user123");

        users.add(admin);
        users.add(user);
    }

    public User findByUsername(String username) {
        for (User user : users) {
            if (user.getUsername().equals(username)) {
                return user;
            }
        }
        return null;
    }

}

