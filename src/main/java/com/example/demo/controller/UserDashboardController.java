package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("user")
public class UserDashboardController {

    @GetMapping("dashboard")
    public String userDashboard(Model model) {
        model.addAttribute("message", "Chào mừng đến với trang quản lý Nhân viên!");
        return "user/dashboard"; // Đảm bảo rằng trang JSP tồn tại
    }
}