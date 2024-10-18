package com.example.demo.controller;

import com.example.demo.Repositories.UserRepo;
import com.example.demo.entities.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("dang-nhap")
public class UserController {
    private final UserRepo userRepo;

    @Autowired
    public UserController(UserRepo userRepo) {
        this.userRepo = userRepo;
    }

    @GetMapping("login")
    public String showLogin() {
        return "dang_nhap/login"; // Trang đăng nhập
    }

    @PostMapping("checklogin")
    public String login(@RequestParam String username, @RequestParam String password) {
        User user = userRepo.findByUsername(username);
        if (user != null && user.getPassword().equals(password)) {
            if ("admin".equals(user.getUsername())) {
                return "redirect:/admin/dashboard"; // Redirect đến dashboard admin
            } else {
                return "redirect:/user/dashboard"; // Redirect đến dashboard nhân viên
            }
        }
        return "dang_nhap/login"; // Quay lại trang đăng nhập nếu thất bại
    }

    @GetMapping("logout")
    public String logout() {
        return "redirect:/dang-nhap/login"; // Redirect đến trang đăng nhập
    }
}
