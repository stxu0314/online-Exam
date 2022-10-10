<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="vip.grmz.onlineexam.service.CourseService" %>
<%@ page import="vip.grmz.onlineexam.service.impl.CourseServiceImpl" %>
<%@ page import="vip.grmz.onlineexam.entity.Course" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <title>Preskool - Subject</title>

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
<div class="main-wrapper">


    <!-- Header -->
    <%@include file="/pages/common/header.jsp" %>
    <!-- /Header -->

    <!-- Sidebar -->
    <%@include file="/pages/common/sidebar.jsp" %>
    <!-- /Sidebar -->

    <!-- Page Wrapper -->
    <div class="page-wrapper">
        <div class="content container-fluid">

            <!-- Page Header -->
            <div class="page-header">
                <div class="row align-items-center">
                    <div class="col">
                        <h3 class="page-title">添加试题</h3>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="questions.jsp">试题</a></li>
                            <li class="breadcrumb-item active">添加试题</li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- /Page Header -->

            <%
                CourseService service = new CourseServiceImpl();
                List<Course> courses = service.findCourses();
                request.setAttribute("courses", courses);

                session.setAttribute("token", System.currentTimeMillis() + "");
            %>

            <div class="row">
                <div class="col-sm-12">

                    <div class="card">
                        <div class="card-body">
                            <form method="post" id="addQuesForm"
                                  action="${pageContext.request.contextPath}/questionServlet">
                                <input type="hidden" name="action" value="addQuestion">
                                <input type="hidden" name="token" value="${sessionScope.token}">
                                <div class="row">
                                    <div class="col-12">
                                        <h5 class="form-title"><span>试题信息</span></h5>
                                    </div>
                                    <div class="col-12 col-sm-6">
                                        <div class="form-group">
                                            <label>试题类型</label>
                                            <select class="form-control" name="question_type">
                                                <option>请选择试题类型</option>
                                                <option value="x">单选题</option>
                                                <option value="y">多选题</option>
                                                <option value="z">判断题</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-12 col-sm-6">
                                        <div class="form-group">
                                            <label>试题课程类型</label>
                                            <select class="form-control" name="question_course">
                                                <option>请选择试题课程类型</option>
                                                <c:forEach items="${courses}" var="course">
                                                    <option value="${course.course_id}">${course.course_name}</option>
                                                </c:forEach>

                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-12 col-sm-6">
                                        <div class="form-group">
                                            <label>题目</label>
                                            <input type="text" name="question_name" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-6">
                                        <div class="form-group">
                                            <label>选项A</label>
                                            <div>
                                                <input type="text" name="question_opa" class="form-control">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-12 col-sm-6">
                                        <div class="form-group">
                                            <label>选项B</label>
                                            <div>
                                                <input type="text" name="question_opb" class="form-control">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-12 col-sm-6">
                                        <div class="form-group">
                                            <label>选项C</label>
                                            <div>
                                                <input type="text" name="question_opc" class="form-control">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-12 col-sm-6">
                                        <div class="form-group">
                                            <label>选项D</label>
                                            <div>
                                                <input type="text" name="question_opd" class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-6">
                                        <div class="form-group">
                                            <label>正确答案</label>
                                            <div>
                                                <input type="text" name="question_opright" class="form-control">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-12">
                                        <button type="submit" class="btn btn-primary">添加</button>
                                        <span style="color:red">${msg}</span>
                                    </div>
                                </div>
                            </form>
                            <!-- jQuery -->
                            <script src="${pageContext.request.contextPath}/static/js/jquery-3.5.1.min.js"></script>
                            <script type="text/javascript">
                                $(function () {
                                    $("#addQuesForm").submit(function () {
                                        let regularQues = /<(.*)>.*<\/\1>|<(.*) \/>/
                                        if (regularQues.test($("input[name='question_name']").val())) {
                                            alert("表单中包含非法字符")
                                            return false;
                                        }

                                    })
                                })
                            </script>
                        </div>
                    </div>

                </div>
            </div>
        </div>

    </div>
    <!-- /Page Wrapper -->

</div>
<!-- /Main Wrapper -->

<!-- jQuery -->
<script src="${pageContext.request.contextPath}/static/js/jquery-3.5.1.min.js"></script>

<!-- Bootstrap Core JS -->
<script src="${pageContext.request.contextPath}/static/js/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/static/plugins/bootstrap/js/bootstrap.min.js"></script>

<!-- Slimscroll JS -->
<script src="${pageContext.request.contextPath}/static/plugins/slimscroll/jquery.slimscroll.min.js"></script>

<!-- Custom JS -->
<script src="${pageContext.request.contextPath}/static/js/script.js"></script>
</body>
</html>