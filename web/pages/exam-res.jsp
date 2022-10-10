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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap.min.css">

    <style>
        .title {
            font-size: 20px;
            margin-bottom: 5px;
        }

        input[type='radio'] {
            display: inline-block;
            width: 20px;
        }

        .sin_ques {
            font-size: 18px;
            display: inline-block;
            height: 35px;
            margin-left: 5px;
        }

        #scoreDiv {
            float: right;
            width: 22%;
            font-size: 20px;
        }

        #time {
            position: fixed;
            margin-left: 53%;
            font-size: 20px;
            color: blue;
        }

        input[type="radio"]::before {
            position: relative;
            content: "";
            top: -2px;
            left: 0px;
            width: 17px;
            height: 17px;
            display: block;
            border-radius: 50%;
            background-color: #fff;
            border: 1px solid #ff670c;
            z-index: 5;
        }
        input[type="radio"]:checked::after {
            position: relative;
            content: "";
            bottom: 15px;
            left: 4px;
            width: 9px;
            height: 9px;
            display: block;
            border-radius: 50%;
            visibility: visible;
            background-color: #ff670c;
            z-index: 6;
        }
        input[type=checkbox]{
            cursor: pointer;
            position: relative;
            width: 15px;
            height: 15px;
            font-size: 14px;
        }
        input[type=checkbox]::after{
            position: absolute;
            top: 0;
            border: none;
            /* background-color: #ff670c; */
            color: #fff;
            width: 15px;
            height: 15px;
            display: inline-block;
            visibility: visible;
            padding-left: 0px;
            text-align: center;
            content: ' ';
            border-radius: 1px
        }
        input[type=checkbox]:checked::after{
            background-color: #ff670c;
            border-color: #ff670c;
            content: "✓";
            font-size: 12px;
            font-weight: bold;
        }

        xmp {
            display: inline;
            font-size:17px
        }
    </style>
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
                    <h3 class="page-title">我的考试详情</h3>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.jsp">我的考试</a></li>
                        <li class="breadcrumb-item active">我的考试详情</li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- /Page Header -->

        <div class="row">
            <div class="col-sm-12">

                <div class="card card-table">
                    <div class="card-body">
                        <div id="time"></div>
                        <div id="scoreDiv"></div>
                        <form>
                            <h4>一. &nbsp;单选题 <span>（每题${paper.score_sin}分）</span></h4><br>
                            <c:set var="index" value="0"></c:set>
                            <c:forEach items="${myExamRes}" varStatus="i" var="q1">
                                <c:if test="${q1.question_type=='x'}">
                                    <p class="title"><xmp>${index = index + 1}. ${q1.question_name}</xmp>（） &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>正确答案：${q1.question_opright}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;本题得分：<c:if
                                            test="${q1.question_opright == q1.my_op}"><span>${paper.score_sin}分</span></c:if><c:if
                                            test="${q1.question_opright != q1.my_op}"><span
                                            style="color:red">0分</span></c:if></span></p>
                                    <c:if test="${q1.my_op == 'A'}">
                                        <input type="radio" checked name="ques${index}" disabled
                                               value="A,${q1.question_id}"><span
                                            class="sin_ques">A. <xmp>${q1.question_opa}</xmp></span><br>
                                        <input type="radio" name="ques${index}" disabled value="B,${q1.question_id}"><span
                                            class="sin_ques">B. <xmp>${q1.question_opb}</xmp></span><br>
                                        <input type="radio" name="ques${index}" disabled value="C,${q1.question_id}"><span
                                            class="sin_ques">C. <xmp>${q1.question_opc}</xmp></span><br>
                                        <input type="radio" name="ques${index}" disabled value="D,${q1.question_id}"><span
                                            class="sin_ques">D. <xmp>${q1.question_opd}</xmp></span><br><br>
                                    </c:if>
                                    <c:if test="${q1.my_op == 'B'}">
                                        <input type="radio"  name="ques${index}" disabled
                                               value="A,${q1.question_id}"><span
                                            class="sin_ques">A. <xmp>${q1.question_opa}</xmp></span><br>
                                        <input type="radio" checked name="ques${index}" disabled value="B,${q1.question_id}"><span
                                            class="sin_ques">B. <xmp>${q1.question_opb}</xmp></span><br>
                                        <input type="radio" name="ques${index}" disabled value="C,${q1.question_id}"><span
                                            class="sin_ques">C. <xmp>${q1.question_opc}</xmp></span><br>
                                        <input type="radio" name="ques${index}" disabled value="D,${q1.question_id}"><span
                                            class="sin_ques">D. <xmp>${q1.question_opd}</xmp></span><br><br>
                                    </c:if>
                                    <c:if test="${q1.my_op == 'C'}">
                                        <input type="radio"  name="ques${index}" disabled
                                               value="A,${q1.question_id}"><span
                                            class="sin_ques">A. <xmp>${q1.question_opa}</xmp></span><br>
                                        <input type="radio" name="ques${index}" disabled value="B,${q1.question_id}"><span
                                            class="sin_ques">B. <xmp>${q1.question_opb}</xmp></span><br>
                                        <input type="radio" checked name="ques${index}" disabled value="C,${q1.question_id}"><span
                                            class="sin_ques">C. <xmp>${q1.question_opc}</xmp></span><br>
                                        <input type="radio" name="ques${index}" disabled value="D,${q1.question_id}"><span
                                            class="sin_ques">D. <xmp>${q1.question_opd}</xmp></span><br><br>
                                    </c:if>
                                    <c:if test="${q1.my_op == 'D'}">
                                        <input type="radio"  name="ques${index}" disabled
                                               value="A,${q1.question_id}"><span
                                            class="sin_ques">A. <xmp>${q1.question_opa}</xmp></span><br>
                                        <input type="radio" name="ques${index}" disabled value="B,${q1.question_id}"><span
                                            class="sin_ques">B. <xmp>${q1.question_opb}</xmp></span><br>
                                        <input type="radio" name="ques${index}" disabled value="C,${q1.question_id}"><span
                                            class="sin_ques">C. <xmp>${q1.question_opc}</xmp></span><br>
                                        <input type="radio" checked name="ques${index}" disabled value="D,${q1.question_id}"><span
                                            class="sin_ques">D. <xmp>${q1.question_opd}</xmp></span><br><br>
                                    </c:if>
                                    <c:if test="${q1.my_op == null}">
                                        <input type="radio" name="ques${index}" disabled
                                               value="A,${q1.question_id}"><span
                                            class="sin_ques">A. <xmp>${q1.question_opa}</xmp></span><br>
                                        <input type="radio" name="ques${index}" disabled value="B,${q1.question_id}"><span
                                            class="sin_ques">B. <xmp>${q1.question_opb}</xmp></span><br>
                                        <input type="radio" name="ques${index}" disabled value="C,${q1.question_id}"><span
                                            class="sin_ques">C. <xmp>${q1.question_opc}</xmp></span><br>
                                        <input type="radio" name="ques${index}" disabled value="D,${q1.question_id}"><span
                                            class="sin_ques">D. <xmp>${q1.question_opd}</xmp></span><br><br>
                                    </c:if>

                                </c:if>
                            </c:forEach>
                            <h4 style="margin-top: 10px">二. &nbsp;多选题 <span>（每题${paper.score_che}分）</span></h4><br>
                            <c:forEach items="${myExamRes}" varStatus="i" var="q2">
                                <c:if test="${q2.question_type=='y'}">
                                    <p class="title"><xmp>${index = index + 1}. ${q2.question_name}</xmp>（） &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>正确答案：${q2.question_opright}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;本题得分：<c:if
                                            test="${q2.question_opright == q2.my_op}">${paper.score_che}分</c:if><c:if
                                            test="${q2.question_opright != q2.my_op}"><span
                                            style="color:red">0分</span></c:if></span>
                                    </p>
                                    <c:if test="${q2.my_op == 'ABCD'}">
                                        <input type="checkbox" checked name="ques${index}" disabled
                                               value="A,${q2.question_id}"><span
                                            class="sin_ques">A. <xmp>${q2.question_opa}</xmp></span><br>
                                        <input type="checkbox" checked name="ques${index}" disabled
                                               value="B,${q2.question_id}"><span
                                            class="sin_ques">B. <xmp>${q2.question_opb}</xmp></span><br>
                                        <input type="checkbox" checked name="ques${index}" disabled
                                               value="C,${q2.question_id}"><span
                                            class="sin_ques">C. <xmp>${q2.question_opc}</xmp></span><br>
                                        <input type="checkbox" checked name="ques${index}" disabled
                                               value="D,${q2.question_id}"><span
                                            class="sin_ques">D. <xmp>${q2.question_opd}</xmp></span><br><br>
                                    </c:if>
                                    <c:if test="${q2.my_op == 'ABC'}">
                                        <input type="checkbox" checked name="ques${index}" disabled
                                               value="A,${q2.question_id}"><span
                                            class="sin_ques">A. <xmp>${q2.question_opa}</xmp></span><br>
                                        <input type="checkbox" checked name="ques${index}" disabled
                                               value="B,${q2.question_id}"><span
                                            class="sin_ques">B. <xmp>${q2.question_opb}</xmp></span><br>
                                        <input type="checkbox" checked name="ques${index}" disabled
                                               value="C,${q2.question_id}"><span
                                            class="sin_ques">C. <xmp>${q2.question_opc}</xmp></span><br>
                                        <input type="checkbox" name="ques${index}" disabled value="D,${q2.question_id}"><span
                                            class="sin_ques">D. <xmp>${q2.question_opd}</xmp></span><br><br>
                                    </c:if>
                                    <c:if test="${q2.my_op == 'ACD'}">
                                        <input type="checkbox" checked name="ques${index}" disabled
                                               value="A,${q2.question_id}"><span
                                            class="sin_ques">A. <xmp>${q2.question_opa}</xmp></span><br>
                                        <input type="checkbox"  name="ques${index}" disabled
                                               value="B,${q2.question_id}"><span
                                            class="sin_ques">B. <xmp>${q2.question_opb}</xmp></span><br>
                                        <input type="checkbox" checked name="ques${index}" disabled
                                               value="C,${q2.question_id}"><span
                                            class="sin_ques">C. <xmp>${q2.question_opc}</xmp></span><br>
                                        <input type="checkbox" checked name="ques${index}" disabled value="D,${q2.question_id}"><span
                                            class="sin_ques">D. <xmp>${q2.question_opd}</xmp></span><br><br>
                                    </c:if>
                                    <c:if test="${q2.my_op == 'AB'}">
                                        <input type="checkbox" checked name="ques${index}" disabled
                                               value="A,${q2.question_id}"><span
                                            class="sin_ques">A. <xmp>${q2.question_opa}</xmp></span><br>
                                        <input type="checkbox" checked name="ques${index}" disabled
                                               value="B,${q2.question_id}"><span
                                            class="sin_ques">B. <xmp>${q2.question_opb}</xmp></span><br>
                                        <input type="checkbox" name="ques${index}" disabled value="C,${q2.question_id}"><span
                                            class="sin_ques">C. <xmp>${q2.question_opc}</xmp></span><br>
                                        <input type="checkbox" name="ques${index}" disabled value="D,${q2.question_id}"><span
                                            class="sin_ques">D. <xmp>${q2.question_opd}</xmp></span><br><br>
                                    </c:if>
                                    <c:if test="${q2.my_op == 'AD'}">
                                        <input type="checkbox" checked name="ques${index}" disabled
                                               value="A,${q2.question_id}"><span
                                            class="sin_ques">A. <xmp>${q2.question_opa}</xmp></span><br>
                                        <input type="checkbox" name="ques${index}" disabled value="B,${q2.question_id}"><span
                                            class="sin_ques">B. <xmp>${q2.question_opb}</xmp></span><br>
                                        <input type="checkbox" name="ques${index}" disabled value="C,${q2.question_id}"><span
                                            class="sin_ques">C. <xmp>${q2.question_opc}</xmp></span><br>
                                        <input type="checkbox" checked name="ques${index}" disabled
                                               value="D,${q2.question_id}"><span
                                            class="sin_ques">D. <xmp>${q2.question_opd}</xmp></span><br><br>
                                    </c:if>
                                    <c:if test="${q2.my_op == 'BD'}">
                                        <input type="checkbox" name="ques${index}" disabled value="A,${q2.question_id}"><span
                                            class="sin_ques">A. <xmp>${q2.question_opa}</xmp></span><br>
                                        <input type="checkbox" checked name="ques${index}" disabled
                                               value="B,${q2.question_id}"><span
                                            class="sin_ques">B. <xmp>${q2.question_opb}</xmp></span><br>
                                        <input type="checkbox" name="ques${index}" disabled value="C,${q2.question_id}"><span
                                            class="sin_ques">C. <xmp>${q2.question_opc}</xmp></span><br>
                                        <input type="checkbox" checked name="ques${index}" disabled
                                               value="D,${q2.question_id}"><span
                                            class="sin_ques">D. <xmp>${q2.question_opd}</xmp></span><br><br>
                                    </c:if>
                                    <c:if test="${q2.my_op == 'AC'}">
                                        <input type="checkbox" checked name="ques${index}" disabled
                                               value="A,${q2.question_id}"><span
                                            class="sin_ques">A. <xmp>${q2.question_opa}</xmp></span><br>
                                        <input type="checkbox" name="ques${index}" disabled value="B,${q2.question_id}"><span
                                            class="sin_ques">B. <xmp>${q2.question_opb}</xmp></span><br>
                                        <input type="checkbox" checked name="ques${index}" disabled
                                               value="C,${q2.question_id}"><span
                                            class="sin_ques">C. <xmp>${q2.question_opc}</xmp></span><br>
                                        <input type="checkbox" name="ques${index}" disabled value="D,${q2.question_id}"><span
                                            class="sin_ques">D. <xmp>${q2.question_opd}</xmp></span><br><br>
                                    </c:if>
                                    <c:if test="${q2.my_op == 'BCD'}">
                                        <input type="checkbox" name="ques${index}" disabled value="A,${q2.question_id}"><span
                                            class="sin_ques">A. <xmp>${q2.question_opa}</xmp></span><br>
                                        <input type="checkbox" checked name="ques${index}" disabled
                                               value="B,${q2.question_id}"><span
                                            class="sin_ques">B. <xmp>${q2.question_opb}</xmp></span><br>
                                        <input type="checkbox" checked name="ques${index}" disabled
                                               value="C,${q2.question_id}"><span
                                            class="sin_ques">C. <xmp>${q2.question_opc}</xmp></span><br>
                                        <input type="checkbox" checked name="ques${index}" disabled
                                               value="D,${q2.question_id}"><span
                                            class="sin_ques">D. <xmp>${q2.question_opd}</xmp></span><br><br>
                                    </c:if>
                                    <c:if test="${q2.my_op == 'A'}">
                                        <input type="checkbox" checked name="ques${index}" disabled
                                               value="A,${q2.question_id}"><span
                                            class="sin_ques">A. <xmp>${q2.question_opa}</xmp></span><br>
                                        <input type="checkbox" name="ques${index}" disabled value="B,${q2.question_id}"><span
                                            class="sin_ques">B. <xmp>${q2.question_opb}</xmp></span><br>
                                        <input type="checkbox" name="ques${index}" disabled value="C,${q2.question_id}"><span
                                            class="sin_ques">C. <xmp>${q2.question_opc}</xmp></span><br>
                                        <input type="checkbox" name="ques${index}" disabled value="D,${q2.question_id}"><span
                                            class="sin_ques">D. <xmp>${q2.question_opd}</xmp></span><br><br>
                                    </c:if>
                                    <c:if test="${q2.my_op == 'B'}">
                                        <input type="checkbox" name="ques${index}" disabled value="A,${q2.question_id}"><span
                                            class="sin_ques">A. <xmp>${q2.question_opa}</xmp></span><br>
                                        <input type="checkbox" checked name="ques${index}" disabled
                                               value="B,${q2.question_id}"><span
                                            class="sin_ques">B. <xmp>${q2.question_opb}</xmp></span><br>
                                        <input type="checkbox" name="ques${index}" disabled value="C,${q2.question_id}"><span
                                            class="sin_ques">C. <xmp>${q2.question_opc}</xmp></span><br>
                                        <input type="checkbox" name="ques${index}" disabled value="D,${q2.question_id}"><span
                                            class="sin_ques">D. <xmp>${q2.question_opd}</xmp></span><br><br>
                                    </c:if>

                                    <c:if test="${q2.my_op == 'C'}">
                                        <input type="checkbox" name="ques${index}" disabled value="A,${q2.question_id}"><span
                                            class="sin_ques">A. <xmp>${q2.question_opa}</xmp></span><br>
                                        <input type="checkbox" name="ques${index}" disabled value="B,${q2.question_id}"><span
                                            class="sin_ques">B. <xmp>${q2.question_opb}</xmp></span><br>
                                        <input type="checkbox" checked name="ques${index}" disabled
                                               value="C,${q2.question_id}"><span
                                            class="sin_ques">C. <xmp>${q2.question_opc}</xmp></span><br>
                                        <input type="checkbox" name="ques${index}" disabled value="D,${q2.question_id}"><span
                                            class="sin_ques">D. <xmp>${q2.question_opd}</xmp></span><br><br>
                                    </c:if>

                                    <c:if test="${q2.my_op == 'D'}">
                                        <input type="checkbox" name="ques${index}" disabled value="A,${q2.question_id}"><span
                                            class="sin_ques">A. <xmp>${q2.question_opa}</xmp></span><br>
                                        <input type="checkbox" name="ques${index}" disabled value="B,${q2.question_id}"><span
                                            class="sin_ques">B. <xmp>${q2.question_opb}</xmp></span><br>
                                        <input type="checkbox" name="ques${index}" disabled value="C,${q2.question_id}"><span
                                            class="sin_ques">C. <xmp>${q2.question_opc}</xmp></span><br>
                                        <input type="checkbox" checked name="ques${index}" disabled
                                               value="D,${q2.question_id}"><span
                                            class="sin_ques">D. <xmp>${q2.question_opd}</xmp></span><br><br>
                                    </c:if>

                                    <c:if test="${q2.my_op == 'ABD'}">
                                        <input type="checkbox" checked name="ques${index}" disabled
                                               value="A,${q2.question_id}"><span
                                            class="sin_ques">A. <xmp>${q2.question_opa}</xmp></span><br>
                                        <input type="checkbox" checked name="ques${index}" disabled
                                               value="B,${q2.question_id}"><span
                                            class="sin_ques">B. <xmp>${q2.question_opb}</xmp></span><br>
                                        <input type="checkbox" name="ques${index}" disabled value="C,${q2.question_id}"><span
                                            class="sin_ques">C. <xmp>${q2.question_opc}</xmp></span><br>
                                        <input type="checkbox" checked name="ques${index}" disabled
                                               value="D,${q2.question_id}"><span
                                            class="sin_ques">D. <xmp>${q2.question_opd}</xmp></span><br><br>
                                    </c:if>

                                    <c:if test="${q2.my_op == 'BC'}">
                                        <input type="checkbox" name="ques${index}" disabled value="A,${q2.question_id}"><span
                                            class="sin_ques">A. <xmp>${q2.question_opa}</xmp></span><br>
                                        <input type="checkbox" checked name="ques${index}" disabled
                                               value="B,${q2.question_id}"><span
                                            class="sin_ques">B. <xmp>${q2.question_opb}</xmp></span><br>
                                        <input type="checkbox" checked name="ques${index}" disabled
                                               value="C,${q2.question_id}"><span
                                            class="sin_ques">C. <xmp>${q2.question_opc}</xmp></span><br>
                                        <input type="checkbox" name="ques${index}" disabled value="D,${q2.question_id}"><span
                                            class="sin_ques">D. <xmp>${q2.question_opd}</xmp></span><br><br>
                                    </c:if>

                                    <c:if test="${q2.my_op == 'CD'}">
                                        <input type="checkbox" name="ques${index}" disabled value="A,${q2.question_id}"><span
                                            class="sin_ques">A. <xmp>${q2.question_opa}</xmp></span><br>
                                        <input type="checkbox" name="ques${index}" disabled value="B,${q2.question_id}"><span
                                            class="sin_ques">B. <xmp>${q2.question_opb}</xmp></span><br>
                                        <input type="checkbox" checked name="ques${index}" disabled
                                               value="C,${q2.question_id}"><span
                                            class="sin_ques">C. <xmp>${q2.question_opc}</xmp></span><br>
                                        <input type="checkbox" checked name="ques${index}" disabled
                                               value="D,${q2.question_id}"><span
                                            class="sin_ques">D. <xmp>${q2.question_opd}</xmp></span><br><br>
                                    </c:if>

                                    <c:if test="${q2.my_op == null}">
                                        <input type="checkbox" name="ques${index}" disabled value="A,${q2.question_id}"><span
                                            class="sin_ques">A. <xmp>${q2.question_opa}</xmp></span><br>
                                        <input type="checkbox" name="ques${index}" disabled value="B,${q2.question_id}"><span
                                            class="sin_ques">B. <xmp>${q2.question_opb}</xmp></span><br>
                                        <input type="checkbox" name="ques${index}" disabled value="C,${q2.question_id}"><span
                                            class="sin_ques">C. <xmp>${q2.question_opc}</xmp></span><br>
                                        <input type="checkbox" name="ques${index}" disabled value="D,${q2.question_id}"><span
                                            class="sin_ques">D. <xmp>${q2.question_opd}</xmp></span><br><br>
                                    </c:if>

                                </c:if>
                            </c:forEach>
                            <h4>三. &nbsp;判断题 <span>（每题${paper.score_jug}分）</span></h4><br>
                            <c:forEach items="${myExamRes}" varStatus="i" var="q3">
                                <c:if test="${q3.question_type=='z'}">
                                    <p class="title"><xmp>${index = index + 1}. ${q3.question_name}</xmp>（） &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>正确答案：${q3.question_opright}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;本题得分：<c:if
                                            test="${q3.question_opright == q3.my_op}">${paper.score_jug}分</c:if><c:if
                                            test="${q3.question_opright != q3.my_op}"><span
                                            style="color:red">0分</span></c:if></span>
                                    </p>
                                    <c:if test="${q3.my_op == 'T'}">
                                        <input type="radio" checked name="ques${index}" disabled
                                               value="T,${q3.question_id}"><span
                                            class="sin_ques">A. <xmp>${q3.question_opa}</xmp></span><br>
                                        <input type="radio" name="ques${index}" disabled value="F,${q3.question_id}"><span
                                            class="sin_ques">B. <xmp>${q3.question_opb}</xmp></span><br><br>
                                    </c:if>
                                    <c:if test="${q3.my_op == 'F'}">
                                        <input type="radio" name="ques${index}" disabled value="T,${q3.question_id}"><span
                                            class="sin_ques">A. <xmp>${q3.question_opa}</xmp></span><br>
                                        <input type="radio" checked name="ques${index}" disabled
                                               value="F,${q3.question_id}"><span
                                            class="sin_ques">B. <xmp>${q3.question_opb}</xmp></span><br><br>
                                    </c:if>
                                    <c:if test="${q3.my_op == null}">
                                        <input type="radio" name="ques${index}" disabled value="T,${q3.question_id}"><span
                                            class="sin_ques">A. <xmp>${q3.question_opa}</xmp></span><br>
                                        <input type="radio" name="ques${index}" disabled value="F,${q3.question_id}"><span
                                            class="sin_ques">B. <xmp>${q3.question_opb}</xmp></span><br><br>
                                    </c:if>
                                </c:if>
                            </c:forEach>

                            <div class="col-12" style="margin-top: 10px">
                                <button type="button"
                                        onclick="location.href='${pageContext.request.contextPath}/scoreServlet?action=findMyExamsRecord&userId=${USER.user_id}'"
                                        class="btn btn-primary">返回
                                </button>
                            </div>
                        </form>

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