<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Danh sách Sản Phẩm Chi Tiết</title>
</head>
<body>
<h2>Danh sách Sản Phẩm Chi Tiết</h2>
<table border="1">
    <thead>
    <tr>
        <th>ID</th>
        <th>Mã Sản Phẩm Chi Tiết</th>
        <th>ID Kích Thước</th>
        <th>ID Màu Sắc</th>
        <th>ID Sản Phẩm</th>
        <th>Số Lượng</th>
        <th>Đơn Giá</th>
        <th>Trạng Thái</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="spct" items="${data}">
        <tr>
            <td><c:out value="${spct.id}"/></td>
            <td><c:out value="${spct.maSPCT}"/></td>
            <td><c:out value="${spct.idKichThuoc}"/></td>
            <td><c:out value="${spct.idMauSac}"/></td>
            <td><c:out value="${spct.idSanPham}"/></td>
            <td><c:out value="${spct.soLuong}"/></td>
            <td><c:out value="${spct.donGia}"/></td>
            <td><c:out value="${spct.trangThai == 1 ? 'Hoạt động' : 'Không hoạt động'}"/></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>