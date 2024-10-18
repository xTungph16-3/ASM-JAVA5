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
    <title>Danh sách Nhân Viên</title>
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
    <form action="/nhan-vien/search" method="get">
        <div class="form-group">
            <label for="id">Tìm kiếm theo ID:</label>
            <input type="number" class="form-control" id="id" name="id" placeholder="Nhập ID">
        </div>
        <button type="submit" class="btn btn-primary mt-2">Tìm kiếm</button>
    </form>
    <form action="/nhan-vien/store" method="post" class="mb-4">
        <div class="form-group">
            <label for="id">ID</label>
            <input type="text" class="form-control" id="id" name="id">
        </div>
        <div class="form-group">
            <label for="maNV">Mã nhân viên</label>
            <input type="text" class="form-control" id="maNV" name="maNV" value="${data1.maNV}">
            <c:if test="${not empty errors['maNV']}">
                <small class="text-danger">${errors['maNV']}</small>
            </c:if>
        </div>
        <div class="form-group">
            <label for="ten">Tên nhân viên</label>
            <input type="text" class="form-control" id="ten" name="ten" value="${data1.ten}">
            <c:if test="${not empty errors['ten']}">
                <small class="text-danger">${errors['ten']}</small>
            </c:if>
        </div>
        <div class="form-group">
            <label for="tenDangNhap">Tên đăng nhập</label>
            <input type="text" class="form-control" id="tenDangNhap" name="tenDangNhap" value="${data1.tenDangNhap}">
            <c:if test="${not empty errors['tenDangNhap']}">
                <small class="text-danger">${errors['tenDangNhap']}</small>
            </c:if>
        </div>
        <div class="form-group">
            <label for="matKhau">Mật khẩu</label>
            <input type="text" class="form-control" id="matKhau" name="matKhau" value="${data1.matKhau}">
            <c:if test="${not empty errors['matKhau']}">
                <small class="text-danger">${errors['matKhau']}</small>
            </c:if>
        </div>
        <div class="form-group">
            <label for="trangThai">Trạng thái</label>
            <select class="form-control" id="trangThai" name="trangThai">
                <option value="1" ${data1.trangThai == 1 ? 'selected' : ''}>Hoạt động</option>
                <option value="2" ${data1.trangThai == 2 ? 'selected' : ''}>Không hoạt động</option>
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
            <th>Tên đăng nhập</th>
            <th>Mật khẩu</th>
            <th>Trạng thái</th>
            <th>Hành động</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${data}" var="nhanVien">
            <tr>
                <td>${nhanVien.id}</td>
                <td>${nhanVien.maNV}</td>
                <td>${nhanVien.ten}</td>
                <td>${nhanVien.tenDangNhap}</td>
                <td>${nhanVien.matKhau}</td>
                <td>${nhanVien.trangThai == 1 ? "Hoạt động" : "Không hoạt động"}</td>
                <td>
                    <a href="/nhan-vien/edit/${nhanVien.id}" class="btn btn-primary">Cập nhật</a>
                    <a href="/nhan-vien/delete/${nhanVien.id}" class="btn btn-danger">Xóa</a>
                    <a href="/nhan-vien/detail/${nhanVien.id}" class="btn btn-info">Chi tiết</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div>
        <c:if test="${currentPage > 0}">
            <a href="/nhan-vien/index?page=${currentPage - 1}" class="btn btn-secondary">Trang trước</a>
        </c:if>
        <c:if test="${currentPage < totalPages - 1}">
            <a href="/nhan-vien/index?page=${currentPage + 1}" class="btn btn-secondary">Trang sau</a>
        </c:if>
    </div>
</div>

</body>
</html>