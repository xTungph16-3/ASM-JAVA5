<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Tạo Hóa Đơn</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Quản lý Hóa Đơn</a>
    </div>
</nav>

<div class="container mt-5">
    <h2>Tạo Hóa Đơn</h2>
    <form action="/ban-hang/store" method="post">
        <div class="form-group">
            <label for="idKhachHang">Khách Hàng</label>
            <input type="text" class="form-control" id="idKhachHang" name="idKhachHang" required>
        </div>
        <div class="form-group">
            <label for="idNhanVien">Nhân Viên</label>
            <input type="text" class="form-control" id="idNhanVien" name="idNhanVien" required>
        </div>
        <div class="form-group">
            <label for="ngayMuaHang">Ngày Mua Hàng</label>
            <input type="date" class="form-control" id="ngayMuaHang" name="ngayMuaHang" required>
        </div>
        <div class="form-group">
            <label for="trangThai">Trạng Thái</label>
            <select class="form-control" id="trangThai" name="trangThai" required>
                <option value="1">Hoạt động</option>
                <option value="0">Không hoạt động</option>
            </select>
        </div>
        <button type="submit" class="btn btn-primary">Tạo Hóa Đơn</button>
    </form>

    <h3 class="mt-5">Chi tiết Hóa Đơn</h3>
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>Mã SP</th>
            <th>Tên SP</th>
            <th>Số lượng</th>
            <th>Đơn giá</th> <!-- Thay đổi ở đây -->
            <th>Thao tác</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${hdctList}" var="hdct">
            <tr>
                <td>${hdct.idSP}</td>
                <td>${hdct.tenSP}</td>
                <td>${hdct.soLuong}</td>
                <td>${hdct.donGia}</td> <!-- Thay đổi ở đây -->
                <td>
                    <a href="/hdct/delete/${hdct.id}" class="btn btn-danger">Xóa</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <h3 class="mt-5">Thêm Sản Phẩm vào Hóa Đơn</h3>
<form action="/ban-hang/add" method="post">
    <div class="form-group">
        <label for="idSP">Chọn Sản Phẩm</label>
        <select class="form-control" id="idSP" name="idSP" required>
            <c:forEach items="${products}" var="product">
                <option value="${product.id}">${product.ten} (Mã: ${product.ma})</option>
            </c:forEach>
        </select>
    </div>
    <div class="form-group">
        <label for="soLuong">Số Lượng</label>
        <input type="number" class="form-control" id="soLuong" name="soLuong" required>
    </div>
    <button type="submit" class="btn btn-success">Thêm vào Hóa Đơn</button>
</form>
</div>
</body>
</html>