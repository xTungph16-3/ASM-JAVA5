package com.example.demo.controller;

import com.example.demo.Repositories.SPCTRepository;
import com.example.demo.entities.SPCT;
import jakarta.validation.Valid;
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
@RequestMapping("spct")
public class SPCTController {
    private final SPCTRepository spctRepository;

    public SPCTController(SPCTRepository spctRepository) {
        this.spctRepository = spctRepository;
    }

    @GetMapping("index")
    public String index(@RequestParam(value = "page", defaultValue = "0") int page, Model model) {
        int pageSize = 10; // Number of records per page
        List<SPCT> allData = this.spctRepository.findAll(); // Fetch all data
        int totalItems = allData.size(); // Total records
        int totalPages = (int) Math.ceil((double) totalItems / pageSize); // Total pages

        // Fetch data for the current page
        List<SPCT> pagedData = allData.stream()
                .skip(page * pageSize)
                .limit(pageSize)
                .collect(Collectors.toList());

        model.addAttribute("data", pagedData);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        return "spct/index2"; // Return the list page
    }

    @GetMapping("create")
    public String create(@ModelAttribute("data1") SPCT spct) {
        return "spct/create"; // Ensure that the JSP page exists
    }

    @PostMapping("store")
    public String store(Model model, @Valid SPCT spct, BindingResult validateResult) {
        if (validateResult.hasErrors()) {
            List<FieldError> listFieldError = validateResult.getFieldErrors();
            Map<String, String> errors = new HashMap<>();
            for (FieldError e : listFieldError) {
                errors.put(e.getField(), e.getDefaultMessage());
            }
            model.addAttribute("errors", errors);
            model.addAttribute("data1", spct);
            return "spct/create"; // Return to form with errors
        }
        this.spctRepository.save(spct); // Use save to store the product
        return "redirect:/spct/index"; // Redirect after successful save
    }

    @GetMapping("delete/{id}")
    public String delete(@PathVariable("id") Integer id) {
        this.spctRepository.deleteById(id); // Use deleteById method
        return "redirect:/spct/index"; // Redirect to SPCT list
    }

    @GetMapping("edit/{id}")
    public String edit(@PathVariable("id") Integer id, Model model) {
        Optional<SPCT> spct = this.spctRepository.findById(id); // Use Optional
        if (spct.isPresent()) {
            model.addAttribute("data", spct.get()); // Get value if exists
            return "spct/edit"; // Ensure that the JSP page exists
        } else {
            return "redirect:/spct/index"; // Go back to list if not found
        }
    }

    @PostMapping("update/{id}")
    public String update(@PathVariable("id") Integer id, @Valid SPCT spct, BindingResult validateResult) {
        if (validateResult.hasErrors()) {
            return "spct/edit"; // Return to edit page if there are errors
        }
        spct.setId(id); // Set ID for update
        this.spctRepository.save(spct); // Call save to update
        return "redirect:/spct/index"; // Redirect to SPCT list
    }

    @GetMapping("/search")
    public String searchSPCT(@RequestParam("id") Integer id, Model model) {
        Optional<SPCT> spct = this.spctRepository.findById(id); // Use Optional for search
        List<SPCT> result = spct.map(List::of).orElseGet(List::of); // Create list from Optional
        model.addAttribute("data", result); // Assign search results to model
        return "spct/index2"; // Return the list page
    }

    @GetMapping("detail/{id}")
    public String detail(@PathVariable("id") Integer id, Model model) {
        Optional<SPCT> spct = this.spctRepository.findById(id); // Use Optional
        if (spct.isPresent()) {
            model.addAttribute("spct", spct.get());
            return "spct/detail"; // Ensure that the JSP path is correct
        } else {
            return "redirect:/spct/index"; // Go back to list if not found
        }
    }
}
