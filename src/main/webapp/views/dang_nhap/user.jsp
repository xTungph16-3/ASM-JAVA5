<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <title>Dashboard User</title>
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
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
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Dashboard User</a>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link" href="/san-pham/index">Sản phẩm</a></li>
                <li class="nav-item"><a class="nav-link" href="/khach-hang/index">Khách hàng</a></li>
                <li class="nav-item"><a class="nav-link" href="/mau-sac/index">Màu sắc</a></li>
                <li class="nav-item"><a class="nav-link" href="/kich-thuoc/index">Kích thước</a></li>
                <li class="nav-item"><a class="nav-link" href="/spct/index">Sản phẩm chi tiết</a></li>
            </ul>
        </div>
        <p><a href="/dang-nhap/logout" class="btn btn-danger">Logout</a></p>
    </div>
</nav>
<div class="container mt-5">
    <h2 class="header-title">Chào mừng đến với Dashboard User!</h2>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>