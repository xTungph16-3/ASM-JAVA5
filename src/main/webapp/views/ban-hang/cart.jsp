<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Giỏ Hàng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>
<div class="container mt-5">
    <h2>Giỏ Hàng</h2>
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>ID Sản Phẩm</th>
            <th>Tên Sản Phẩm</th>
            <th>Số Lượng</th>
            <th>Hành Động</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${cart}" var="entry">
            <tr>
                <td>${entry.key}</td>
                <td>
                    <c:forEach items="${products}" var="product">
                        <c:if test="${product.id == entry.key}">
                            ${product.ten}
                        </c:if>
                    </c:forEach>
                </td>
                <td>${entry.value}</td>
                <td>
                    <form action="/ban-hang/cart/update" method="post" style="display:inline;">
                        <input type="hidden" name="idSP" value="${entry.key}">
                        <input type="number" name="soLuong" value="${entry.value}" min="1" required>
                        <button type="submit" class="btn btn-warning">Cập Nhật</button>
                    </form>
                    <form action="/ban-hang/cart/remove" method="post" style="display:inline;">
                        <input type="hidden" name="idSP" value="${entry.key}">
                        <button type="submit" class="btn btn-danger">Xóa</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <a href="/ban-hang/index" class="btn btn-secondary">Quay lại</a>
</div>
</body>
</html>