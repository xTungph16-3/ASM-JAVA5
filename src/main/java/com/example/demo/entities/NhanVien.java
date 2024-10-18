package com.example.demo.entities;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "NhanVien")
public class NhanVien {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id; // Auto-generated ID

    @NotNull(message = "Tên nhân viên không được để trống")
    private String ten; // Corresponds to Ten in SQL

    @NotNull(message = "Mã nhân viên không được để trống")
    private String maNV; // Corresponds to MaNV in SQL

    @NotNull(message = "Tên đăng nhập không được để trống")
    private String tenDangNhap; // Corresponds to TenDangNhap in SQL

    @NotNull(message = "Mật khẩu không được để trống")
    private String matKhau; // Corresponds to MatKhau in SQL

    @NotNull(message = "Trạng thái không được để trống")
    private Integer trangThai; // Corresponds to TrangThai in SQL

    // Getter cho mã khách hàng
    public String getMa() {
        return maNV; // Trả về mã khách hàng
    }
}