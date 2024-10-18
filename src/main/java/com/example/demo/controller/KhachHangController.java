package com.example.demo.controller;

import com.example.demo.Repositories.KhachHangRepository;
import com.example.demo.entities.KhachHang;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.*;
import java.util.stream.Collectors;

@Controller
@RequestMapping("khach-hang")
public class KhachHangController {

    @Autowired
    private KhachHangRepository khRepository;

    @GetMapping("index")
    public String index(@RequestParam(value = "page", defaultValue = "0") int page, Model model) {
        int pageSize = 10;
        List<KhachHang> allData = khRepository.findAll();
        int totalItems = allData.size();
        int totalPages = (int) Math.ceil((double) totalItems / pageSize);

        List<KhachHang> pagedData = allData.stream()
                .skip(page * pageSize)
                .limit(pageSize)
                .collect(Collectors.toList());

        model.addAttribute("data", pagedData);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        return "khach_hang/index2";
    }

    @GetMapping("create")
    public String create(Model model) {
        model.addAttribute("khachHang", new KhachHang());
        return "khach_hang/create";
    }

    @PostMapping("store")
    public String store(Model model, @Valid @ModelAttribute("khachHang") KhachHang kh, BindingResult validateResult) {
        if (validateResult.hasErrors()) {
            model.addAttribute("data1", kh);
            return "khach_hang/create";
        }
        khRepository.save(kh);
        return "redirect:/khach-hang/index";
    }

    @GetMapping("delete/{id}")
    public String delete(@PathVariable("id") Integer id) {
        khRepository.deleteById(id);
        return "redirect:/khach-hang/index";
    }

    @GetMapping("edit/{id}")
    public String edit(@PathVariable("id") Integer id, Model model) {
        Optional<KhachHang> optionalKh = khRepository.findById(id);
        if (optionalKh.isPresent()) {
            model.addAttribute("khachHang", optionalKh.get());
            return "khach_hang/edit";
        }
        return "redirect:/khach-hang/index";
    }

    @PostMapping("update/{id}")
    public String update(@PathVariable("id") Integer id, @Valid @ModelAttribute("khachHang") KhachHang kh, BindingResult validateResult) {
        if (validateResult.hasErrors()) {
            return "khach_hang/edit"; // Trả về trang chỉnh sửa nếu có lỗi
        }
        Optional<KhachHang> optionalKhachHang = khRepository.findById(id);
        if (optionalKhachHang.isPresent()) {
            KhachHang existingKhachHang = optionalKhachHang.get();
            existingKhachHang.setMaKH(kh.getMaKH());
            existingKhachHang.setTen(kh.getTen());
            existingKhachHang.setSdt(kh.getSdt());
            existingKhachHang.setTrangThai(kh.getTrangThai());
            khRepository.save(existingKhachHang);
        }
        return "redirect:/khach-hang/index"; // Chuyển hướng về danh sách khách hàng
    }

    @GetMapping("/search")
    public String searchKhachHang(@RequestParam("id") Integer id, Model model) {
        Optional<KhachHang> kh = khRepository.findById(id);
        List<KhachHang> result = new ArrayList<>();
        kh.ifPresent(result::add);
        model.addAttribute("data", result);
        return "khach_hang/index2";
    }

    @GetMapping("detail/{id}")
    public String detail(@PathVariable("id") Integer id, Model model) {
        Optional<KhachHang> optionalKh = khRepository.findById(id);
        if (optionalKh.isPresent()) {
            model.addAttribute("kh", optionalKh.get());
            return "khach_hang/detail";
        } else {
            return "redirect:/khach-hang/index";
        }
    }
}