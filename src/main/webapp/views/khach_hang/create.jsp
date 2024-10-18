<%@page contentType="text/html; ISO-8859-1" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Danh sách Khách Hàng</title>
</head>
<body>
<h2>Danh sách Khách Hàng</h2>
<table border="1">
    <thead>
    <tr>
        <th>Mã Khách Hàng</th>
        <th>Tên Khách Hàng</th>
        <th>Số Điện Thoại</th>
        <th>Trạng Thái</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="kh" items="${dsKhachHang}">
        <tr>
            <td><c:out value="${kh.maKH}"/></td>
            <td><c:out value="${kh.ten}"/></td>
            <td><c:out value="${kh.sdt}"/></td>
            <td><c:out value="${kh.trangThai == 1 ? 'Hoạt động' : 'Không hoạt động'}"/></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
