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
        xmp{
            display: inline;
            font-size:17px;
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

                <div class="card card-table">
                    <div class="card-body">
                        <div id="time"></div>
                        <div id="scoreDiv"></div>
                        <form>
                            <h4>一. &nbsp;单选题 <span>（每题${paper.score_sin}分）</span></h4><br>
                            <c:set var="index" value="0"></c:set>
                            <c:forEach items="${questions}" varStatus="i" var="q1">
                                <c:if test="${q1.question_type=='x'}">
                                    <p class="title"><xmp>${index = index + 1}. ${q1.question_name}</xmp></p>
                                    <input type="radio" name="ques${index}" value="A,${q1.question_id}"><span
                                        class="sin_ques">A. <xmp>${q1.question_opa}</xmp></span><br>
                                    <input type="radio" name="ques${index}" value="B,${q1.question_id}"><span
                                        class="sin_ques">B. <xmp>${q1.question_opb}</xmp></span><br>
                                    <input type="radio" name="ques${index}" value="C,${q1.question_id}"><span
                                        class="sin_ques">C. <xmp>${q1.question_opc}</xmp></span><br>
                                    <input type="radio" name="ques${index}" value="D,${q1.question_id}"><span
                                        class="sin_ques">D. <xmp>${q1.question_opd}</xmp></span><br><br>
                                </c:if>
                            </c:forEach>
                            <h4 >二. &nbsp;多选题 <span>（每题${paper.score_che}分）</span></h4><br>
                            <c:forEach items="${questions}" varStatus="i" var="q2">
                                <c:if test="${q2.question_type=='y'}">
                                    <p class="title"><xmp>${index = index + 1}. ${q2.question_name}</xmp></p>
                                    <input type="checkbox" name="ques${index}" value="A,${q2.question_id}"><span
                                        class="sin_ques">A. <xmp>${q2.question_opa}</xmp></span><br>
                                    <input type="checkbox" name="ques${index}" value="B,${q2.question_id}"><span
                                        class="sin_ques">B. <xmp>${q2.question_opb}</xmp></span><br>
                                    <input type="checkbox" name="ques${index}" value="C,${q2.question_id}"><span
                                        class="sin_ques">C. <xmp>${q2.question_opc}</xmp></span><br>
                                    <input type="checkbox" name="ques${index}" value="D,${q2.question_id}"><span
                                        class="sin_ques">D. <xmp>${q2.question_opd}</xmp></span><br><br>

                                </c:if>
                            </c:forEach>
                            <h4>三. &nbsp;判断题 <span>（每题${paper.score_jug}分）</span></h4><br>
                            <c:forEach items="${questions}" varStatus="i" var="q3">
                                <c:if test="${q3.question_type=='z'}">
                                    <p class="title"><xmp>${index = index + 1}. ${q3.question_name}</xmp></p>
                                    <input type="radio" name="ques${index}" value="T,${q3.question_id}"><span
                                        class="sin_ques">A. <xmp>${q3.question_opa}</xmp></span><br>
                                    <input type="radio" name="ques${index}" value="F,${q3.question_id}"><span
                                        class="sin_ques">B. <xmp>${q3.question_opb}</xmp></span><br><br>
                                </c:if>
                            </c:forEach>
                            <input type="hidden" name="index" value="${index}">
                            <input type="hidden" name="userid" value="${USER.user_id}">
                            <input type="hidden" name="action" value="checkQuesExamIsTrue">
                            <input type="hidden" name="paperId" value="${paper.paper_id}">
                            <input type="hidden" name="examId" value="${exam.exam_id}">

                            <div class="col-12" style="margin-top: 10px">
                                <button type="button" onclick="submitExam()" class="btn btn-primary">提交</button>
                                <span id="span01" style="color:red">${msg}</span>
                            </div>
                        </form>
                        <script type="text/javascript">
                            var date = new Date("${exam.exam_end}")
                            var now = new Date();
                            if (date.getTime() - now.getTime() < 0){
                                alert("考试时间已过");
                                window.location.href="${pageContext.request.contextPath}/examServlet?action=findMyExams&userId=${USER.user_id}";
                            }
                            //时间倒计时
                            var lastHour = Math.floor((date.getTime() - now.getTime()) / 1000 / 60 / 60);       //小时
                            var lastMinute = Math.floor((((date.getTime() - now.getTime()) / 1000 / 60) - lastHour * 60));    //分钟
                            var lastSecond = Math.floor(((date.getTime() - now.getTime()) / 1000) - (lastHour * 60 * 60 + lastMinute * 60));     //秒
                            // var lastHour =0;       //小时
                            // var lastMinute = 0;    //分钟
                            // var lastSecond = 10;     //秒
                            var lastInterval = setInterval(function () {
                                if (lastSecond > 0) {
                                    lastSecond -= 1;
                                } else if (lastMinute > 0) {
                                    lastMinute -= 1;
                                    lastSecond = 59;
                                } else if (lastHour > 0) {
                                    lastHour -= 1;
                                    lastMinute = 59;
                                    lastSecond = 59;
                                }
                                if (lastHour == 0 && lastMinute == 0 && lastSecond == 0) {
                                    clearInterval(lastInterval);
                                    var data = $("form").serialize() + "&autoSubmit=true"
                                    $.ajax({
                                        type: "post",
                                        url: "${pageContext.request.contextPath}/examServlet",
                                        data: data,
                                        dataType: "json",
                                        success: function (msg) {
                                            if (msg.result) {
                                            } else {
                                                $("#span01").text("")
                                                alert("提交成功，您的分数为：" + msg.score + "; 总分:" + msg.countScore)

                                                $("#scoreDiv").append("<span style='color:red'>您的考试得分为：" + msg.score + "分</span>")

                                                $("button[type='button']").text("查看正确答案").removeAttr("onclick")
                                                $("button[type='button']").click(function () {
                                                    window.location.href = "${pageContext.request.contextPath}/examServlet?action=findMyExamResult&userId=${USER.user_id}&examId=${exam.exam_id}&paperId=${paper.paper_id}";
                                                })
                                                $("#time").html("")

                                            }
                                        }, error: function () {
                                            alert("失败")
                                        }
                                    })
                                } else {
                                    var tmp = '将于 ';
                                    if (lastHour > 0) {
                                        tmp += lastHour + ' 小时 ';
                                    }
                                    if (lastHour >= 0 || lastMinute > 0) {
                                        tmp += (lastMinute > 9 ? '' : '0') + lastMinute + ' 分 ';
                                    }
                                    tmp += (lastSecond > 9 ? '' : '0') + lastSecond + ' 秒后自动提交';
                                    if ($('#time').attr("class") != 'success'){
                                        $('#time').html(tmp);
                                    }
                                }
                            }, 1000);
                        </script>

                        <script>

                            function submitExam() {

                                var data = $("form").serialize()
                                // alert(data)
                                // alert(fromValue)
                                $.ajax({
                                    type: "post",
                                    url: "${pageContext.request.contextPath}/examServlet",
                                    data: data,
                                    dataType: "json",
                                    success: function (msg) {
                                        if (msg.result) {
                                            $("#span01").text("有问题未回答，请检查试卷")
                                        } else {
                                            $("#span01").text("")

                                            alert("提交成功，您的分数为：" + msg.score + "; 总分:" + msg.countScore)

                                            $('#time').attr("class","success")
                                            $('#time').html("")
                                            $("#scoreDiv").append("<span style='color:red'>您的考试得分为：" + msg.score + "分</span>")

                                            $("button[type='button']").text("查看正确答案").removeAttr("onclick")
                                            $("button[type='button']").click(function () {
                                                window.location.href = "${pageContext.request.contextPath}/examServlet?action=findMyExamResult&userId=${USER.user_id}&examId=${exam.exam_id}&paperId=${paper.paper_id}";
                                            })

                                        }
                                    }, error: function () {
                                        alert("失败")
                                    }
                                })
                            }


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