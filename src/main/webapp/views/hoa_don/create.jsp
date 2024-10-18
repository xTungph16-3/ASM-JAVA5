<%@page contentType="text/html; ISO-8859-1" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <title>Danh sách Hóa Đơn</title>
</head>
<body>
<h2>Danh sách Hóa Đơn</h2>
<table border="1">
    <thead>
    <tr>
        <th>ID Hóa Đơn</th>
        <th>ID Nhân Viên</th>
        <th>ID Khách Hàng</th>
        <th>Ngày Lập</th>
        <th>Trạng Thái</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="hoaDon" items="${data}">
        <tr>
            <td><c:out value="${hoaDon.id}"/></td>
            <td><c:out value="${hoaDon.idNhanVien}"/></td>
            <td><c:out value="${hoaDon.idKhachHang}"/></td>
            <td><c:out value="${hoaDon.ngayLap}"/></td>
            <td><c:out value="${hoaDon.trangThai == 1 ? 'Hoạt động' : 'Không hoạt động'}"/></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>