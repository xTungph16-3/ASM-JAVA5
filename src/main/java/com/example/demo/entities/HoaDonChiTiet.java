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
@Table(name = "HoaDonChiTiet")
public class HoaDonChiTiet {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id; // Auto-generated ID

    @NotNull(message = "ID hóa đơn không được để trống")
    private Integer idHoaDon; // ID hóa đơn

    @NotNull(message = "ID sản phẩm không được để trống")
    private Integer idSP; // ID sản phẩm

    @NotNull(message = "Số lượng không được để trống")
    private Integer soLuong; // Số lượng

    @NotNull(message = "Đơn giá không được để trống")
    private Double donGia; // Đơn giá

    @NotNull(message = "Trạng thái không được để trống")
    private Integer trangThai; // Trạng thái (0 hoặc 1)
}