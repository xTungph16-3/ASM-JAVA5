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
@Table(name = "SanPham")
public class SanPham {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id; // Auto-generated ID

    @NotNull(message = "Mã sản phẩm không được để trống")
    private String ma; // Corresponds to Ma in SQL

    @NotNull(message = "Tên sản phẩm không được để trống")
    private String ten; // Corresponds to Ten in SQL

    @NotNull(message = "Số lượng không được để trống")
    private Integer soLuong; // Corresponds to SoLuong in SQL

    @NotNull(message = "Đơn giá không được để trống")
    private Double donGia; // Đơn giá

    @NotNull(message = "Trạng thái không được để trống")
    private Integer trangThai; // Corresponds to TrangThai in SQL
}