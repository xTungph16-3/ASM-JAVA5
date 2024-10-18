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
    <title>Danh sách Sản phẩm chi tiết</title>
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
    <form action="/spct/search" method="get">
        <div class="form-group">
            <label for="id">Tìm kiếm theo ID:</label>
            <input type="number" class="form-control" id="id" name="id" placeholder="Nhập ID">
        </div>
        <button type="submit" class="btn btn-primary mt-2">Tìm kiếm</button>
    </form>
    <form action="/spct/store" method="post" class="mb-4">
        <div class="form-group">
            <label for="id">ID</label>
            <input type="text" class="form-control" id="id" name="id" value="${data1.id}">
            <c:if test="${not empty errors['id']}">
                <small class="text-danger">${errors['id']}</small>
            </c:if>
        </div>
        <div class="form-group">
            <label for="maSPCT">Mã sản phẩm chi tiết</label>
            <input type="text" class="form-control" id="maSPCT" name="maSPCT" value="${data1.maSPCT}" required>
            <c:if test="${not empty errors['maSPCT']}">
                <small class="text-danger">${errors['maSPCT']}</small>
            </c:if>
        </div>
        <div class="form-group">
            <label for="idKichThuoc">ID Kích thước</label>
            <input type="number" class="form-control" id="idKichThuoc" name="idKichThuoc" value="${data1.idKichThuoc}" required>
            <c:if test="${not empty errors['idKichThuoc']}">
                <small class="text-danger">${errors['idKichThuoc']}</small>
            </c:if>
        </div>
        <div class="form-group">
            <label for="idMauSac">ID Màu sắc</label>
            <input type="number" class="form-control" id="idMauSac" name="idMauSac" value="${data1.idMauSac}" required>
            <c:if test="${not empty errors['idMauSac']}">
                <small class="text-danger">${errors['idMauSac']}</small>
            </c:if>
        </div>
        <div class="form-group">
            <label for="idSanPham">ID Sản phẩm</label>
            <input type="text" class="form-control" id="idSanPham" name="idSanPham" value="${data1.idSanPham}" required>
            <c:if test="${not empty errors['idSanPham']}">
                <small class="text-danger">${errors['idSanPham']}</small>
            </c:if>
        </div>
        <div class="form-group">
            <label for="soLuong">Số lượng</label>
            <input type="number" class="form-control" id="soLuong" name="soLuong" value="${data1.soLuong}" required>
            <c:if test="${not empty errors['soLuong']}">
                <small class="text-danger">${errors['soLuong']}</small>
            </c:if>
        </div>
        <div class="form-group">
            <label for="donGia">Đơn giá</label>
            <input type="text" class="form-control" id="donGia" name="donGia" value="${data1.donGia}" required>
            <c:if test="${not empty errors['donGia']}">
                <small class="text-danger">${errors['donGia']}</small>
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
            <th scope="col">ID</th>
            <th scope="col">Mã sản phẩm chi tiết</th>
            <th scope="col">ID Kích thước</th>
            <th scope="col">ID Màu sắc</th>
            <th scope="col">ID Sản phẩm</th>
            <th scope="col">Số lượng</th>
            <th scope="col">Đơn giá</th>
            <th scope="col">Trạng thái</th>
            <th scope="col">Thao tác</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${data}" var="p">
            <tr>
                <td>${p.id}</td>
                <td>${p.maSPCT}</td>
                <td>${p.idKichThuoc}</td>
                <td>${p.idMauSac}</td>
                <td>${p.idSanPham}</td>
                <td>${p.soLuong}</td>
                <td>${p.donGia}</td>
                <td>${p.trangThai == 1 ? "Hoạt động" : "Không hoạt động"}</td>
                <td>
                    <a href="/spct/edit/${p.id}" class="btn btn-primary">Cập nhật</a>
                    <a href="/spct/delete/${p.id}" class="btn btn-danger">Xóa</a>
                    <a href="/spct/detail/${p.id}" class="btn btn-info">Chi tiết</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div>
        <c:if test="${currentPage > 0}">
            <a href="/spct/index?page=${currentPage - 1}" class="btn btn-secondary">Trang trước</a>
        </c:if>
        <c:if test="${currentPage < totalPages - 1}">
            <a href="/spct/index?page=${currentPage + 1}" class="btn btn-secondary">Trang sau</a>
        </c:if>
    </div>
</div>

</body>
</html>