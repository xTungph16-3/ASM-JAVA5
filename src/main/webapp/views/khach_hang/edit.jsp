<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Cập nhật Khách Hàng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Quản lý Khách Hàng</a>
    </div>
</nav>

<div class="container mt-5">
    <h2>Cập nhật Khách Hàng</h2>
    <form action="/khach-hang/update/${khachHang.id}" method="post"> <!-- Sửa thành khachHang.id -->

        <div class="form-group">
            <label for="id">ID</label>
            <input type="text" class="form-control" id="id" name="id" value="${khachHang.id}" readonly>
        </div>
        <div class="form-group">
            <label for="ten">Tên Khách Hàng</label>
            <input type="text" class="form-control" id="ten" name="ten" value="${khachHang.ten}">
        </div>
        <div class="form-group">
            <label for="sdt">Số Điện Thoại</label>
            <input type="text" class="form-control" id="sdt" name="sdt" value="${khachHang.sdt}">
        </div>
        <div class="form-group">
            <label for="maKH">Mã Khách Hàng</label>
            <input type="text" class="form-control" id="maKH" name="maKH" value="${khachHang.maKH}">
        </div>
        <div class="form-group">
            <label for="trangThai">Trạng Thái</label>
            <select class="form-control" id="trangThai" name="trangThai">
                <option value="1" ${khachHang.trangThai == 1 ? 'selected' : ''}>Hoạt động</option>
                <option value="0" ${khachHang.trangThai == 0 ? 'selected' : ''}>Không hoạt động</option>
            </select>
        </div>
        <button type="submit" class="btn btn-primary">Cập nhật</button>
    </form>
</div>

</body>
</html>