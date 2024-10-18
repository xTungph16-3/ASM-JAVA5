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
@Table(name = "HoaDon")
public class HoaDon {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id; // Auto-generated ID

    @NotNull(message = "ID nhân viên không được để trống")
    private String idNhanVien; // Corresponds to IdNhanVien in SQL

    @NotNull(message = "ID khách hàng không được để trống")
    private String idKhachHang; // Corresponds to IdKhachHang in SQL

    @NotNull(message = "Ngày mua không được để trống")
    private String ngayMuaHang; // Corresponds to NgayMua in SQL

    @NotNull(message = "Trạng thái không được để trống")
    private Integer trangThai; // Corresponds to TrangThai in SQL
}