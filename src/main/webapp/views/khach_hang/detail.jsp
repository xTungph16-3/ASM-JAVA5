<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Chi tiết Khách Hàng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Quản lý Khách Hàng</a>
    </div>
</nav>

<div class="container mt-5">
    <h2>Chi tiết Khách Hàng</h2>
    <table class="table table-bordered">
        <tr>
            <th>ID</th>
            <td>${kh.id}</td>
        </tr>
        <tr>
            <th>Mã Khách Hàng</th>
            <td>${kh.maKH}</td>
        </tr>
        <tr>
            <th>Tên Khách Hàng</th>
            <td>${kh.ten}</td>
        </tr>
        <tr>
            <th>Số Điện Thoại</th>
            <td>${kh.sdt}</td>
        </tr>
        <tr>
            <th>Trạng Thái</th>
            <td>${kh.trangThai == 1 ? "Hoạt động" : "Không hoạt động"}</td>
        </tr>
    </table>
    <a href="/khach-hang/index" class="btn btn-secondary">Quay lại</a>
</div>

</body>
</html>