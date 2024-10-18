package com.example.demo.Repositories;

import com.example.demo.entities.HoaDonChiTiet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface HoaDonChiTietRepository extends JpaRepository<HoaDonChiTiet, Integer> {
                List<HoaDonChiTiet> findByIdHoaDon(Integer idHoaDon); // Định nghĩa phương thức tìm kiếm

}
