package com.example.demo.controller;

import com.example.demo.Repositories.NhanVienRepository;
import com.example.demo.entities.HoaDonChiTiet;
import com.example.demo.entities.NhanVien;
import com.example.demo.entities.SanPham;
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
@RequestMapping("nhan-vien")
public class NhanVienController {

    @Autowired
    private NhanVienRepository nhanVienRepository;

    @GetMapping("index")
    public String index(@RequestParam(value = "page", defaultValue = "0") int page, Model model) {
        int pageSize = 10; // Số lượng bản ghi trên mỗi trang
        List<NhanVien> allData = nhanVienRepository.findAll(); // Lấy tất cả dữ liệu
        int totalItems = allData.size(); // Tổng số bản ghi
        int totalPages = (int) Math.ceil((double) totalItems / pageSize); // Tính tổng số trang

        // Lấy dữ liệu cho trang hiện tại
        List<NhanVien> pagedData = allData.stream()
                .skip(page * pageSize)
                .limit(pageSize)
                .collect(Collectors.toList());

        model.addAttribute("data", pagedData);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        return "nhan_vien/index2"; // Trả về trang danh sách
    }

    @GetMapping("create")
    public String create(Model model) {
        model.addAttribute("data1", new NhanVien());
        return "nhan_vien/create"; // Return the create page
    }

    @PostMapping("store")
    public String store(@Valid @ModelAttribute("data1") NhanVien nv, BindingResult validateResult, Model model) {
            if (validateResult.hasErrors()) {
                Map<String, String> errors = new HashMap<>();
                for (FieldError e : validateResult.getFieldErrors()) {
                    errors.put(e.getField(), e.getDefaultMessage());
                }
            model.addAttribute("errors", errors);
            model.addAttribute("data1", nv);
            return "nhan_vien/create"; // Trả về trang tạo mới
        }
        nhanVienRepository.save(nv); // Lưu nhân viên mới vào cơ sở dữ liệu
        return "redirect:/nhan-vien/index"; // Redirect đến danh sách nhân viên
    }

    @GetMapping("delete/{id}")
    public String delete(@PathVariable("id") Integer id) {
        nhanVienRepository.deleteById(id); // Xóa nhân viên theo ID
        return "redirect:/nhan-vien/index"; // Redirect đến danh sách nhân viên
    }

    @GetMapping("edit/{id}")
    public String edit(@PathVariable("id") Integer id, Model model) {
        NhanVien nv = nhanVienRepository.findById(id).orElse(null);
        if (nv == null) {
            model.addAttribute("error", "Nhân viên không tồn tại.");
            return "redirect:/nhan-vien/index"; // Quay lại trang danh sách
        }
        model.addAttribute("data", nv);
        return "nhan_vien/edit"; // Đảm bảo rằng trang JSP tồn tại
    }

    @PostMapping("update/{id}")
    public String update(@PathVariable("id") Integer id, @Valid NhanVien nv, BindingResult validateResult) {
        if (validateResult.hasErrors()) {
            return "nhan_vien/edit"; // Quay lại trang chỉnh sửa nếu có lỗi
        }
        nv.setId(id); // Đặt ID cho đối tượng nhân viên
        nhanVienRepository.save(nv); // Cập nhật nhân viên
        return "redirect:/nhan-vien/index"; // Redirect đến danh sách nhân viên
    }

    @GetMapping("/search")
    public String searchNhanVien(@RequestParam("id") Integer id, Model model) {
        Optional<NhanVien> nv = nhanVienRepository.findById(id);
        List<NhanVien> result = nv.map(List::of).orElseGet(List::of);
        model.addAttribute("data", result);
        return "nhan_vien/index2"; // Trả về trang danh sách
    }

    @GetMapping("detail/{id}")
    public String detail(@PathVariable("id") Integer id, Model model) {
        NhanVien nv = nhanVienRepository.findById(id).orElse(null);
        if (nv != null) {
            model.addAttribute("nv", nv);
            return "nhan_vien/detail"; // Đảm bảo rằng trang JSP tồn tại
        } else {
            return "redirect:/nhan-vien/index"; // Quay lại trang danh sách nếu không tìm thấy
        }
    }
}