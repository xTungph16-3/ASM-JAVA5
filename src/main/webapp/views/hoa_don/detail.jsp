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
            <td>${hd.id}</td>
        </tr>
        <tr>
            <th>ID Nhân Viên</th>
            <td>${hd.idNhanVien}</td>
        </tr>
        <tr>
            <th>ID Khách Hàng</th>
            <td>${hd.idKhachHang}</td>
        </tr>
        <tr>
            <th>Ngày Mua</th>
            <td>${hd.ngayMuaHang}</td>
        </tr>
        <tr>
            <th>Trạng Thái</th>
            <td>${hd.trangThai == 1 ? "Hoạt động" : "Không hoạt động"}</td>
        </tr>
    </table>
    <a href="/hoa-don/index" class="btn btn-secondary">Quay lại</a>
</div>

</body>
</html>