<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Chi tiết Kích Thước</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Quản lý Kích Thước</a>
    </div>
</nav>

<div class="container mt-5">
    <h2>Chi tiết Kích Thước</h2>
    <table class="table table-bordered">
        <tr>
            <th>ID</th>
            <td>${kt.id}</td>
        </tr>
        <tr>
            <th>Mã Kích Thước</th>
            <td>${kt.ma}</td>
        </tr>
        <tr>
            <th>Tên Kích Thước</th>
            <td>${kt.ten}</td>
        </tr>
        <tr>
            <th>Trạng Thái</th>
            <td>${kt.trangThai == 1 ? "Hoạt động" : "Không hoạt động"}</td>
        </tr>
    </table>
    <a href="/kich-thuoc/index" class="btn btn-secondary">Quay lại</a>
</div>

</body>
</html>