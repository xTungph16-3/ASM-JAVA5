<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Cập nhật Kích Thước</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Quản lý Kích Thước</a>
    </div>
</nav>

<div class="container mt-5">
    <h2>Cập nhật Kích Thước</h2>
    <form action="/kich-thuoc/update/${data.id}" method="post">
        <div class="form-group">
            <label for="id">ID</label>
            <input type="text" class="form-control" id="id" name="id" value="${data.id}" readonly>
        </div>
        <div class="form-group">
            <label for="ma">Mã Kích Thước</label>
            <input type="text" class="form-control" id="ma" name="ma" value="${data.ma}">
        </div>
        <div class="form-group">
            <label for="ten">Tên Kích Thước</label>
            <input type="text" class="form-control" id="ten" name="ten" value="${data.ten}">
        </div>
        <div class="form-group">
            <label for="trangThai">Trạng Thái</label>
            <select class="form-control" id="trangThai" name="trangThai">
                <option value="1" ${data.trangThai == 1 ? 'selected' : ''}>Hoạt động</option>
                <option value="0" ${data.trangThai == 0 ? 'selected' : ''}>Không hoạt động</option>
            </select>
        </div>
        <button type="submit" class="btn btn-primary">Cập nhật</button>
    </form>
</div>

</body>
</html>