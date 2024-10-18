<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Danh sách Nhân Viên</title>
</head>
<body>
<h2>Danh sách Nhân Viên</h2>
<table border="1">
    <thead>
    <tr>
        <th>ID</th>
        <th>Mã Nhân Viên</th>
        <th>Tên</th>
        <th>Tên Đăng Nhập</th>
        <th>Mật Khẩu</th>
        <th>Trạng Thái</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="nhanVien" items="${data}">
        <tr>
            <td><c:out value="${nhanVien.id}"/></td>
            <td><c:out value="${nhanVien.maNV}"/></td>
            <td><c:out value="${nhanVien.ten}"/></td>
            <td><c:out value="${nhanVien.tenDangNhap}"/></td>
            <td><c:out value="${nhanVien.matKhau}"/></td>
            <td><c:out value="${nhanVien.trangThai == 1 ? 'Hoạt động' : 'Không hoạt động'}"/></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>