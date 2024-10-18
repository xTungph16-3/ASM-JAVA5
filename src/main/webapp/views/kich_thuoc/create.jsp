<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Danh sách Kích Thước</title>
</head>
<body>
<h2>Danh sách Kích Thước</h2>
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
    <c:forEach var="kichThuoc" items="${data}">
        <tr>
            <td><c:out value="${kichThuoc.id}"/></td>
            <td><c:out value="${kichThuoc.ma}"/></td>
            <td><c:out value="${kichThuoc.ten}"/></td>
            <td><c:out value="${kichThuoc.trangThai == 1 ? 'Hoạt động' : 'Không hoạt động'}"/></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>