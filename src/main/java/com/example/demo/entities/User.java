package com.example.demo.entities;

import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {
    @NotBlank(message = "Tên người dùng không được để trống")
    String username;

    @NotBlank(message = "Mật khẩu không được để trống")
    String password;
}