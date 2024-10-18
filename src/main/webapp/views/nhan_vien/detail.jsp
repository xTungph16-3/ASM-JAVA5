<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Chi tiết Nhân Viên</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Quản lý Nhân Viên</a>
    </div>
</nav>

<div class="container mt-5">
    <h2>Chi tiết Nhân Viên</h2>
    <table class="table table-bordered">
        <tr>
            <th>ID</th>
            <td>${nv.id}</td>
        </tr>
        <tr>
            <th>Mã Nhân Viên</th>
            <td>${nv.maNV}</td>
        </tr>
        <tr>
            <th>Tên Nhân Viên</th>
            <td>${nv.ten}</td>
        </tr>
        <tr>
            <th>Tên Đăng Nhập</th>
            <td>${nv.tenDangNhap}</td>
        </tr>
        <tr>
            <th>Mật Khẩu</th>
            <td>${nv.matKhau}</td>
        </tr>
        <tr>
            <th>Trạng Thái</th>
            <td>${nv.trangThai == 1 ? "Hoạt động" : "Không hoạt động"}</td>
        </tr>
    </table>
    <a href="/nhan-vien/index" class="btn btn-secondary">Quay lại</a>
</div>

</body>
</html>