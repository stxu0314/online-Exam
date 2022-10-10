<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <title>稳过 - 我的考试</title>

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

<!-- Header -->
<%@include file="/pages/common/header.jsp" %>
<!-- /Header -->

<!-- Sidebar -->
<%@include file="/pages/common/sidebar-stu.jsp" %>
<!-- /Sidebar -->


<!-- Page Wrapper -->
<div class="page-wrapper">
    <div class="content container-fluid">

        <!-- Page Header -->
        <div class="page-header">
            <div class="row">
                <div class="col-sm-12">
                    <h3 class="page-title">我的考试</h3>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.jsp">仪表盘</a></li>
                        <li class="breadcrumb-item active">我的考试</li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- /Page Header -->

        <div class="row">
            <div class="col-sm-12">
                <c:if test="${myExams == null}">
                    <h3>您还没有考试</h3>
                </c:if>
                <c:forEach items="${myExams}" var="e">
                    <div class="row">
                        <div class="col-xs-6 col-lg-4">
                            <h2>${e.paper_name}</h2>
                            <p>开始时间：${e.exam_begin}</p>
                            <p>结束时间：${e.exam_end}</p>
                            <p><a class="btn btn-default" href="javascript:;" onclick="beginExam('${e.exam_begin}',${e.paper_id},${e.exam_id})" style="color: #1d9bea" role="button">开始考试 »</a></p>
                        </div><!--/.col-xs-6.col-lg-4-->
                    </div>
                    <hr>
                </c:forEach>
            </div>
        </div>
        <script>
            function beginExam(examBegin,paperId,examId) {
                var beginDate = new Date(examBegin)
                var now = new Date();
                if (beginDate.getTime() - now.getTime() > 0){
                    alert("还没到考试时间！");
                    window.location.href="${pageContext.request.contextPath}/examServlet?action=findMyExams&userId=${USER.user_id}";
                }

                $.post("scoreServlet",{"action": "ifAttended","examId":examId,"userId":${USER.user_id}},function (data) {
                    if (data.result){
                        alert("您已参加过该考试，不可再次参加")
                    }else {
                        window.location.href="${pageContext.request.contextPath}/paperServlet?action=findQuesExam&paperId="+paperId+"&examId="+examId;
                    }
                },"json")
            }
        </script>
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