<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <title>Preskool - Exam</title>

    <!-- Favicon -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/img/favicon.png">

    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,500;0,600;0,700;1,400&display=swap">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/plugins/bootstrap/css/bootstrap.min.css">

    <!-- Fontawesome CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/plugins/fontawesome/css/fontawesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/plugins/fontawesome/css/all.min.css">

    <!-- Datatables CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/plugins/datatables/datatables.min.css">

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
                        <h3 class="page-title">考试</h3>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.jsp">仪表板</a></li>
                            <li class="breadcrumb-item active">考试</li>
                        </ul>
                    </div>
                    <div class="col-auto text-right float-right ml-auto">
                        <a href="#" class="btn btn-outline-primary mr-2"><i class="fas fa-download"></i> 下载</a>
                        <a href="${pageContext.request.contextPath}/pages/add-exam.jsp" class="btn btn-primary"><i
                                class="fas fa-plus"></i> 添加考试</a>
                    </div>
                </div>
            </div>
            <!-- /Page Header -->

            <div class="row">
                <div class="col-sm-12">

                    <div class="card card-table">
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-hover table-center mb-0 datatable">
                                    <thead>
                                    <tr>
                                        <th>试卷</th>
                                        <th>班级</th>
                                        <th>开始时间</th>
                                        <th>结束时间</th>
                                        <th>状态</th>
                                        <th class="text-right">操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${exams}" var="exam">
                                        <tr>
                                            <td>${exam.paper_name}</td>
                                            <td>${exam.class_name}</td>
                                            <td>${exam.exam_begin}</td>
                                            <td>${exam.exam_end}</td>
                                            <c:if test="${exam.status == '已结束'}">
                                                <td><span class="btn btn-danger btn-sm">${exam.status}</span></td>
                                            </c:if>
                                            <c:if test="${exam.status == '进行中'}">
                                                <td><span class="btn btn-success btn-sm">${exam.status}</span></td>
                                            </c:if>
                                            <c:if test="${exam.status == '未开始'}">
                                                <td><span class="btn btn-info btn-sm">${exam.status}</span></td>
                                            </c:if>

                                            <td class="text-right">
                                                <div class="actions">
                                                    <c:if test="${exam.status == '已结束'}">
                                                        <a class="btn btn-success btn-sm"
                                                           href="${pageContext.request.contextPath}/scoreServlet?action=findScoreById&examId=${exam.exam_id}">查看考试成绩</a>
                                                    </c:if>
                                                    <a href="javascript:;"
                                                       onclick="deleteExam('${exam.class_name}','${exam.paper_name}',${exam.exam_id})"
                                                       class="btn btn-sm bg-danger-light">
                                                        <i class="fas fa-trash"></i>
                                                    </a>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>

                                    </tbody>
                                </table>
                                <script src="${pageContext.request.contextPath}/static/js/jquery-3.5.1.min.js"></script>
                                <script>
                                    function deleteExam(className, paperName, exam_id) {
                                        if (confirm("是否要删除\"" + className + "\"的\"" + paperName + "\"考试?")) {
                                            $.post("${pageContext.request.contextPath}/examServlet", {
                                                    "action": "deleteExamById",
                                                    "exam_id": exam_id
                                                }
                                                , function (data) {
                                                    if (data.result) {
                                                        alert("删除成功！")
                                                        window.location.href = "${pageContext.request.contextPath}/examServlet?action=findExams"
                                                    }
                                                }, "json")
                                        } else {
                                            return false;
                                        }
                                    }
                                </script>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer -->
        <footer>
            <p>Copyright © 2020By </p>
        </footer>
        <!-- /Footer -->

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

<!-- Datatables JS -->
<script src="${pageContext.request.contextPath}/static/plugins/datatables/datatables.min.js"></script>

<!-- Custom JS -->
<script src="${pageContext.request.contextPath}/static/js/script.js"></script>
</body>
</html>