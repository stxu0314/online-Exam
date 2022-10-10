<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <title>Preskool - Register</title>

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

<!-- Main Wrapper -->
<div class="main-wrapper login-body">
    <div class="login-wrapper">
        <div class="container">
            <div class="loginbox">
                <div class="login-left">
                    <img class="img-fluid" src="${pageContext.request.contextPath}/static/img/logo-white.png" alt="Logo">
                </div>
                <div class="login-right">
                    <div class="login-right-wrap">
                        <h1>注&nbsp;&nbsp;&nbsp;&nbsp;册</h1>
<%--                        <p class="account-subtitle" style="color:red"><%=request.getAttribute("msg") == null ? "" : request.getAttribute("msg")%></p>--%>
                        <p class="account-subtitle" style="color:red">${requestScope.msg}</p>

                        <!-- Form -->
                        <form  action="${pageContext.request.contextPath}/userServlet" method="post" id="regForm">
                            <input type="hidden" name="action" value="regist"/>
                            <div class="form-group">
                                <input class="form-control" type="text" name="username" value="${requestScope.username}" placeholder="请输入用户名">
                            </div>
                            <div class="form-group">
                                <input class="form-control" type="text" name="email" value="${requestScope.email}" placeholder="请输入邮箱">
                            </div>
                            <div class="form-group">
                                <input class="form-control" type="password" name="password" placeholder="请输入密码">
                            </div>
                            <div class="form-group">
                                <input class="form-control" type="password" name="repassword" placeholder="请输入确认密码">
                            </div>
                            <div class="form-group mb-0">
                                <button class="btn btn-primary btn-block" type="submit">注 册</button>
                            </div>
                        </form>
                        <!-- /Form -->
                        <script src="${pageContext.request.contextPath}/static/js/jquery-3.5.1.min.js"></script>
                        <script>
                            $(function () {
                                $("#regForm").submit(function () {
                                    if ($("input[name='username']").val().length == 0){
                                        $("p[class='account-subtitle']").text("用户名不能为空")
                                        return false;
                                    }
                                    if ($("input[name='password']").val().length == 0){
                                        $("p[class='account-subtitle']").text("密码不能为空")
                                        return false;
                                    }
                                    if ($("input[name='email']").val().length == 0){
                                        $("p[class='account-subtitle']").text("邮箱不能为空")
                                        return false;
                                    }
                                    if ($("input[name='password']").val() != $("input[name='repassword']").val() ){
                                        $("p[class='account-subtitle']").text("密码和确认密码不一致")
                                        return false;
                                    }
                                    let regular = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
                                    if (!regular.test($("input[name='email']").val())){
                                        $("p[class='account-subtitle']").text("邮箱格式不正确")
                                        return false;
                                    }

                                    let regularPwd = /^[a-zA-Z]\w{5,17}$/;
                                    if (!regularPwd.test($("input[name='password']").val())){
                                        $("p[class='account-subtitle']").text("密码只能由字母或数字组成，长度5到17位")
                                        return false;
                                    }

                                })
                            })
                        </script>

                        <div class="login-or">
                            <span class="or-line"></span>
                            <span class="span-or">or</span>
                        </div>

                        <!-- Social Login -->
                        <div class="social-login">
                            <span>其他注册方式</span>
                            <a href="#" class="facebook"><i class="fab fa-facebook-f"></i></a><a href="#"
                                                                                                 class="google"><i
                                class="fab fa-google"></i></a>
                        </div>
                        <!-- /Social Login -->

                        <div class="text-center dont-have">已经有账号 <a href="login.jsp">登录</a></div>
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