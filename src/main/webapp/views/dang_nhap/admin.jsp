<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <title>Dashboard Admin</title>
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
        }
        .header-title {
            text-align: center;
            margin-top: 20px;
            font-size: 2rem;
            color: #343a40;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Quản lý Admin</a>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link" href="/san-pham/index">Sản phẩm</a></li>
                <li class="nav-item"><a class="nav-link" href="/khach-hang/index">Khách hàng</a></li>
                <li class="nav-item"><a class="nav-link" href="/mau-sac/index">Màu sắc</a></li>
                <li class="nav-item"><a class="nav-link" href="/kich-thuoc/index">Kích thước</a></li>
                <li class="nav-item"><a class="nav-link" href="/hoa-don/index">Hóa đơn</a></li>
                <li class="nav-item"><a class="nav-link" href="/nhan-vien/index">Nhân viên</a></li>
                <li class="nav-item"><a class="nav-link" href="/hdct/index">Hóa đơn chi tiết</a></li>
                <li class="nav-item"><a class="nav-link" href="/spct/index">Sản phẩm chi tiết</a></li>
            </ul>
        </div>
        <p><a href="/dang-nhap/logout" class="btn btn-danger">Logout</a></p>
    </div>
</nav>
<div class="container mt-5">
    <h2 class="header-title">Chào mừng đến với Dashboard Admin!</h2>
    <div class="alert alert-info" role="alert">
        ${message}
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>