<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Cập nhật Sản Phẩm Chi Tiết</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Quản lý Sản Phẩm Chi Tiết</a>
    </div>
</nav>

<div class="container mt-5">
    <h2>Cập nhật Sản Phẩm Chi Tiết</h2>
    <form action="/spct/update/${data.id}" method="post">
        <div class="form-group">
            <label for="id">ID</label>
            <input type="text" class="form-control" id="id" name="id" value="${data.id}" readonly>
        </div>
        <div class="form-group">
            <label for="maSPCT">Mã sản phẩm</label>
            <input type="text" class="form-control" id="maSPCT" name="maSPCT" value="${data.maSPCT}">
        </div>
        <div class="form-group">
            <label for="idKichThuoc">ID Kích Thước</label>
            <input type="number" class="form-control" id="idKichThuoc" name="idKichThuoc" value="${data.idKichThuoc}">
        </div>
        <div class="form-group">
            <label for="idMauSac">ID Màu Sắc</label>
            <input type="number" class="form-control" id="idMauSac" name="idMauSac" value="${data.idMauSac}">
        </div>
        <div class="form-group">
            <label for="idSanPham">ID Sản Phẩm</label>
            <input type="text" class="form-control" id="idSanPham" name="idSanPham" value="${data.idSanPham}">
        </div>
        <div class="form-group">
            <label for="soLuong">Số lượng</label>
            <input type="number" class="form-control" id="soLuong" name="soLuong" value="${data.soLuong}">
        </div>
        <div class="form-group">
            <label for="donGia">Đơn giá</label>
            <input type="text" class="form-control" id="donGia" name="donGia" value="${data.donGia}">
        </div>
        <div class="form-group">
            <label for="trangThai">Trạng thái</label>
            <select class="form-control" id="trangThai" name="trangThai">
                <option value="1" ${data.trangThai == 1 ? 'selected' : ''}>Hoạt động</option>
                <option value="0" ${data.trangThai == 0 ? 'selected' : ''}>Không hoạt động</option>
            </select>
        </div>
        <button type="submit" class="btn btn-primary">Cập nhật</button>
    </form>
</div>

</body>
</html>