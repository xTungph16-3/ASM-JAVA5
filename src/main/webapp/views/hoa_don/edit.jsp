<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Cập nhật Hóa Đơn</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Quản lý Hóa Đơn</a>
    </div>
</nav>

<div class="container mt-5">
    <h2>Cập nhật Hóa Đơn</h2>
    <form action="/hoa-don/update/${data.id}" method="post">
        <div class="form-group">
            <label for="id">ID</label>
            <input type="text" class="form-control" id="id" name="id" value="${data.id}" readonly>
        </div>
        <div class="form-group">
            <label for="idnv">ID Nhân viên</label>
            <input type="text" class="form-control" id="idnv" name="idNhanVien" value="${data.idNhanVien}">
        </div>
        <div class="form-group">
            <label for="idkh">ID Khách hàng</label>
            <input type="text" class="form-control" id="idkh" name="idKhachHang" value="${data.idKhachHang}">
        </div>
        <div class="form-group">
            <label for="ngaymua">Ngày mua</label>
            <input type="date" class="form-control" id="ngaymua" name="ngayMuaHang" value="${data.ngayMuaHang}">
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