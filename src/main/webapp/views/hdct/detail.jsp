<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Chi tiết Hóa Đơn Chi Tiết</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Quản lý Hóa Đơn Chi Tiết</a>
    </div>
</nav>

<div class="container mt-5">
    <h2>Chi tiết Hóa Đơn Chi Tiết</h2>
    <table class="table table-bordered">
        <tr>
            <th>ID</th>
            <td>${hdct.id}</td>
        </tr>
        <tr>
            <th>ID Hóa Đơn</th>
            <td>${hdct.idHoaDon}</td>
        </tr>
        <tr>
            <th>ID Sản Phẩm Chi Tiết</th>
            <td>${hdct.idSP}</td>
        </tr>
        <tr>
            <th>Số lượng</th>
            <td>${hdct.soLuong}</td>
        </tr>
        <tr>
            <th>Đơn giá</th>
            <td>${hdct.donGia}</td>
        </tr>
        <tr>
            <th>Trạng thái</th>
            <td>${hdct.trangThai == 1 ? "Hoạt động" : "Không hoạt động"}</td>
        </tr>
    </table>
    <a href="/hdct/index" class="btn btn-secondary">Quay lại</a>
</div>

</body>
</html>