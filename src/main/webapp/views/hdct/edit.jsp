<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Cập nhật Hóa Đơn Chi Tiết</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Quản lý Hóa Đơn Chi Tiết</a>
    </div>
</nav>

<div class="container mt-5">
    <h2>Cập nhật Hóa Đơn Chi Tiết</h2>
    <form action="/hdct/update/${data.id}" method="post">
        <div class="form-group">
            <label for="id">ID</label>
            <input type="text" class="form-control" id="id" name="id" value="${data.id}">
            <c:if test="${not empty errors['id']}">
                <small class="text-danger">${errors['id']}</small>
            </c:if>
        </div>
        <div class="form-group">
            <label for="idHoaDon">ID Hóa đơn</label>
            <input type="number" class="form-control" id="idHoaDon" name="idHoaDon" value="${data.idHoaDon}">
            <c:if test="${not empty errors['idHoaDon']}">
                <small class="text-danger">${errors['idHoaDon']}</small>
            </c:if>
        </div>
        <div class="form-group">
            <label for="idSP">ID Sản phẩm chi tiết</label>
            <input type="number" class="form-control" id="idSP" name="idSP" value="${data.idSP}">
            <c:if test="${not empty errors['idSP']}">
                <small class="text-danger">${errors['idSP']}</small>
            </c:if>
        </div>
        <div class="form-group">
            <label for="soLuong">Số lượng</label>
            <input type="number" class="form-control" id="soLuong" name="soLuong" value="${data.soLuong}">
            <c:if test="${not empty errors['soLuong']}">
                <small class="text-danger">${errors['soLuong']}</small>
            </c:if>
        </div>
        <div class="form-group">
            <label for="donGia">Đơn giá</label>
            <input type="text" class="form-control" id="donGia" name="donGia" value="${data.donGia}">
            <c:if test="${not empty errors['donGia']}">
                <small class="text-danger">${errors['donGia']}</small>
            </c:if>
        </div>
        <div class="form-group">
            <label for="trangThai">Trạng thái</label>
            <select class="form-control" id="trangThai" name="trangThai">
                <option value="1" <c:if test="${data.trangThai == 1}">selected</c:if>>Hoạt động</option>
                <option value="0" <c:if test="${data.trangThai == 0}">selected</c:if>>Không hoạt động</option>
            </select>
        </div>
        <button type="submit" class="btn btn-primary">Cập nhật</button>
    </form>
</div>
</body>
</html>
