<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Phần Mềm Bán Hàng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <script>
        // Hàm để tự động ẩn thông báo sau 5 giây
        function hideAlert() {
            const alert = document.getElementById('alertMessage');
            if (alert) {
                setTimeout(() => {
                    alert.style.display = 'none';
                }, 5000); // 5000 milliseconds = 5 seconds
            }
        }

        // Hàm xác nhận thanh toán
        function confirmPayment(event) {
            event.preventDefault(); // Ngăn chặn gửi form ngay lập tức
            const confirmation = confirm("Bạn có muốn thanh toán không?");
            if (confirmation) {
                document.getElementById("paymentForm").submit(); // Gửi form nếu người dùng xác nhận
            }
        }
    </script>
    <style>
        .navbar {
            background-color: #007bff; /* Màu nền cho navbar */
        }
        .navbar-nav .nav-link {
            color: white; /* Màu chữ cho các liên kết */
            transition: color 0.3s; /* Thêm hiệu ứng chuyển tiếp cho màu chữ */
        }
        .navbar-nav .nav-link:hover {
            color: #ffc107; /* Màu chữ khi di chuột */
            animation: shake 0.5s; /* Thêm hiệu ứng rung */
        }
        @keyframes shake {
            0% { transform: translate(1px, 0); }
            25% { transform: translate(-1px, 0); }
            50% { transform: translate(1px, 0); }
            75% { transform: translate(-1px, 0); }
            100% { transform: translate(0, 0); }
        }
        .btn-danger {
            background-color: #dc3545; /* Màu nền cho nút Logout */
            border: none; /* Bỏ viền */
        }
        .btn-danger:hover {
            background-color: #c82333; /* Màu nền khi di chuột */
        }
    </style>
