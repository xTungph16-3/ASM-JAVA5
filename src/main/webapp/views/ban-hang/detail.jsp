<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Chi tiết Hóa Đơn</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Quản lý Hóa Đơn</a>
    </div>
</nav>

<div class="container mt-5">
    <h2>Chi tiết Hóa Đơn</h2>
    <table class="table table-bordered">
        <tr>
            <th>ID</th>
            <td>${hoaDon.id}</td>
        </tr>
        <tr>
            <th>ID Nhân viên</th>
            <td>${hoaDon.idNhanVien}</td>
        </tr>
        <tr>
            <th>ID Khách hàng</th>
            <td>${hoaDon.idKhachHang}</td>
        </tr>
        <tr>
            <th>Ngày mua hàng</th>
            <td>${hoaDon.ngayMuaHang}</td>
        </tr>
        <tr>
            <th>Trạng thái</th>
            <td>${hoaDon.trangThai == 1 ? "Hoạt động" : "Không hoạt động"}</td>
        </tr>
    </table>

    <a href="/ban-hang/index" class="btn btn-secondary">Quay lại</a>
</div>
</body>
</html>