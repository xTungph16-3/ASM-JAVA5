package com.example.demo.controller;

import com.example.demo.entities.HoaDon;
import com.example.demo.entities.HoaDonChiTiet;
import com.example.demo.entities.KhachHang;
import com.example.demo.entities.NhanVien;
import com.example.demo.entities.SanPham;
import com.example.demo.Repositories.HoaDonChiTietRepository;
import com.example.demo.Repositories.HoaDonRepository;
import com.example.demo.Repositories.KhachHangRepository;
import com.example.demo.Repositories.NhanVienRepository;
import com.example.demo.Repositories.SanPhamRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.http.ResponseEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/ban-hang")
public class BanHangController {

    private final SanPhamRepository sanPhamRepository;
    private final HoaDonRepository hoaDonRepository;
    private final HoaDonChiTietRepository hoaDonChiTietRepository;
    private final KhachHangRepository khachHangRepository;
    private final NhanVienRepository nhanVienRepository;

    // Thêm biến để lưu trữ giỏ hàng
    private Map<Integer, Integer> cart = new HashMap<>(); // Giỏ hàng lưu trữ sản phẩm và số lượng

    public BanHangController(SanPhamRepository sanPhamRepository, HoaDonRepository hoaDonRepository, HoaDonChiTietRepository hoaDonChiTietRepository, KhachHangRepository khachHangRepository, NhanVienRepository nhanVienRepository) {
        this.sanPhamRepository = sanPhamRepository;
        this.hoaDonRepository = hoaDonRepository;
        this.hoaDonChiTietRepository = hoaDonChiTietRepository;
        this.khachHangRepository = khachHangRepository;
        this.nhanVienRepository = nhanVienRepository;
    }

    @GetMapping("index")
    public String index(Model model, @RequestParam(required = false) String search) {
        List<SanPham> products;
        if (search != null && !search.isEmpty()) {
            products = sanPhamRepository.findByTenContaining(search); // Sửa đổi tên phương thức
        } else {
            products = sanPhamRepository.findAll();
        }
        model.addAttribute("products", products);
        
        List<HoaDon> hoaDons = hoaDonRepository.findAll();
        model.addAttribute("hoaDons", hoaDons);
        
        List<HoaDonChiTiet> hoaDonChiTiets = hoaDonChiTietRepository.findAll();
        model.addAttribute("hdctList", hoaDonChiTiets);
        
        List<KhachHang> khachHangs = khachHangRepository.findAll();
        model.addAttribute("khachHangs", khachHangs);
        
        List<NhanVien> nhanViens = nhanVienRepository.findAll();
        model.addAttribute("nhanViens", nhanViens);
        
        return "ban-hang/ban_hang";
    }

    @PostMapping("add")
    public String addToInvoice(@RequestParam Integer idSP, @RequestParam Integer soLuong, @RequestParam String idKhachHang, @RequestParam String idNhanVien, @RequestParam String ngayMuaHang, @RequestParam Integer trangThai, RedirectAttributes redirectAttributes) {
        if (soLuong <= 0) {
            return "redirect:/ban-hang/index";
        }

        SanPham sanPham = sanPhamRepository.findById(idSP).orElse(null);
        if (sanPham == null) {
            return "redirect:/ban-hang/index";
        }

        if (sanPham.getSoLuong() < soLuong) {
            return "redirect:/ban-hang/index";
        }

        HoaDon hoaDon = new HoaDon();
        hoaDon.setIdKhachHang(idKhachHang);
        hoaDon.setIdNhanVien(idNhanVien);
        hoaDon.setNgayMuaHang(ngayMuaHang);
        hoaDon.setTrangThai(trangThai);

        hoaDonRepository.save(hoaDon);

        HoaDonChiTiet hdct = new HoaDonChiTiet();
        hdct.setIdHoaDon(hoaDon.getId());
        hdct.setIdSP(idSP);
        hdct.setSoLuong(soLuong);
        hdct.setDonGia(sanPham.getDonGia() * soLuong);
        hdct.setTrangThai(trangThai == 1 ? 1 : 0); // Nếu trangThai là 1 thì "Đã bán", ngược lại "Chưa bán"

        hoaDonChiTietRepository.save(hdct);

        sanPham.setSoLuong(sanPham.getSoLuong() - soLuong);
        sanPhamRepository.save(sanPham);

        return "redirect:/ban-hang/index";
    }

