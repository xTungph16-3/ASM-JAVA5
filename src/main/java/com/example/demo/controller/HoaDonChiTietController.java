package com.example.demo.controller;

import com.example.demo.Repositories.HoaDonChiTietRepository;
import com.example.demo.entities.HoaDonChiTiet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.validation.Valid;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

@Controller
@RequestMapping("hdct")
public class HoaDonChiTietController {

    @Autowired
    private HoaDonChiTietRepository hdctRepository;

    @GetMapping("index")
    public String index(@RequestParam(value = "page", defaultValue = "0") int page, Model model) {
        int pageSize = 10; // Number of records per page
        List<HoaDonChiTiet> allData = hdctRepository.findAll(); // Fetch all data
        int totalItems = allData.size(); // Total records
        int totalPages = (int) Math.ceil((double) totalItems / pageSize); // Total pages

        // Fetch data for the current page
        List<HoaDonChiTiet> pagedData = allData.stream()
                .skip(page * pageSize)
                .limit(pageSize)
                .collect(Collectors.toList());

        model.addAttribute("data", pagedData);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        return "hdct/index2"; // Return the list page
    }

    @GetMapping("/search")
    public String searchHoaDonChiTiet(@RequestParam("id") Integer id, Model model) {
        List<HoaDonChiTiet> result = hdctRepository.findAll().stream()
                .filter(hdct -> hdct.getId().equals(id))
                .collect(Collectors.toList());

        int pageSize = 10; // Number of records per page
        int totalItems = result.size(); // Total records
        int totalPages = (int) Math.ceil((double) totalItems / pageSize); // Calculate total pages

        model.addAttribute("data", result);
        model.addAttribute("currentPage", 0); // Set current page to 0
        model.addAttribute("totalPages", totalPages); // Assign total pages
        return "hdct/index2"; // Return the list page
    }

    @GetMapping("create")
    public String create(Model model) {
        model.addAttribute("hdct", new HoaDonChiTiet());
        return "hdct/create"; // Return the create page
    }

    @PostMapping("store")
    public String store(Model model, @Valid HoaDonChiTiet hdct, BindingResult validateResult) {
        if (validateResult.hasErrors()) {
            List<FieldError> listFieldError = validateResult.getFieldErrors();
            Map<String, String> errors = listFieldError.stream()
                    .collect(Collectors.toMap(FieldError::getField, FieldError::getDefaultMessage));
            model.addAttribute("errors", errors);
            model.addAttribute("data1", hdct);
            return "hdct/create"; // Return form with errors
        }
        hdctRepository.save(hdct); // Save data
        return "redirect:/hdct/index"; // Redirect after successful save
    }

    @GetMapping("delete/{id}")
    public String delete(@PathVariable("id") Integer id) {
        hdctRepository.deleteById(id);
        return "redirect:/hdct/index"; // Redirect to the index page
    }

    @GetMapping("edit/{id}")
    public String edit(@PathVariable("id") Integer id, Model model) {
        Optional<HoaDonChiTiet> optionalHdct = hdctRepository.findById(id);
        if (optionalHdct.isPresent()) {
            model.addAttribute("data", optionalHdct.get());
            return "hdct/edit"; // Return edit page
        } else {
            return "redirect:/hdct/index"; // Redirect if record not found
        }
    }

    @PostMapping("update/{id}")
    public String update(@PathVariable("id") Integer id, @Valid HoaDonChiTiet hdct, BindingResult validateResult) {
        if (validateResult.hasErrors()) {
            return "hdct/edit"; // Return form with errors
        }
        hdct.setId(id); // Set the ID to ensure the correct record is updated
        hdctRepository.save(hdct); // Update data
        return "redirect:/hdct/index"; // Redirect to the index page
    }

    @GetMapping("detail/{id}")
    public String detail(@PathVariable("id") Integer id, Model model) {
        Optional<HoaDonChiTiet> optionalHdct = hdctRepository.findById(id);
        if (optionalHdct.isPresent()) {
            model.addAttribute("hdct", optionalHdct.get());
            return "hdct/detail"; // Return detail page
        } else {
            return "redirect:/hdct/index"; // Redirect to list if not found
        }
    }
}
