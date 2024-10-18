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
    <title>Danh sách Khách Hàng</title>
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
    <form action="/khach-hang/search" method="get">
        <div class="form-group">
            <label for="id">Tìm kiếm theo ID:</label>
            <input type="number" class="form-control" id="id" name="id" placeholder="Nhập ID">
        </div>
        <button type="submit" class="btn btn-primary mt-2">Tìm kiếm</button>
    </form>
    <form action="/khach-hang/store" method="post" class="mb-4">
        <div class="form-group">
            <label for="id">ID</label>
            <input type="text" class="form-control" id="id" name="id">
        </div>
        <div class="form-group">
            <label for="maKH">Mã khách hàng</label>
            <input type="text" class="form-control" id="maKH" name="maKH" value="${data1.maKH}">
            <c:if test="${not empty errors['maKH']}">
                <small class="text-danger">${errors['maKH']}</small>
            </c:if>
        </div>
        <div class="form-group">
            <label for="ten">Tên khách hàng</label>
            <input type="text" class="form-control" id="ten" name="ten" value="${data1.ten}">
            <c:if test="${not empty errors['ten']}">
                <small class="text-danger">${errors['ten']}</small>
            </c:if>
        </div>
        <div class="form-group">
            <label for="sdt">Số điện thoại</label>
            <input type="text" class="form-control" id="sdt" name="sdt" value="${data1.sdt}">
            <c:if test="${not empty errors['sdt']}">
                <small class="text-danger">${errors['sdt']}</small>
            </c:if>
        </div>
        <div class="form-group">
            <label for="trangThai">Trạng thái</label>
            <select class="form-control" id="trangThai" name="trangThai">
                <option value="1" ${data1.trangThai == 1 ? 'selected' : ''}>Hoạt động</option>
                <option value="0" ${data1.trangThai == 0 ? 'selected' : ''}>Không hoạt động</option>
            </select>
            <c:if test="${not empty errors['trangThai']}">
                <small class="text-danger">${errors['trangThai']}</small>
            </c:if>
        </div>
        <button type="submit" class="btn btn-primary">Lưu</button>
    </form>

    <table class="table table-bordered">
        <thead>
        <tr>
            <th>ID</th>
            <th>Mã</th>
            <th>Tên</th>
            <th>Số điện thoại</th>
            <th>Trạng thái</th>
            <th>Hành động</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${data}" var="khachHang">
            <tr>
                <td>${khachHang.id}</td>
                <td>${khachHang.maKH}</td>
                <td>${khachHang.ten}</td>
                <td>${khachHang.sdt}</td>
                <td>${khachHang.trangThai == 1 ? "Hoạt động" : "Không hoạt động"}</td>
                <td>
                    <a href="/khach-hang/edit/${khachHang.id}" class="btn btn-primary">Cập nhật</a>
                    <a href="/khach-hang/delete/${khachHang.id}" class="btn btn-danger">Xóa</a>
                    <a href="/khach-hang/detail/${khachHang.id}" class="btn btn-info">Chi tiết</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div>
        <c:if test="${currentPage > 0}">
            <a href="/khach-hang/index?page=${currentPage - 1}" class="btn btn-secondary">Trang trước</a>
        </c:if>
        <c:if test="${currentPage < totalPages - 1}">
            <a href="/khach-hang/index?page=${currentPage + 1}" class="btn btn-secondary">Trang sau</a>
        </c:if>
    </div>
</div>

</body>
</html>