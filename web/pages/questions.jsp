<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="v" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <title>Preskool - Subjects</title>

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
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.5.1.min.js"></script>
    <style>
        xmp{
            font-size: 15px;
        }
    </style>
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
                        <h3 class="page-title">试题</h3>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.jsp">仪表板</a></li>
                            <li class="breadcrumb-item active">试题</li>
                        </ul>
                    </div>
                    <div class="col-auto text-right float-right ml-auto">
                        <a href="#" class="btn btn-outline-primary mr-2"><i class="fas fa-download"></i> 下载</a>
                        <a  href="pages/add-question.jsp" class="btn btn-primary"><i class="fas fa-plus"></i> 添加试题</a>
                        <form style="display: inline;position: relative;top:0px" action="${pageContext.request.contextPath}/questionServlet?action=importQuestions" method="post" enctype="multipart/form-data" >
                            <input name="name" type="hidden" value="ques"/>
                            <input name="file" style="width: 200px" class="btn btn-primary" type="file"/>
                            <input type="submit" value="导入试题" class="btn btn-primary"/>
                        </form>

                    </div>
                </div>
            </div>
            <!-- /Page Header -->

            <script type="text/javascript">
                $(function () {
                    if (${not empty SUCCESS}){
                            alert("导入成功！")
                    }
                })
            </script>
            <div class="row">
                <div class="col-sm-12">

                    <div class="card card-table">
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-hover table-center mb-0 datatable">
                                    <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>类型</th>
                                        <th>课程类型</th>
                                        <th>题目</th>
                                        <th>选项A</th>
                                        <th>选项B</th>
                                        <th>选项C</th>
                                        <th>选项D</th>
                                        <th>正确答案</th>
                                        <th class="text-right">操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${questions}" var="question">
                                        <tr>
                                            <td>${question.question_id}</td>
                                            <c:if test="${question.question_type=='x'}">
                                                <td>单选题</td>
                                            </c:if>
                                            <c:if test="${question.question_type=='y'}">
                                                <td>多选题</td>
                                            </c:if>
                                            <c:if test="${question.question_type=='z'}">
                                                <td>判断题</td>
                                            </c:if>
                                            <td>${question.course_name}</td>

                                            <c:if test="${fn:length(question.question_name) >= 9}">
                                                <td><xmp>${fn:substring(question.question_name,0,7)}...</xmp></td>
                                            </c:if>
                                            <c:if test="${fn:length(question.question_name) <9}">
                                                <td><xmp>${question.question_name}</xmp></td>
                                            </c:if>

                                            <c:if test="${fn:length(question.question_opa) >= 5}">
                                                <td><xmp>${fn:substring(question.question_opa,0,5)}...</xmp></td>
                                            </c:if>
                                            <c:if test="${fn:length(question.question_opa) < 5}">
                                                <td><xmp>${question.question_opa}</xmp></td>
                                            </c:if>

                                            <c:if test="${fn:length(question.question_opb) >= 5}">
                                                <td><xmp>${fn:substring(question.question_opb,0,5)}...</xmp></td>
                                            </c:if>
                                            <c:if test="${fn:length(question.question_opb) < 5}">
                                                <td><xmp>${question.question_opb}</xmp></td>
                                            </c:if>

                                            <c:if test="${fn:length(question.question_opc) >= 5}">
                                                <td><xmp>${fn:substring(question.question_opc,0,5)}...</xmp></td>
                                            </c:if>
                                            <c:if test="${fn:length(question.question_opc) < 5}">
                                                <td><xmp>${question.question_opc}</xmp></td>
                                            </c:if>

                                            <c:if test="${fn:length(question.question_opd) >= 5}">
                                                <td><xmp>${fn:substring(question.question_opd,0,5)}...</xmp></td>
                                            </c:if>
                                            <c:if test="${fn:length(question.question_opd) < 5}">
                                                <td><xmp>${question.question_opd}</xmp></td>
                                            </c:if>

                                            <td>${question.question_opright}</td>
                                            <td class="text-right">
                                                <c:if test="${paperId == null}">
                                                    <div class="actions">
                                                        <a href="${pageContext.request.contextPath}/questionServlet?action=findQuestionById&question_id=${question.question_id}"
                                                           class="btn btn-sm bg-success-light mr-2">
                                                            <i class="fas fa-pen"></i>
                                                        </a>
                                                        <a href="javascript:;"
                                                           onclick="deleteQues('${question.question_name}',${question.question_id})"
                                                           class="btn btn-sm bg-danger-light">
                                                            <i class="fas fa-trash"></i>
                                                        </a>
                                                    </div>
                                                </c:if>
                                                <c:if test="${paperId != null}">
                                                    <c:forEach items="${exist}" var="e">
                                                        <c:choose>
                                                            <c:when test="${e == question.question_id}">
                                                                <button class="btn btn-rounded btn-warning">
                                                                    已添加到试卷
                                                                </button>
                                                            </c:when>
                                                        </c:choose>
                                                    </c:forEach>

                                                    <script>
                                                        $(function () {
                                                            $("button[class='btn btn-rounded btn-warning']").next().remove()
                                                        })
                                                        $(document).mousemove(function(e){
                                                            $("button[class='btn btn-rounded btn-warning']").next().remove()
                                                        });
                                                    </script>
                                                    <button class="btn btn-rounded btn-info"
                                                            onclick="addQuestionToPaper(${question.question_id})">添加到试卷
                                                    </button>
                                                    <script>
                                                        $(function () {
                                                            $("button[class='btn btn-rounded btn-info']").click(function () {
                                                                $(this).attr("class","btn btn-rounded btn-warning").text("已添加到试卷")
                                                                $(this).removeAttr("onclick")
                                                            })
                                                        })
                                                    </script>
                                                </c:if>
                                            </td>
                                        </tr>
                                    </c:forEach>

                                    </tbody>
                                </table>

                                <script>
                                    function deleteQues(name, question_id) {
                                        if (confirm("是否要删除题目\"" + name + "\"?")) {
                                            $.post("${pageContext.request.contextPath}/questionServlet", {
                                                "action": "deleteQuestionById",
                                                "question_id": question_id},function (data) {
                                                if (data.result) {
                                                    alert("删除成功！")
                                                    window.location.href = "${pageContext.request.contextPath}/questionServlet?action=findQuestions"
                                                }
                                            }, "json")
                                        } else {
                                            return false;
                                        }
                                    }

                                </script>
                                <script>
                                    function addQuestionToPaper(question_id) {
                                        if (${paperId!=null}){
                                            $.post("${pageContext.request.contextPath}/questionServlet", {
                                                    "action": "addQuestionToPaper",
                                                    "question_id": question_id,
                                                    "paperId":${paperId}
                                                }
                                                , function (data) {
                                                    if (data.result) {
                                                        alert("添加成功")
                                                    }
                                                }, "json")

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