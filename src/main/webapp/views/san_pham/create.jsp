
<%@page contentType="text/html; ISO-8859-1" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <title>Danh sách sản phẩm</title>
</head>
<body>
<h2>Danh sách sản phẩm</h2>
<table border="1">
    <thead>
    <tr>
        <th>Mã</th>
        <th>Tên</th>
        <th>Số lượng</th>
        <th>Đơn giá</th>
        <th>Trạng thái</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="p" items="${ds}">
        <tr>
            <td><c:out value="${p.Ma}"/></td>
            <td><c:out value="${p.Ten}"/></td>
            <td><c:out value="${p.SoLuong}"/></td>
            <td><c:out value="${p.DonGia}"/></td> <!-- Added DonGia -->
            <td><c:out value="${p.TrangThai == 1 ? 'Hoạt động' : 'Không hoạt động'}"/></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>