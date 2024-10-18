<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Danh sách Hóa Đơn Chi Tiết</title>
</head>
<body>
<h2>Danh sách Hóa Đơn Chi Tiết</h2>
<table border="1">
    <thead>
    <tr>
        <th>ID</th>
        <th>ID Hóa Đơn</th>
        <th>ID Sản Phẩm</th>
        <th>Số Lượng</th>
        <th>Đơn Giá</th>
        <th>Trạng Thái</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="hoaDonChiTiet" items="${data}">
        <tr>
            <td><c:out value="${hoaDonChiTiet.id}"/></td>
            <td><c:out value="${hoaDonChiTiet.idHoaDon}"/></td>
            <td><c:out value="${hoaDonChiTiet.idSP}"/></td>
            <td><c:out value="${hoaDonChiTiet.soLuong}"/></td>
            <td><c:out value="${hoaDonChiTiet.donGia}"/></td>
            <td><c:out value="${hoaDonChiTiet.trangThai == 1 ? 'Hoạt động' : 'Không hoạt động'}"/></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>