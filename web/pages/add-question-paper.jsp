<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="vip.grmz.onlineexam.entity.Course" %>
<%@ page import="vip.grmz.onlineexam.service.CourseService" %>
<%@ page import="vip.grmz.onlineexam.service.impl.CourseServiceImpl" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>Preskool - Subject</title>
		
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
								<h3 class="page-title">自动生成</h3>
								<ul class="breadcrumb">
									<li class="breadcrumb-item"><a href="questions.jsp">试题管理</a></li>
									<li class="breadcrumb-item active">自动生成</li>
								</ul>
							</div>
						</div>
					</div>
					<!-- /Page Header -->

					<%
						CourseService service = new CourseServiceImpl();
						List<Course> courses = service.findCourses();
						request.setAttribute("courses",courses);

						String paperId = request.getParameter("paperId");
						request.setAttribute("paperId", paperId);
					%>

					<div class="row">
						<div class="col-sm-12">
						
							<div class="card">
								<div class="card-body">
									<form method="post" action="${pageContext.request.contextPath}/paperServlet">
										<input type="hidden" name="action" value="randomAddQuestionToPaper">
										<input type="hidden" name="paperId" value="${paperId}">
										<div class="row">
											<div class="col-12">
												<h5 class="form-title"><span>自动生成试卷信息(默认单选1道，多选1道，判断1道)</span></h5>
											</div>

											<div class="col-12 col-sm-6" id="selectDiv">
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

											<script>
												$(function () {
													$("select[class='form-control']").blur(function () {

														$.post("${pageContext.request.contextPath}/questionServlet",{"action":"findQuesNumByCourseId","courseId":$(this).val()},
															function (data) {
																$("#selectDiv").nextAll().remove()
																var html = "<div class='col-12 col-sm-6'>"+
																			"<div class='form-group'>"+
																			"<label>单选数量</label>"+
																				"<input type='text' name='sinNum' placeholder='最大数量不能超过"+data.sinNum+"' class='form-control'>"+
																		"</div>"+
																		"</div>"+
																		"<div class='col-12 col-sm-6'>"+
																		"<div class='form-group'>"+
																		"<label>多选数量</label>"+
																		"<input type='text' name='cheNum' placeholder='最大数量不能超过"+data.cheNum +"' class='form-control'>"+
																		"</div>"+
																		"</div>"+
																		"<div class='col-12 col-sm-6'>"+
																		"<div class='form-group'>"+
																		"<label>判断数量</label>"+
																		"<input type='text' name='jugNum' placeholder='最大数量不能超过"+data.jugNum+"' class='form-control'>"+
																		"</div>"+
																		"</div>"+
																		"<div class='col-12'>"+
																"<button type='submit' class='btn btn-primary'>生成</button>"+
																"<span style='color:red'>${msg}</span>"+ "</div>"
																$("#selectDiv").after(html);

																$("input[name='jugNum']").blur(function (){
																	if($(this).val() > data.jugNum || $(this).val() < 1 ){
																		$(this).prev().find("span").remove();
																		$(this).prev().append("<span style='color:red'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数量超过限制<span>")
																		$("button[type='submit']").attr("type","button");
																	}else {
																		$(this).prev().find("span").remove();
																		$("button[type='button']").attr("type","submit");
																	}
																})
																$("input[name='sinNum']").blur(function (){
																	if($(this).val() > data.sinNum || $(this).val() < 1 ){
																		$(this).prev().find("span").remove();
																		$(this).prev().append("<span style='color:red'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数量超过限制<span>")
																		$("button[type='submit']").attr("type","button");
																	}else {
																		$(this).prev().find("span").remove();
																		$("button[type='button']").attr("type","submit");
																	}
																})
																$("input[name='cheNum']").blur(function (){
																	if($(this).val() > data.cheNum || $(this).val() < 1 ){
																		$(this).prev().find("span").remove();
																		$(this).prev().append("<span style='color:red'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数量超过限制<span>")
																		$("button[type='submit']").attr("type","button");
																	}else {
																		$(this).prev().find("span").remove();
																		$("button[type='button']").attr("type","submit");
																	}

																})
															},"json")
														// alert()
													})
												})
											</script>

											<div class="col-12 col-sm-6">
												<div class="form-group">
													<label>单选数量</label>
													<input type="text" name="sinNum" class="form-control">
												</div>
											</div>
											<div class="col-12 col-sm-6">
												<div class="form-group">
													<label>多选数量</label>
													<div>
														<input type="text" name="cheNum" class="form-control">
													</div>
												</div>
											</div>

											<div class="col-12 col-sm-6">
												<div class="form-group">
													<label>判断数量</label>
													<div>
														<input type="text" name="jugNum" class="form-control">
													</div>
												</div>
											</div>

											<div class="col-12">
												<button type="submit" class="btn btn-primary">生成</button>
												<span style="color:red">${msg}</span>
											</div>
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