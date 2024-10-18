<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Danh sách Màu Sắc</title>
</head>
<body>
<h2>Danh sách Màu Sắc</h2>
<table border="1">
    <thead>
    <tr>
        <th>ID</th>
        <th>Mã</th>
        <th>Tên</th>
        <th>Trạng thái</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="mauSac" items="${data}">
        <tr>
            <td><c:out value="${mauSac.id}"/></td>
            <td><c:out value="${mauSac.ma}"/></td>
            <td><c:out value="${mauSac.ten}"/></td>
            <td><c:out value="${mauSac.trangThai == 1 ? 'Hoạt động' : 'Không hoạt động'}"/></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>