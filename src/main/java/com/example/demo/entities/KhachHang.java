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
@Table(name = "KhachHang")
public class KhachHang {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id; // Auto-generated ID

    @NotNull(message = "Tên khách hàng không được để trống")
    private String ten; // Corresponds to Ten in SQL

    @NotNull(message = "Số điện thoại không được để trống")
    private String sdt; // Corresponds to SDT in SQL

    @NotNull(message = "Mã khách hàng không được để trống")
    private String maKH; // Corresponds to MaKH in SQL

    @NotNull(message = "Trạng thái không được để trống")
    private Integer trangThai; // Corresponds to TrangThai in SQL

    // Getter cho mã khách hàng
    public String getMa() {
        return maKH; // Trả về mã khách hàng
    }
}