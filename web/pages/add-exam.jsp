<%@ page import="vip.grmz.onlineexam.service.PaperService" %>
<%@ page import="vip.grmz.onlineexam.service.impl.PaperServiceImpl" %>
<%@ page import="vip.grmz.onlineexam.service.ClazzService" %>
<%@ page import="vip.grmz.onlineexam.service.impl.ClazzServiceImpl" %>
<%@ page import="vip.grmz.onlineexam.entity.Clazz" %>
<%@ page import="java.util.List" %>
<%@ page import="vip.grmz.onlineexam.entity.Paper" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>Preskool - Salary</title>
		
		<!-- Favicon -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/img/favicon.png">
	
		<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,500;0,600;0,700;1,400&display=swap">
		
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
        <div class="main-wrapper">

			<!-- Header -->
			<%@include file="/pages/common/header.jsp"%>
			<!-- /Header -->

			<!-- Sidebar -->
			<%@include file="/pages/common/sidebar.jsp"%>
			<!-- /Sidebar -->


			<!-- Page Wrapper -->
            <div class="page-wrapper">
                <div class="content container-fluid">
				
					<!-- Page Header -->
					<div class="page-header">
						<div class="row align-items-center">
							<div class="col">
								<h3 class="page-title">添加考试</h3>
								<ul class="breadcrumb">
									<li class="breadcrumb-item"><a href="salary.html">考试</a></li>
									<li class="breadcrumb-item active">添加考试</li>
								</ul>
							</div>
						</div>
					</div>
					<!-- /Page Header -->

					<%
						PaperService service = new PaperServiceImpl();
						List<Paper> papers = service.findPapers();
						request.setAttribute("papers",papers);

						ClazzService clazzService = new ClazzServiceImpl();
						List<Clazz> classes = clazzService.findClasses();
						request.setAttribute("classes",classes);
					%>
					<div class="row">
						<div class="col-sm-12">
						
							<div class="card">
								<div class="card-body">
									<form id="form01" method="post" action="${pageContext.request.contextPath}/examServlet">
										<input type="hidden" name="action" value="addExam">
										<div class="row">
											<div class="col-12">
												<h5 class="form-title"><span>考试信息</span></h5>
											</div>
											<div class="col-12 col-sm-6">  
												<div class="form-group">
													<label>试卷 &nbsp; &nbsp; &nbsp;<span></span></label>
													<select class="form-control" name="paper_id">
														<option>选择试卷</option>
														<c:forEach items="${requestScope.papers}" var="p">
															<option value="${p.paper_id}">${p.paper_name}</option>
														</c:forEach>
													</select>
												</div>
											</div>
											<div class="col-12 col-sm-6">
												<div class="form-group">
													<label>班级 &nbsp; &nbsp; &nbsp;<span></span></label>
													<select class="form-control" name="class_id">
														<option>选择班级</option>
														<c:forEach items="${requestScope.classes}" var="clazz">
															<option value="${clazz.class_id}">${clazz.class_name}</option>
														</c:forEach>
													</select>
												</div>
											</div>

											<div class="col-12 col-sm-6">
												<div class="form-group">
													<label>开始时间 &nbsp; &nbsp; &nbsp;<span></span></label>
													<input type="datetime-local" name="exam_begin" class="form-control">
												</div>
											</div>
											<div class="col-12 col-sm-6">
												<div class="form-group">
													<label>结束时间 &nbsp; &nbsp; &nbsp;<span></span></label>
													<input type="datetime-local" name="exam_end" class="form-control">
												</div>
											</div>
											<input type="hidden" name="token" value="${sessionScope.token}">
											<div class="col-12">
												<button type="submit" class="btn btn-primary" >添加</button>
											</div>
										</div>
									</form>

									<script>

										$(function () {

											$("input[type='datetime-local']:eq(0)").blur(function () {
												if (Date.parse($(this).val()) < Date.parse(new Date())) {
													$(this).prev().find("span").css("color","red").text("时间不能小于当前时间")
												}else {
													$(this).prev().find("span").css("color","red").text("")
													$("input[type='datetime-local']:eq(1)").blur(function () {
														//alert($(this).val())
														if (Date.parse($("input[type='datetime-local']:eq(0)").val())+30*60*1000 > Date.parse( $(this).val())) {
															$(this).prev().find("span").css("color","red").text("考试时间不能小于30分钟")
														}else {
															$(this).prev().find("span").css("color","red").text("")
														}
													})
												}
											})

											$("#form01").submit(function () {

												if($("select[name='paper_id']").val() === "选择试卷" || $("select[name='paper_id']").val() == ""){
													$("select[name='paper_id']").prev().find("span").css("color","red").text("试卷不能为空")
													return false
												}else {
													$("select[name='paper_id']").prev().find("span").css("color","red").text("")
												}
												if($("select[name='class_id']").val() === "选择班级" || $("select[name='class_id']").val() == ""){
													$("select[name='class_id']").prev().find("span").css("color","red").text("班级不能为空")
													return false
												}else {
													$("select[name='class_id']").prev().find("span").css("color","red").text("")
												}

												if($("input[type='datetime-local']:eq(0)").val() === null || $("input[type='datetime-local']:eq(0)").val() == ""){
													$("input[type='datetime-local']:eq(0)").prev().find("span").css("color","red").text("时间不能为空")
													return false
												}
												if($("input[type='datetime-local']:eq(1)").val() === null || $("input[type='datetime-local']:eq(1)").val() == ""){
													$("input[type='datetime-local']:eq(1)").prev().find("span").css("color","red").text("时间不能为空")
													return false
												}
												if (Date.parse($("input[type='datetime-local']:eq(0)").val())+30*60*1000 > Date.parse($("input[type='datetime-local']:eq(1)").val())) {
													$("input[type='datetime-local']:eq(1)").prev().find("span").css("color","red").text("考试时间不能小于30分钟")
													return  false
												}
												if (Date.parse($("input[type='datetime-local']:eq(0)").val()) < Date.parse(new Date())) {
													$("input[type='datetime-local']:eq(0)").prev().find("span").css("color","red").text("时间不能小于当前时间")
													return  false;
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