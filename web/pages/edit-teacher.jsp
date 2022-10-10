<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="vip.grmz.onlineexam.service.ClazzService" %>
<%@ page import="vip.grmz.onlineexam.service.impl.ClazzServiceImpl" %>
<%@ page import="vip.grmz.onlineexam.entity.Clazz" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>Preskool - Teachers</title>
		
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
								<h3 class="page-title">Edit Teachers</h3>
								<ul class="breadcrumb">
									<li class="breadcrumb-item"><a href="teachers.jsp">Teachers</a></li>
									<li class="breadcrumb-item active">Edit Teachers</li>
								</ul>
							</div>
						</div>
					</div>
					<!-- /Page Header -->

					<%
						ClazzService service = new ClazzServiceImpl();
						List<Clazz> classes = service.findClasses();
						request.setAttribute("classes", classes);
					%>
					<div class="row">
						<div class="col-sm-12">
						
							<div class="card">
								<div class="card-body">
									<form method="post" action="${pageContext.request.contextPath}/userServlet">
										<input type="hidden" name="userid" value="${user.user_id}">
										<input type="hidden" name="action" value="updateUser">
										<input type="hidden" name="part" value="1">
										<div class="row">
											<div class="col-12">
												<h5 class="form-title"><span>老师信息</span></h5>
											</div>

											<div class="col-12 col-sm-6">
												<div class="form-group">
													<label>用户名</label>
													<input type="text" name="username" disabled="disabled"
														   value="${user.username}" class="form-control">
												</div>
											</div>
											<div class="col-12 col-sm-6">
												<div class="form-group">
													<label>姓名</label>
													<input type="text" name="name" value="${user.name}" class="form-control">
												</div>
											</div>

											<div class="col-12 col-sm-6">
												<div class="form-group">
													<label>性别</label>
													<select class="form-control" name="gender">
														<c:choose>
															<c:when test="${user.gender == 0}">
																<option>选择性别</option>
																<option value="1">男</option>
																<option value="0" selected>女</option>
															</c:when>
															<c:when test="${user.gender == 1}">
																<option>选择性别</option>
																<option value="1" selected>男</option>
																<option value="0">女</option>
															</c:when>
															<c:otherwise>
																<option selected>选择性别</option>
																<option value="1">男</option>
																<option value="0">女</option>
															</c:otherwise>
														</c:choose>
													</select>
												</div>
											</div>
											<div class="col-12 col-sm-6">
												<div class="form-group">
													<label>年龄</label>
													<div>
														<input type="text" name="age" value="${user.age}" class="form-control">
													</div>
												</div>
											</div>
											<div class="col-12 col-sm-6">
												<div class="form-group">
													<label>管理班级</label>
													<select class="form-control" name="class_id">
														<option>选择班级</option>
														<c:forEach items="${requestScope.classes}" var="clazz">
															<c:choose>
																<c:when test="${user.class_id == clazz.class_id}">
																	<option value="${clazz.class_id}"
																			selected="selected">${clazz.class_name}</option>
																</c:when>
																<c:otherwise>
																	<option value="${clazz.class_id}">${clazz.class_name}</option>
																</c:otherwise>
															</c:choose>
														</c:forEach>
													</select>
												</div>
											</div>
											<div class="col-12 col-sm-6">
												<div class="form-group">
													<label>手机号码</label>
													<input type="text" name="phone" value="${user.phone}" class="form-control">
												</div>
											</div>
											<div class="col-12 col-sm-6">
												<div class="form-group">
													<label>密码</label>
													<div>
														<input type="text" name="password" value="${user.password}"
															   class="form-control">
													</div>
												</div>
											</div>
											<div class="col-12 col-sm-6">
												<div class="form-group">
													<label>邮箱</label>
													<input type="email" name="email" value="${user.email}" class="form-control">
												</div>
											</div>
											<div class="col-12 col-sm-6">
												<div class="form-group">
													<label>地址</label>
													<input type="text" name="address" value="${user.address}"
														   class="form-control">
												</div>
											</div>
											<div class="col-12">
												<button type="submit" class="btn btn-primary">修改</button>
												<span style="color:red"></span>
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