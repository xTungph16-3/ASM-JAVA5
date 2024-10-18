package com.example.demo.Repositories;

import com.example.demo.entities.KichThuoc;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface KichThuocRepository extends JpaRepository<KichThuoc, Integer> {
    // Phương thức tìm kiếm theo tên với phân trang
    Page<KichThuoc> findByTenContaining(String ten, Pageable pageable);
}
