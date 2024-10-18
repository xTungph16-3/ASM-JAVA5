package com.example.demo.configs;

import com.example.demo.entities.SanPham;
import com.example.demo.entities.User;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class DemoBeanConfig {
    @Bean(name = "bean1")
    public SanPham getSPBean1() {
        // Thêm giá cho sản phẩm
        SanPham sp = new SanPham(1, "PH01", "Áo khoác nam", 10, 10.0, 1); // donGia = 10.0
        return sp;
    }

    @Bean(name = "bean2")
    public SanPham getSPBean2() {
        // Thêm giá cho sản phẩm
        SanPham sp = new SanPham(2, "PH02", "Áo khoác nữ", 15, 15.0, 1); // donGia = 15.0
        return sp;
    }

    @Bean(name = "USER_BEAN")
    public User setUser() {
        User u = new User();
        u.setUsername("user");
        u.setPassword("user123");
        return u;
    }

    @Bean(name = "ADMIN_BEAN")
    public User setAdmin() {
        User u = new User();
        u.setUsername("admin");
        u.setPassword("admin123");
        return u;
    }
}