<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
          crossorigin="anonymous"/>
    <title>Danh sách Hóa Đơn</title>
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
        }
        .navbar {
            background-color: #007bff; /* Màu nền cho navbar */
        }
        .navbar-nav .nav-link {
            color: white; /* Màu chữ cho các liên kết */
            transition: color 0.3s; /* Thêm hiệu ứng chuyển tiếp cho màu chữ */
        }
        .navbar-nav .nav-link:hover {
            color: #ffc107; /* Màu chữ khi di chuột */
            animation: shake 0.5s; /* Thêm hiệu ứng rung */
        }
        @keyframes shake {
            0% { transform: translate(1px, 0); }
            25% { transform: translate(-1px, 0); }
            50% { transform: translate(1px, 0); }
            75% { transform: translate(-1px, 0); }
            100% { transform: translate(0, 0); }
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/admin/dashboard">Trang chủ</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/ban-hang/index">Bán hàng</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/san-pham/index">Sản phẩm</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/khach-hang/index">Khách hàng</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/mau-sac/index">Màu sắc</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/kich-thuoc/index">Kích thước</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/hoa-don/index">Hóa đơn</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/nhan-vien/index">Nhân viên</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/hdct/index">Hóa đơn chi tiết</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/spct/index">Sản phẩm chi tiết</a>
                </li>
            </ul>
        </div>
        <p><a href="/dang-nhap/logout" class="btn btn-danger">Logout</a></p>
    </div>
</nav>
<div class="container mt-5">
    <form action="/hoa-don/search" method="get">
        <div class="form-group">
            <label for="id">Tìm kiếm theo ID:</label>
            <input type="number" class="form-control" id="id" name="id" placeholder="Nhập ID">
        </div>
        <button type="submit" class="btn btn-primary mt-2">Tìm kiếm</button>
    </form>
    <form action="/hoa-don/store" method="post" class="mb-4">
        <div class="form-group">
            <label for="id">ID</label>
            <input type="text" class="form-control" id="id" name="id" value="${data1.id}">
            <c:if test="${not empty errors['id']}">
                <small class="text-danger">${errors['id']}</small>
            </c:if>
        </div>
        <div class="form-group">
            <label for="idNhanVien">ID Nhân viên</label>
            <input type="text" class="form-control" id="idNhanVien" name="idNhanVien" value="${data1.idNhanVien}" required>
            <c:if test="${not empty errors['idNhanVien']}">
                <small class="text-danger">${errors['idNhanVien']}</small>
            </c:if>
        </div>
        <div class="form-group">
            <label for="idKhachHang">ID Khách hàng</label>
            <input type="text" class="form-control" id="idKhachHang" name="idKhachHang" value="${data1.idKhachHang}" required>
            <c:if test="${not empty errors['idKhachHang']}">
                <small class="text-danger">${errors['idKhachHang']}</small>
            </c:if>
        </div>
        <div class="form-group">
            <label for="ngayMuaHang">Ngày mua hàng</label>
            <input type="date" class="form-control" id="ngayMuaHang" name="ngayMuaHang" value="${data1.ngayMuaHang}" required>
            <c:if test="${not empty errors['ngayMuaHang']}">
                <small class="text-danger">${errors['ngayMuaHang']}</small>
            </c:if>
        </div>
        <div class="form-group">
            <label for="trangThai">Trạng thái</label>
            <select class="form-control" id="trangThai" name="trangThai">
                <option value="1" ${data1.trangThai == 1 ? 'selected' : ''}>Hoạt động</option>
                <option value="0" ${data1.trangThai == 0 ? 'selected' : ''}>Không hoạt động</option>
            </select>
        </div>
        <div>
            <button type="submit" class="btn btn-primary">Lưu</button>
        </div>
    </form>
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>ID</th>
            <th>ID Nhân viên</th>
            <th>ID Khách hàng</th>
            <th>Ngày mua hàng</th>
            <th>Trạng thái</th>
            <th>Hành động</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${data}" var="hoaDon">
            <tr>
                <td>${hoaDon.id}</td>
                <td>${hoaDon.idNhanVien}</td>
                <td>${hoaDon.idKhachHang}</td>
                <td>${hoaDon.ngayMuaHang}</td>
                <td>${hoaDon.trangThai == 1 ? "Hoạt động" : "Không hoạt động"}</td>
                <td>
                    <a href="/hoa-don/edit/${hoaDon.id}" class="btn btn-primary">Cập nhật</a>
                    <a href="/hoa-don/delete/${hoaDon.id}" class="btn btn-danger">Xóa</a>
                    <a href="/hoa-don/detail/${hoaDon.id}" class="btn btn-info">Chi tiết</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div>
        <c:if test="${currentPage > 0}">
            <a href="/hoa-don/index?page=${currentPage - 1}" class="btn btn-secondary">Trang trước</a>
        </c:if>
        <c:if test="${currentPage < totalPages - 1}">
            <a href="/hoa-don/index?page=${currentPage + 1}" class="btn btn-secondary">Trang sau</a>
        </c:if>
    </div>
</div>

</body>
</html>