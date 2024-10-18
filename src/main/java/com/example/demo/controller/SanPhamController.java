package com.example.demo.controller;

import com.example.demo.entities.SanPham;
import com.example.demo.Repositories.SanPhamRepository;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

@Controller
@RequestMapping("san-pham")
public class SanPhamController {

    @Autowired
    private SanPhamRepository spRepository; // Đảm bảo rằng biến này được sử dụng

    @GetMapping("index")
    public String index(@RequestParam(value = "page", defaultValue = "0") int page, Model model) {
        int pageSize = 10; // Số lượng bản ghi trên mỗi trang
        List<SanPham> allData = spRepository.findAll(); // Lấy tất cả dữ liệu
        int totalItems = allData.size(); // Tổng số bản ghi
        int totalPages = (int) Math.ceil((double) totalItems / pageSize); // Tính tổng số trang

        // Lấy dữ liệu cho trang hiện tại
        List<SanPham> pagedData = allData.stream()
                .skip(page * pageSize)
                .limit(pageSize)
                .collect(Collectors.toList());

        model.addAttribute("data", pagedData);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        return "san_pham/index2"; // Trả về trang danh sách
    }

    @GetMapping("create")
    public String create() {
        return "san_pham/create"; // Path to create.jsp
    }

    @PostMapping("store")
    public String store(Model model, @Valid SanPham sp, BindingResult validateResult) {
        if (validateResult.hasErrors()) {
            Map<String, String> errors = new HashMap<>();
            for (FieldError e : validateResult.getFieldErrors()) {
                errors.put(e.getField(), e.getDefaultMessage());
            }
            model.addAttribute("errors", errors);
            model.addAttribute("data1", sp);
            return "san_pham/create"; // Return to create.jsp if there are errors
        }
        spRepository.save(sp); // Sử dụng spRepository thay vì sanPhamRepository
        return "redirect:/san-pham/index"; // Redirect to index
    }

    @GetMapping("delete/{id}")
    public String delete(@PathVariable("id") Integer id) {
        spRepository.deleteById(id); // Sử dụng spRepository thay vì sanPhamRepository
        return "redirect:/san-pham/index"; // Redirect to index
    }

    @GetMapping("edit/{id}")
    public String edit(@PathVariable("id") Integer id, Model model) {
        Optional<SanPham> optionalSanPham = spRepository.findById(id); // Sử dụng spRepository
        if (optionalSanPham.isPresent()) {
            model.addAttribute("data", optionalSanPham.get());
            return "san_pham/edit"; // Path to edit.jsp
        } else {
            model.addAttribute("error", "Sản phẩm không tồn tại.");
            return "redirect:/san-pham/index"; // Redirect if not found
        }
    }

    @PostMapping("update/{id}")
    public String update(@PathVariable("id") Integer id, @Valid SanPham sp, BindingResult validateResult) {
        if (validateResult.hasErrors()) {
            return "san_pham/edit"; // Return to edit.jsp if there are errors
        }
        Optional<SanPham> optionalSanPham = spRepository.findById(id); // Sử dụng spRepository
        if (optionalSanPham.isPresent()) {
            SanPham existingSanPham = optionalSanPham.get();
            existingSanPham.setMa(sp.getMa());
            existingSanPham.setTen(sp.getTen());
            existingSanPham.setSoLuong(sp.getSoLuong());
            existingSanPham.setTrangThai(sp.getTrangThai());
            spRepository.save(existingSanPham); // Sử dụng spRepository
        }
        return "redirect:/san-pham/index"; // Redirect to index
    }

    @GetMapping("detail/{id}")
    public String detail(@PathVariable("id") Integer id, Model model) {
        Optional<SanPham> optionalSanPham = spRepository.findById(id); // Sử dụng spRepository
        if (optionalSanPham.isPresent()) {
            model.addAttribute("sp", optionalSanPham.get());
            return "san_pham/detail"; // Path to detail.jsp
        } else {
            return "redirect:/san-pham/index"; // Redirect if not found
        }
    }

    // Thêm phương thức tìm kiếm
    @GetMapping("search")
    public String search(@RequestParam("id") Integer id, Model model) {
        Optional<SanPham> optionalSanPham = spRepository.findById(id); // Sử dụng spRepository
        if (optionalSanPham.isPresent()) {
            model.addAttribute("data", List.of(optionalSanPham.get())); // Chỉ lấy sản phẩm tìm thấy
        } else {
            model.addAttribute("data", List.of()); // Không tìm thấy sản phẩm
        }
        return "san_pham/index2"; // Trả về index2.jsp với kết quả tìm kiếm
    }
}