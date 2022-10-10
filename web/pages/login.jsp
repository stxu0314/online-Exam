<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <title>Preskool - Login</title>

    <!-- Favicon -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/img/favicon.png">

    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,500;0,600;0,700;1,400&display=swap">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/plugins/bootstrap/css/bootstrap.min.css">

    <!-- Fontawesome CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/plugins/fontawesome/css/fontawesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/plugins/fontawesome/css/all.min.css">

    <!-- Main CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css">
</head>
<body>
<%
    session.setAttribute("token",System.currentTimeMillis() + "");
%>

<!-- Main Wrapper -->
<div class="main-wrapper login-body">
    <div class="login-wrapper">
        <div class="container">
            <div class="loginbox">
                <div class="login-left">
                    <img class="img-fluid" src="${pageContext.request.contextPath}/static/img/logo-white.png"
                         alt="Logo">
                </div>
                <div class="login-right">
                    <div class="login-right-wrap">
                        <h1>登&nbsp;&nbsp;&nbsp;&nbsp;录</h1>
                        <p class="account-subtitle" style="color: red">${requestScope.msg}
                        </p>

                        <!-- Form -->
                        <form action="${pageContext.request.contextPath}/userServlet" method="post">
                            <input type="hidden" name="action" value="login"/>
                            <div class="form-group">
                                <input class="form-control" type="text" name="username"
                                       value="${requestScope.username}"
                                       placeholder="请输入用户名">
                            </div>
                            <div class="form-group">
                                <input class="form-control" type="password" name="password" placeholder="请输入密码">
                            </div>
                            <input type="hidden" name="token" value="${sessionScope.token}">
                            <div class="form-group">
                                <button class="btn btn-primary btn-block" type="submit">登 录</button>
                            </div>
                        </form>
                        <!-- /Form -->

                        <div class="text-center forgotpass"><a href="forgot-password.jsp">忘记密码?</a></div>
                        <div class="login-or">
                            <span class="or-line"></span>
                            <span class="span-or">or</span>
                        </div>

                        <!-- Social Login -->
                        <div class="social-login">
                            <span>其他登陆方式</span>
                            <a href="#" class="facebook"><i class="fab fa-facebook-f"></i></a><a href="#"
                                                                                                 class="google"><i
                                class="fab fa-google"></i></a>
                        </div>
                        <!-- /Social Login -->

                        <div class="text-center dont-have">还没有账号? <a
                                href="${pageContext.request.contextPath}/pages/register.jsp">注册</a></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /Main Wrapper -->

<!-- jQuery -->
<script src="${pageContext.request.contextPath}/static/js/jquery-3.5.1.min.js"></script>

<!-- Bootstrap Core JS -->
<script src="${pageContext.request.contextPath}/static/js/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/static/plugins/bootstrap/js/bootstrap.min.js"></script>

<!-- Custom JS -->
<script src="${pageContext.request.contextPath}/static/js/script.js"></script>

</body>
</html>