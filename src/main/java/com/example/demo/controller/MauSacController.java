package com.example.demo.controller;

import com.example.demo.Repositories.MauSacRepository;
import com.example.demo.entities.MauSac;
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
@RequestMapping("mau-sac")
public class MauSacController {

    @Autowired
    private MauSacRepository msRepository;

    @GetMapping("index")
    public String index(@RequestParam(value = "page", defaultValue = "0") int page, Model model) {
        int pageSize = 10; // Số lượng bản ghi trên mỗi trang
        List<MauSac> allData = msRepository.findAll(); // Lấy tất cả dữ liệu
        int totalItems = allData.size(); // Tổng số bản ghi
        int totalPages = (int) Math.ceil((double) totalItems / pageSize); // Tính tổng số trang

        // Lấy dữ liệu cho trang hiện tại
        List<MauSac> pagedData = allData.stream()
                .skip(page * pageSize)
                .limit(pageSize)
                .collect(Collectors.toList());

        model.addAttribute("data", pagedData);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        return "mau_sac/index2"; // Trả về trang danh sách
    }


    @GetMapping("create")
    public String create() {
        return "mau_sac/index";
    }

    @PostMapping("store")
    public String store(Model model, @Valid MauSac ms, BindingResult validateResult) {
        if (validateResult.hasErrors()) {
            Map<String, String> errors = new HashMap<>();
            for (FieldError e : validateResult.getFieldErrors()) {
                errors.put(e.getField(), e.getDefaultMessage());
            }
            model.addAttribute("errors", errors);
            model.addAttribute("data1", ms);
            return "mau_sac/index2";
        }
        msRepository.save(ms);
        return "redirect:/mau-sac/index";
    }

    @GetMapping("delete/{id}")
    public String delete(@PathVariable("id") Integer id) {
        msRepository.deleteById(id);
        return "redirect:/mau-sac/index";
    }

    @GetMapping("edit/{id}")
    public String edit(@PathVariable("id") Integer id, Model model) {
        Optional<MauSac> optionalMauSac = msRepository.findById(id);
        if (optionalMauSac.isPresent()) {
            model.addAttribute("data", optionalMauSac.get());
            return "mau_sac/edit";
        } else {
            model.addAttribute("error", "Màu sắc không tồn tại.");
            return "redirect:/mau-sac/index";
        }
    }

    @PostMapping("update/{id}")
    public String update(@PathVariable("id") Integer id, @Valid MauSac ms, BindingResult validateResult) {
        if (validateResult.hasErrors()) {
            return "mau_sac/edit";
        }
        Optional<MauSac> optionalMauSac = msRepository.findById(id);
        if (optionalMauSac.isPresent()) {
            MauSac existingMauSac = optionalMauSac.get();
            existingMauSac.setMa(ms.getMa());
            existingMauSac.setTen(ms.getTen());
            existingMauSac.setTrangThai(ms.getTrangThai());
            msRepository.save(existingMauSac);
        }
        return "redirect:/mau-sac/index";
    }

    @GetMapping("/search")
    public String searchMauSac(@RequestParam("id") Integer id, Model model) {
        Optional<MauSac> optionalMauSac = msRepository.findById(id);
        List<MauSac> result = optionalMauSac.map(List::of).orElseGet(List::of);
        model.addAttribute("data", result);
        return "mau_sac/index2";
    }

    @GetMapping("detail/{id}")
    public String detail(@PathVariable("id") Integer id, Model model) {
        Optional<MauSac> optionalMauSac = msRepository.findById(id);
        if (optionalMauSac.isPresent()) {
            model.addAttribute("ms", optionalMauSac.get());
            return "mau_sac/detail";
        } else {
            return "redirect:/mau-sac/index";
        }
    }
}