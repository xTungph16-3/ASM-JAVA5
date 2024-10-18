<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="f" uri="jakarta.tags.functions" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <title>Đăng Nhập</title>
    <style>
        body {
            background-color: #e9ecef;
            font-family: 'Arial', sans-serif;
        }
        .card {
            border-radius: 15px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s;
        }
        .card:hover {
            transform: scale(1.02);
        }
        .header-title {
            text-align: center;
            margin-top: 20px;
            font-size: 2rem;
            color: #343a40;
        }
        .btn-primary {
            background-color: #007bff;
            border: none;
        }
        .btn-primary:hover {
            background-color: #0056b3;
        }
        .form-check-label {
            color: #495057;
        }
        .error-message {
            color: red;
            text-align: center;
        }
        .footer {
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>
<div class="container" style="margin-top: 100px;">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header text-center">
                    <h3 class="header-title">Đăng Nhập</h3>
                </div>
                <div class="card-body">
                    <form action="/dang-nhap/checklogin" method="post">
                        <div class="form-group">
                            <label>UserName</label>
                            <input type="text" class="form-control" name="username" placeholder="Nhập UserName" required>
                        </div>
                        <div class="form-group">
                            <label>Mật Khẩu</label>
                            <input type="password" class="form-control" name="password" placeholder="Nhập mật khẩu" required>
                        </div>
                        <div class="form-check">
                            <input type="checkbox" class="form-check-input" id="rememberMe">
                            <label class="form-check-label" for="rememberMe">Ghi nhớ tôi</label>
                        </div>
                        <button type="submit" class="btn btn-primary btn-block">Đăng Nhập</button>
                        <button type="reset" class="btn btn-secondary btn-block">Hủy</button>
                    </form>
                </div>
            </div>
            <div class="footer">
                <p><a href="register" style="color: #007bff;">Đăng ký tài khoản mới</a></p>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>