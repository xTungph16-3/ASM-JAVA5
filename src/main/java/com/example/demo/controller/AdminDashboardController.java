package com.example.demo.controller;

import com.example.demo.Repositories.SanPhamRepository;
import com.example.demo.Repositories.NhanVienRepository;
import com.example.demo.Repositories.KhachHangRepository;
import com.example.demo.Repositories.HoaDonRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("admin")
public class AdminDashboardController {

    @Autowired
    private SanPhamRepository sanPhamRepository;

    @Autowired
    private NhanVienRepository nhanVienRepository;

    @Autowired
    private KhachHangRepository khachHangRepository;

    @Autowired
    private HoaDonRepository hoaDonRepository;

    @GetMapping("dashboard")
    public String adminDashboard(Model model) {
        model.addAttribute("message", "Chào mừng đến với trang quản lý Admin!");
        model.addAttribute("totalProducts", sanPhamRepository.findAll().size());
        model.addAttribute("totalOrders", hoaDonRepository.findAll().size());
        model.addAttribute("totalCustomers", khachHangRepository.findAll().size());
        model.addAttribute("totalEmployees", nhanVienRepository.findAll().size());
        
        // Truyền danh sách sản phẩm, hóa đơn, khách hàng và nhân viên vào model
        model.addAttribute("products", sanPhamRepository.findAll());
        model.addAttribute("orders", hoaDonRepository.findAll());
        model.addAttribute("customers", khachHangRepository.findAll());
        model.addAttribute("employees", nhanVienRepository.findAll());

        return "admin/dashboard"; // Đảm bảo rằng trang JSP tồn tại
    }
}
