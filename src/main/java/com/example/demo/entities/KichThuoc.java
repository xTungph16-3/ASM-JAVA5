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
@Table(name = "KichThuoc")
public class KichThuoc {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id; // Auto-generated ID

    @NotNull(message = "Mã kích thước không được để trống")
    private String ma; // Corresponds to Ma in SQL

    @NotNull(message = "Tên kích thước không được để trống")
    private String ten; // Corresponds to Ten in SQL

    @NotNull(message = "Trạng thái không được để trống")
    private Integer trangThai; // Corresponds to TrangThai in SQL
}