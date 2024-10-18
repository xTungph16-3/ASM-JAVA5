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
            <td>${product.id}</td>
        </tr>
        <tr>
            <th>Mã SP</th>
            <td>${product.ma}</td>
        </tr>
        <tr>
            <th>Tên SP</th>
            <td>${product.ten}</td>
        </tr>
        <tr>
            <th>Số lượng tồn</th>
            <td>${product.soLuong}</td>
        </tr>
        <tr>
            <th>Giá bán</th>
            <td>${product.donGia}</td>
        </tr>
    </table>

    <a href="/ban-hang/index" class="btn btn-secondary">Quay lại</a>
</div>
</body>
</html>