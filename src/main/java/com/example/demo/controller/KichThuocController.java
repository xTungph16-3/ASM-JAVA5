package com.example.demo.controller;

import com.example.demo.Repositories.KichThuocRepository;
import com.example.demo.entities.KichThuoc;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Controller
@RequestMapping("kich-thuoc")
public class KichThuocController {

    @Autowired
    private KichThuocRepository ktRepository;

    @GetMapping("index")
    public String index(Model model,
                        @RequestParam(value = "search", required = false) String search,
                        @RequestParam(value = "page", defaultValue = "0") int page) {
        Page<KichThuoc> list;
        if (search != null && !search.isEmpty()) {
            list = ktRepository.findByTenContaining(search, PageRequest.of(page, 10));
        } else {
            list = ktRepository.findAll(PageRequest.of(page, 10));
        }
        model.addAttribute("data", list.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("search", search);
        model.addAttribute("totalPages", list.getTotalPages());
        return "kich_thuoc/index2";
    }

    @GetMapping("create")
    public String create(Model model) {
        model.addAttribute("kichThuoc", new KichThuoc());
        return "kich_thuoc/index";
    }

    @PostMapping("store")
    public String store(Model model, @Valid KichThuoc kt, BindingResult validateResult) {
        if (validateResult.hasErrors()) {
            List<FieldError> listFieldError = validateResult.getFieldErrors();
            Map<String, String> errors = new HashMap<>();
            for (FieldError e : listFieldError) {
                errors.put(e.getField(), e.getDefaultMessage());
            }
            model.addAttribute("errors", errors);
            model.addAttribute("data1", kt);
            return "kich_thuoc/index2"; // Return to form with errors
        }
        ktRepository.save(kt);
        return "redirect:/kich-thuoc/index";
    }

    @GetMapping("delete/{id}")
    public String delete(@PathVariable("id") Integer id) {
        ktRepository.deleteById(id);
        return "redirect:/kich-thuoc/index";
    }

    @GetMapping("edit/{id}")
    public String edit(@PathVariable("id") Integer id, Model model) {
        Optional<KichThuoc> optionalKichThuoc = ktRepository.findById(id);
        if (optionalKichThuoc.isPresent()) {
            model.addAttribute("data", optionalKichThuoc.get());
            return "kich_thuoc/edit";
        } else {
            model.addAttribute("error", "Kích thước không tồn tại.");
            return "redirect:/kich-thuoc/index";
        }
    }

    @PostMapping("update/{id}")
    public String update(@PathVariable("id") Integer id, @Valid KichThuoc kt, BindingResult validateResult) {
        if (validateResult.hasErrors()) {
            return "kich_thuoc/edit";
        }
        Optional<KichThuoc> existingKichThuoc = ktRepository.findById(id);
        if (existingKichThuoc.isPresent()) {
            KichThuoc updatedKichThuoc = existingKichThuoc.get();
            updatedKichThuoc.setMa(kt.getMa());
            updatedKichThuoc.setTen(kt.getTen());
            updatedKichThuoc.setTrangThai(kt.getTrangThai());
            ktRepository.save(updatedKichThuoc);
        }
        return "redirect:/kich-thuoc/index";
    }

    @GetMapping("/search")
    public String searchKichThuoc(@RequestParam("id") Integer id, Model model) {
        Optional<KichThuoc> optionalKichThuoc = ktRepository.findById(id);
        List<KichThuoc> result = optionalKichThuoc.map(List::of).orElseGet(List::of);
        model.addAttribute("data", result);
        return "kich_thuoc/index2";
    }

    @GetMapping("detail/{id}")
    public String detail(@PathVariable("id") Integer id, Model model) {
        Optional<KichThuoc> optionalKichThuoc = ktRepository.findById(id);
        if (optionalKichThuoc.isPresent()) {
            model.addAttribute("kt", optionalKichThuoc.get());
            return "kich_thuoc/detail";
        } else {
            return "redirect:/kich-thuoc/index";
        }
    }
}