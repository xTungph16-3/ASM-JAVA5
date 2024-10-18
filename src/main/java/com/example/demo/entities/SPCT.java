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
@Table(name = "SPChiTiet")
public class SPCT {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id; // Auto-generated ID

    @NotNull(message = "Mã sản phẩm không được để trống")
    private String maSPCT; // Mã sản phẩm

    @NotNull(message = "ID kích thước không được để trống")
    private Integer idKichThuoc; // ID kích thước

    @NotNull(message = "ID màu sắc không được để trống")
    private Integer idMauSac; // ID màu sắc

    @NotNull(message = "ID sản phẩm không được để trống")
    private String idSanPham; // ID sản phẩm

    @NotNull(message = "Số lượng không được để trống")
    private Integer soLuong; // Số lượng

    @NotNull(message = "Đơn giá không được để trống")
    private Double donGia; // Đơn giá

    @NotNull(message = "Trạng thái không được để trống")
    private Integer trangThai; // Trạng thái (0 hoặc 1)
}