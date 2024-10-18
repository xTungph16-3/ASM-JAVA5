<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Chi tiết Sản Phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Quản lý Sản Phẩm</a>
    </div>
</nav>

<div class="container mt-5">
    <h2>Chi tiết Sản Phẩm</h2>
    <table class="table table-bordered">
        <tr>
            <th>ID</th>
            <td>${sp.id}</td>
        </tr>
        <tr>
            <th>Mã Sản Phẩm</th>
            <td>${sp.ma}</td>
        </tr>
        <tr>
            <th>Tên Sản Phẩm</th>
            <td>${sp.ten}</td>
        </tr>
        <tr>
            <th>Số Lượng</th>
            <td>${sp.soLuong}</td>
        </tr>
        <tr>
            <th>Đơn Giá</th>
            <td>${sp.donGia}</td> <!-- Added DonGia -->
        </tr>
        <tr>
            <th>Trạng Thái</th>
            <td>${sp.trangThai == 1 ? "Hoạt động" : "Không hoạt động"}</td> <!-- Changed to TrangThai -->
        </tr>
    </table>
    <a href="/san-pham/index" class="btn btn-secondary">Quay lại</a>
</div>

</body>
</html>