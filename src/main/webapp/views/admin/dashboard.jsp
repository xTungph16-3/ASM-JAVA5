<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Dashboard Admin</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
        }
        .card {
            border-radius: 10px;
            transition: transform 0.2s;
        }
        .card:hover {
            transform: scale(1.05);
        }
        .navbar {
            background-color: #007bff;
        }
        .navbar-brand, .nav-link {
            color: white !important;
        }
        .navbar-brand:hover, .nav-link:hover {
            color: #ffc107 !important;
        }
        .header-title {
            text-align: center;
            margin-top: 20px;
            font-size: 2rem;
            color: #343a40;
        }
        .table-container {
            display: none; /* Ẩn các bảng danh sách */
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light">
    <a class="navbar-brand" href="#">Quản lý Bán hàng</a>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
            <li class="nav-item"><a class="nav-link" href="/ban-hang/index">Bán hàng</a></li>
            <li class="nav-item"><a class="nav-link" href="/san-pham/index">Quản lý sản phẩm</a></li>
            <li class="nav-item"><a class="nav-link" href="/khach-hang/index">Quản lý khách hàng</a></li>
            <li class="nav-item"><a class="nav-link" href="/nhan-vien/index">Quản lý nhân viên</a></li>
        </ul>
        <form class="form-inline ml-auto">
            <a href="/dang-nhap/logout" class="btn btn-danger">Logout</a>
        </form>
    </div>
</nav>

<div class="container mt-5">
    <h2 class="header-title">Dashboard Admin</h2>
    <div class="row">
        <div class="col-md-3">
            <div class="card text-white bg-primary mb-3" onclick="showTable('productsTable')">
                <div class="card-header">Tổng sản phẩm</div>
                <div class="card-body">
                    <h5 class="card-title">${totalProducts}</h5>
                    <p class="card-text">Số lượng sản phẩm hiện có trong kho.</p>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card text-white bg-success mb-3" onclick="showTable('ordersTable')">
                <div class="card-header">Tổng đơn hàng</div>
                <div class="card-body">
                    <h5 class="card-title">${totalOrders}</h5>
                    <p class="card-text">Số lượng đơn hàng đã được xử lý.</p>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card text-white bg-danger mb-3" onclick="showTable('customersTable')">
                <div class="card-header">Tổng khách hàng</div>
                <div class="card-body">
                    <h5 class="card-title">${totalCustomers}</h5>
                    <p class="card-text">Số lượng khách hàng đã đăng ký.</p>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card text-white bg-info mb-3" onclick="showTable('employeesTable')">
                <div class="card-header">Tổng nhân viên</div>
                <div class="card-body">
                    <h5 class="card-title">${totalEmployees}</h5>
                    <p class="card-text">Số lượng nhân viên hiện có trong hệ thống.</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Bảng danh sách sản phẩm -->
    <div id="productsTable" class="table-container">
        <h3>Danh sách sản phẩm</h3>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Mã</th>
                    <th>Tên</th>
                    <th>Số lượng</th>
                    <th>Đơn giá</th>
                    <th>Trạng thái</th>
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
                        <td>${product.trangThai == 1 ? "Hoạt động" : "Không hoạt động"}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- Bảng danh sách hóa đơn -->
    <div id="ordersTable" class="table-container">
        <h3>Danh sách hóa đơn</h3>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>ID Nhân viên</th>
                    <th>ID Khách hàng</th>
                    <th>Ngày mua hàng</th>
                    <th>Trạng thái</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${orders}" var="order">
                    <tr>
                        <td>${order.id}</td>
                        <td>${order.idNhanVien}</td>
                        <td>${order.idKhachHang}</td>
                        <td>${order.ngayMuaHang}</td>
                        <td>${order.trangThai == 1 ? "Hoạt động" : "Không hoạt động"}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- Bảng danh sách khách hàng -->
    <div id="customersTable" class="table-container">
        <h3>Danh sách khách hàng</h3>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Mã</th>
                    <th>Tên</th>
                    <th>Số điện thoại</th>
                    <th>Trạng thái</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${customers}" var="customer">
                    <tr>
                        <td>${customer.id}</td>
                        <td>${customer.maKH}</td>
                        <td>${customer.ten}</td>
                        <td>${customer.sdt}</td>
                        <td>${customer.trangThai == 1 ? "Hoạt động" : "Không hoạt động"}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- Bảng danh sách nhân viên -->
    <div id="employeesTable" class="table-container">
        <h3>Danh sách nhân viên</h3>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Mã</th>
                    <th>Tên</th>
                    <th>Tên đăng nhập</th>
                    <th>Mật khẩu</th>
                    <th>Trạng thái</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${employees}" var="employee">
                    <tr>
                        <td>${employee.id}</td>
                        <td>${employee.maNV}</td>
                        <td>${employee.ten}</td>
                        <td>${employee.tenDangNhap}</td>
                        <td>${employee.matKhau}</td>
                        <td>${employee.trangThai == 1 ? "Hoạt động" : "Không hoạt động"}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function showTable(tableId) {
        // Ẩn tất cả các bảng
        document.querySelectorAll('.table-container').forEach(function(table) {
            table.style.display = 'none';
        });
        // Hiện bảng được chọn
        document.getElementById(tableId).style.display = 'block';
    }
</script>
</body>
</html>