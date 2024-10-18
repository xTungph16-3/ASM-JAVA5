package com.example.demo.controller;

import com.example.demo.Repositories.HoaDonRepository;
import com.example.demo.Repositories.HoaDonChiTietRepository; // Thêm repository cho chi tiết hóa đơn
import com.example.demo.entities.HoaDon;
import com.example.demo.entities.HoaDonChiTiet; // Thêm entity cho chi tiết hóa đơn
import jakarta.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Controller
@RequestMapping("hoa-don")
public class HoaDonController {
    private final HoaDonRepository hdRepository;
    private final HoaDonChiTietRepository hdctRepository; // Khai báo repository cho chi tiết hóa đơn

    public HoaDonController(HoaDonRepository hdRepository, HoaDonChiTietRepository hdctRepository) {
        this.hdRepository = hdRepository;
        this.hdctRepository = hdctRepository; // Khởi tạo repository
    }

    @GetMapping("index")
    public String index(@RequestParam(value = "page", defaultValue = "0") int page, Model model) {
        int pageSize = 10; // Số lượng bản ghi trên mỗi trang
        List<HoaDon> allData = this.hdRepository.findAll(); // Lấy tất cả dữ liệu
        int totalItems = allData.size(); // Tổng số bản ghi
        int totalPages = (int) Math.ceil((double) totalItems / pageSize); // Tính tổng số trang

        // Lấy dữ liệu cho trang hiện tại
        List<HoaDon> pagedData = allData.stream()
                .skip(page * pageSize)
                .limit(pageSize)
                .collect(Collectors.toList());

        model.addAttribute("data", pagedData);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        return "hoa_don/index2"; // Trả về trang danh sách
    }

    @GetMapping("create")
    public String create(Model model) {
        model.addAttribute("hoaDon", new HoaDon()); // Tạo đối tượng mới
        return "hoa_don/create"; // Đảm bảo rằng trang JSP tồn tại
    }

    @PostMapping("store")
    public String store(Model model, @Valid HoaDon hd, BindingResult validateResult) {
        if (validateResult.hasErrors()) {
            List<FieldError> listFieldError = validateResult.getFieldErrors();
            Map<String, String> errors = new HashMap<>();
            for (FieldError e : listFieldError) {
                errors.put(e.getField(), e.getDefaultMessage());
            }
            model.addAttribute("errors", errors);
            model.addAttribute("data1", hd);
            return "hoa_don/create"; // Trả về form với lỗi
        }
        this.hdRepository.save(hd); // Dùng phương thức save để lưu
        return "redirect:/hoa-don/index"; // Redirect sau khi lưu thành công
    }

    @GetMapping("delete/{id}")
    public String delete(@PathVariable("id") Integer id) {
        this.hdRepository.deleteById(id); // Dùng deleteById thay vì delete
        return "redirect:/hoa-don/index"; // Redirect đến danh sách hóa đơn
    }

    @GetMapping("edit/{id}")
    public String edit(@PathVariable("id") Integer id, Model model) {
        HoaDon hd = this.hdRepository.findById(id).orElse(null); // Dùng orElse để tránh Optional null
        if (hd == null) {
            return "redirect:/hoa-don/index"; // Nếu không tìm thấy, quay về trang index
        }
        model.addAttribute("data", hd);
        return "hoa_don/edit"; // Trả về trang edit
    }

    @PostMapping("update/{id}")
    public String update(@PathVariable("id") Integer id, @Valid HoaDon hd, BindingResult validateResult) {
        if (validateResult.hasErrors()) {
            return "hoa_don/edit"; // Nếu có lỗi, trả về trang edit
        }
        this.hdRepository.save(hd); // Dùng phương thức save để cập nhật
        return "redirect:/hoa-don/index"; // Redirect về trang danh sách
    }

    @GetMapping("/search")
    public String searchHoaDon(@RequestParam("id") Integer id, Model model) {
        List<HoaDon> result = hdRepository.findAll().stream() // Lấy tất cả hóa đơn
                .filter(hd -> hd.getId().equals(id)) // Tìm kiếm theo ID
                .collect(Collectors.toList());
        model.addAttribute("data", result); // Gán kết quả tìm kiếm vào model
        return "hoa_don/index2"; // Trả về trang danh sách
    }

    @GetMapping("detail/{id}")
    public String detail(@PathVariable("id") Integer id, Model model) {
        HoaDon hd = this.hdRepository.findById(id).orElse(null); // Dùng orElse để tránh Optional null
        if (hd != null) {
            List<HoaDonChiTiet> hdctList = hdctRepository.findByIdHoaDon(id); // Lấy chi tiết hóa đơn
            model.addAttribute("hd", hd);
            model.addAttribute("hdctList", hdctList); // Gán danh sách chi tiết hóa đơn vào model
            return "hoa_don/detail"; // Đảm bảo rằng đường dẫn JSP đúng
        } else {
            return "redirect:/hoa-don/index"; // Quay lại trang danh sách nếu không tìm thấy
        }
    }
}