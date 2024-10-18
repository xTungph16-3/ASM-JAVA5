<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Chi tiết Sản Phẩm Chi Tiết</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Quản lý Sản Phẩm Chi Tiết</a>
    </div>
</nav>

<div class="container mt-5">
    <h2>Chi tiết Sản Phẩm Chi Tiết</h2>
    <table class="table table-bordered">
        <tr>
            <th>ID</th>
            <td>${spct.id}</td>
        </tr>
        <tr>
            <th>Mã Sản Phẩm</th>
            <td>${spct.maSPCT}</td>
        </tr>
        <tr>
            <th>Màu Sắc</th>
            <td>${spct.idMauSac}</td>
        </tr>
        <tr>
            <th>Tên Sản Phẩm</th>
            <td>${spct.idSanPham}</td>
        </tr>
        <tr>
            <th>Kích Thước</th>
            <td>${spct.idKichThuoc}</td>
        </tr>
        <tr>
            <th>Số Lượng</th>
            <td>${spct.soLuong}</td>
        </tr>
        <tr>
            <th>Đơn Giá</th>
            <td>${spct.donGia}</td>
        </tr>
        <tr>
            <th>Trạng Thái</th>
            <td>${spct.trangThai == 1 ? "Hoạt động" : "Không hoạt động"}</td>
        </tr>
    </table>
    <a href="/spct/index" class="btn btn-secondary">Quay lại</a>
</div>

</body>
</html>