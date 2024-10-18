package com.example.demo.controller;

import com.example.demo.entities.SanPham;
import com.example.demo.Repositories.SanPhamRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/ban-hang/cart")
@SessionAttributes("cart") // Sử dụng session để lưu trữ giỏ hàng
public class CartController {

    private final SanPhamRepository sanPhamRepository;

    public CartController(SanPhamRepository sanPhamRepository) {
        this.sanPhamRepository = sanPhamRepository;
    }

    @PostMapping("/add")
    public String addToCart(@RequestParam Integer idSP, @RequestParam Integer soLuong, RedirectAttributes redirectAttributes, Model model) {
        Map<Integer, Integer> cart = (Map<Integer, Integer>) model.getAttribute("cart");
        if (cart == null) {
            cart = new HashMap<>();
            model.addAttribute("cart", cart);
        }

        SanPham sanPham = sanPhamRepository.findById(idSP).orElse(null);
        if (sanPham == null || soLuong <= 0) {
            redirectAttributes.addFlashAttribute("error", "Sản phẩm không hợp lệ hoặc số lượng không hợp lệ.");
            return "redirect:/ban-hang/index";
        }

        // Kiểm tra số lượng sản phẩm có trong kho
        if (sanPham.getSoLuong() < soLuong) {
            redirectAttributes.addFlashAttribute("error", "Số lượng sản phẩm không đủ.");
            return "redirect:/ban-hang/index";
        }

        // Thêm sản phẩm vào giỏ hàng
        cart.put(idSP, cart.getOrDefault(idSP, 0) + soLuong);
        redirectAttributes.addFlashAttribute("success", "Sản phẩm đã được thêm vào giỏ hàng.");
        return "redirect:/ban-hang/index";
    }

    @GetMapping("/view")
    public String viewCart(Model model) {
        Map<Integer, Integer> cart = (Map<Integer, Integer>) model.getAttribute("cart");
        model.addAttribute("cart", cart);
        return "ban-hang/cart"; // Trả về trang cart.jsp để hiển thị giỏ hàng
    }

    @PostMapping("/remove")
    public String removeFromCart(@RequestParam Integer idSP, Model model) {
        Map<Integer, Integer> cart = (Map<Integer, Integer>) model.getAttribute("cart");
        if (cart != null && cart.containsKey(idSP)) {
            cart.remove(idSP); // Xóa sản phẩm khỏi giỏ hàng
        }
        return "redirect:/ban-hang/cart/view"; // Quay lại trang giỏ hàng
    }

    @PostMapping("/update")
    public String updateCart(@RequestParam Integer idSP, @RequestParam Integer soLuong, Model model) {
        Map<Integer, Integer> cart = (Map<Integer, Integer>) model.getAttribute("cart");
        if (cart != null && cart.containsKey(idSP)) {
            if (soLuong <= 0) {
                cart.remove(idSP); // Nếu số lượng <= 0, xóa sản phẩm khỏi giỏ hàng
            } else {
                cart.put(idSP, soLuong); // Cập nhật số lượng sản phẩm
            }
        }
        return "redirect:/ban-hang/cart/view"; // Quay lại trang giỏ hàng
    }
}