package com.example.demo.Repositories;

import com.example.demo.entities.SPCT;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SPCTRepository extends JpaRepository<SPCT, Integer> {
}