    @GetMapping("create")
    public String create(Model model) {
        return "ban-hang/create"; // Trả về trang tạo hóa đơn
    }

    @PostMapping("store")
    public String store(@RequestParam String idKhachHang, @RequestParam String idNhanVien, @RequestParam String ngayMuaHang, @RequestParam Integer trangThai) {
        // Tạo hóa đơn mới
        HoaDon hoaDon = new HoaDon();
        hoaDon.setIdKhachHang(idKhachHang);
        hoaDon.setIdNhanVien(idNhanVien);
        hoaDon.setNgayMuaHang(ngayMuaHang);
        hoaDon.setTrangThai(trangThai);

        // Lưu hóa đơn
        hoaDonRepository.save(hoaDon);

        // Redirect về danh sách hóa đơn
        return "redirect:/hoa-don/index"; // Đảm bảo rằng trang này tồn tại
    }

    @GetMapping("/detail/{id}")
    public String detail(@PathVariable Integer id, Model model) {
        // Lấy hóa đơn theo ID
        HoaDon hoaDon = hoaDonRepository.findById(id).orElse(null);
        if (hoaDon == null) {
            return "redirect:/ban-hang/index"; // Redirect nếu không tìm thấy hóa đơn
        }

        // Lấy danh sách chi tiết hóa đơn theo ID hóa đơn
        List<HoaDonChiTiet> hdctList = hoaDonChiTietRepository.findByIdHoaDon(id);
        
        model.addAttribute("hoaDon", hoaDon);
        model.addAttribute("hdctList", hdctList);
        
        return "ban-hang/detail"; // Trả về trang detail.jsp
    }

    @GetMapping("/hdct/detail/{id}")
    public String detailHdct(@PathVariable Integer id, Model model) {
        HoaDonChiTiet hdct = hoaDonChiTietRepository.findById(id).orElse(null);
        if (hdct == null) {
            return "redirect:/ban-hang/index"; // Redirect nếu không tìm thấy hóa đơn chi tiết
        }

        model.addAttribute("hdct", hdct);
        return "ban-hang/hdct_detail"; // Trả về trang hdct_detail.jsp
    }

    @GetMapping("/product/detail/{id}")
    public String detailProduct(@PathVariable Integer id, Model model) {
        SanPham product = sanPhamRepository.findById(id).orElse(null);
        if (product == null) {
            return "redirect:/san-pham/index"; // Redirect nếu không tìm thấy sản phẩm
        }

        model.addAttribute("product", product);
        return "ban-hang/product_detail"; // Trả về trang product_detail.jsp
    }

    @GetMapping("/export-invoice/{id}")
    @ResponseBody
    public ResponseEntity<byte[]> exportInvoice(@PathVariable Integer id) {
        HoaDon hoaDon = hoaDonRepository.findById(id).orElse(null);
        if (hoaDon == null) {
            return ResponseEntity.notFound().build();
        }

        List<HoaDonChiTiet> hdctList = hoaDonChiTietRepository.findByIdHoaDon(id);
        
        // Tạo nội dung hóa đơn (có thể sử dụng thư viện để tạo PDF hoặc Excel)
        StringBuilder invoiceContent = new StringBuilder();
        invoiceContent.append("Hóa Đơn ID: ").append(hoaDon.getId()).append("\n");
        invoiceContent.append("Khách Hàng: ").append(hoaDon.getIdKhachHang()).append("\n");
        invoiceContent.append("Nhân Viên: ").append(hoaDon.getIdNhanVien()).append("\n");
        invoiceContent.append("Ngày Mua: ").append(hoaDon.getNgayMuaHang()).append("\n");
        invoiceContent.append("Chi Tiết Hóa Đơn:\n");
        
        for (HoaDonChiTiet hdct : hdctList) {
            invoiceContent.append("Sản Phẩm ID: ").append(hdct.getIdSP())
                          .append(", Số Lượng: ").append(hdct.getSoLuong())
                          .append(", Đơn Giá: ").append(hdct.getDonGia()).append("\n");
        }

        byte[] invoiceBytes = invoiceContent.toString().getBytes();

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.TEXT_PLAIN);
        headers.setContentDispositionFormData("attachment", "invoice_" + id + ".txt");

        return ResponseEntity.ok()
                .headers(headers)
                .body(invoiceBytes);
    }
}