</head>
<body onload="hideAlert()">
    <nav class="navbar navbar-expand-lg">
        <div class="container-fluid">
            <a class="navbar-brand" href="#" style="color: white;">Quản lý Bán Hàng</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="/ban-hang/index">Bán hàng</a>
                    </li>
                    <li class="nav-item"></li>
                        <a class="nav-link" href="/ban-hang/cart/view">Giỏ Hàng</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/san-pham/index">Sản phẩm</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/khach-hang/index">Khách hàng</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/nhan-vien/index">Nhân viên</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/hoa-don/index">Hóa đơn</a>
                    </li>
                </ul>
            </div>
            <p><a href="/dang-nhap/logout" class="btn btn-danger">Logout</a></p>
        </div>
    </nav>

    <div class="container mt-5">
        <c:if test="${not empty message}">
            <div id="alertMessage" class="alert alert-success alert-dismissible fade show" role="alert">
                ${message}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </c:if>

        <div class="form-group">
            <label for="search">Tìm kiếm sản phẩm:</label>
            <form action="/ban-hang/index" method="get">
                <input type="text" class="form-control" id="search" name="search" placeholder="Nhập tên sản phẩm">
                <button type="submit" class="btn btn-primary mt-2">Tìm kiếm</button>
            </form>
        </div>

        <h2 class="mb-4">Hóa Đơn</h2>
        <div class="card mb-4">
            <div class="card-body">
                <table class="table table-bordered table-striped table-responsive">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>ID Nhân viên</th>
                        <th>ID Khách hàng</th>
                        <th>Ngày mua hàng</th>
                        <th>Hành động</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${hoaDons}" var="hoaDon">
                        <tr>
                            <td>${hoaDon.id}</td>
                            <td>${hoaDon.idNhanVien}</td>
                            <td>${hoaDon.idKhachHang}</td>
                            <td>${hoaDon.ngayMuaHang}</td>
                            <td>
                                <a href="/ban-hang/detail/${hoaDon.id}" class="btn btn-info">Xem Chi Tiết</a>
                                <a href="/ban-hang/export-invoice/${hoaDon.id}" class="btn btn-success">Xuất Hóa Đơn</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

        <h2 class="mb-4">Hóa Đơn Chi Tiết</h2>
        <div class="card mb-4">
            <div class="card-body">
                <table class="table table-bordered table-striped table-responsive">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>ID Hóa đơn</th>
                        <th>ID Sản phẩm chi tiết</th>
                        <th>Số lượng</th>
                        <th>Đơn giá</th>
                        <th>Trạng thái</th>
                        <th>Hành động</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${hdctList}" var="hdct">
                        <tr>
                            <td>${hdct.id}</td>
                            <td>${hdct.idHoaDon}</td>
                            <td>${hdct.idSP}</td>
                            <td>${hdct.soLuong}</td>
                            <td>${hdct.donGia}</td>
                            <td>${hdct.trangThai == 1 ? "Đã bán" : "Chưa bán"}</td>
                            <td>
                                <a href="/ban-hang/hdct/detail/${hdct.id}" class="btn btn-info">Xem Chi Tiết</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

        <h2 class="mb-4">Sản Phẩm</h2>
        <div class="card mb-4">
            <div class="card-body">
                <table class="table table-bordered table-striped table-responsive">
                    <thead>
                    <tr>
                        <th>IDSP</th>
                        <th>Mã SP</th>
                        <th>Tên SP</th>
                        <th>Số Lượng Tồn</th>
                        <th>Giá Bán</th>
                        <th>Hành động</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${products}" var="product">
                        <tr>
                            <td>${product.id}</td>
                            <td>${product.ma}</td>
                            <td>${product.ten}</td>
                            <td>${product.soLuong}</td>
                            <td>${product.donGia}</td>
                            <td>
                                <a href="/ban-hang/product/detail/${product.id}" class="btn btn-info">Xem Chi Tiết</a>
                                <form action="/ban-hang/cart/add" method="post" style="display:inline;">
                                    <input type="hidden" name="idSP" value="${product.id}">
                                    <input type="number" name="soLuong" min="1" max="${product.soLuong}" value="1" required>
                                    <button type="submit" class="btn btn-primary">Thêm vào giỏ hàng</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

        <h3 class="mt-5">Tạo Hóa Đơn</h3>
        <form id="paymentForm" action="/ban-hang/add" method="post">
            <div class="card mb-4">
                <div class="card-body">
                    <div class="form-group">
                        <label for="idSP">Chọn Sản Phẩm</label>
                        <select class="form-control" id="idSP" name="idSP" required>
                            <c:forEach items="${products}" var="product">
                                <option value="${product.id}">${product.ten} (Mã: ${product.ma})</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="soLuong">Số Lượng</label>
                        <input type="number" class="form-control" id="soLuong" name="soLuong" required>
                    </div>
                    <div class="form-group">
                        <label for="idKhachHang">Chọn Khách Hàng</label>
                        <select class="form-control" id="idKhachHang" name="idKhachHang" required>
                            <c:forEach items="${khachHangs}" var="khachHang">
                                <option value="${khachHang.id}">${khachHang.ten} (Mã: ${khachHang.ma})</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="idNhanVien">Chọn Nhân Viên</label>
                        <select class="form-control" id="idNhanVien" name="idNhanVien" required>
                            <c:forEach items="${nhanViens}" var="nhanVien">
                                <option value="${nhanVien.id}">${nhanVien.ten} (Mã: ${nhanVien.ma})</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="ngayMuaHang">Ngày Bán Hàng</label>
                        <input type="date" class="form-control" id="ngayMuaHang" name="ngayMuaHang" required>
                    </div>
                    <div class="form-group">
                        <label for="trangThai">Trạng thái</label>
                        <select class="form-control" id="trangThai" name="trangThai" required>
                            <option value="1">Đã bán</option>
                            <option value="0">Chưa bán</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-success" onclick="confirmPayment(event)">Thanh Toán</button>
                </div>
            </div>
        </form>
    </div>
</body>
</html>