<%@ page import="java.util.List" %>
<%@ page import="vip.grmz.onlineexam.service.ClazzService" %>
<%@ page import="vip.grmz.onlineexam.service.impl.ClazzServiceImpl" %>
<%@ page import="vip.grmz.onlineexam.entity.Clazz" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>Preskool - Students</title>
		
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
								<h3 class="page-title">添加学生</h3>
								<ul class="breadcrumb">
									<li class="breadcrumb-item"><a href="students.jsp">学生</a></li>
									<li class="breadcrumb-item active">添加学生</li>
								</ul>
							</div>
						</div>
					</div>
					<!-- /Page Header -->

					<%
						ClazzService service = new ClazzServiceImpl();
						List<Clazz> classes = service.findClasses();
						request.setAttribute("classes",classes);
					%>

					<div class="row">
						<div class="col-sm-12">
							<div class="card">
								<div class="card-body">
									<form method="post" action="${pageContext.request.contextPath}/userServlet">
										<input type="hidden" name="action" value="addUser">
										<input type="hidden" name="part" value="0">
										<div class="row">

											<div class="col-12">
												<h5 class="form-title"><span>学生信息</span></h5>
											</div>

											<div class="col-12 col-sm-6">  
												<div class="form-group">
													<label>用户名</label>
													<input type="text" name="username" class="form-control">
												</div>
											</div>
											<div class="col-12 col-sm-6">
												<div class="form-group">
													<label>姓名</label>
													<input type="text" name="name" class="form-control">
												</div>
											</div>
											<div class="col-12 col-sm-6">
												<div class="form-group">
													<label>性别</label>
													<select class="form-control" name="gender">
														<option>选择性别</option>
														<option value="1">男</option>
														<option value="0">女</option>
													  </select>
												</div>
											</div>
											<div class="col-12 col-sm-6">
												<div class="form-group">
													<label>年龄</label>
													<div>
														<input type="text" name="age" class="form-control">
													</div>
												</div>
											</div>
											<div class="col-12 col-sm-6">
												<div class="form-group">
													<label>班级</label>
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
													<label>手机号码</label>
													<input type="text" name="phone" class="form-control">
												</div>
											</div>
											<div class="col-12 col-sm-6">
												<div class="form-group">
													<label>密码</label>
													<div>
														<input type="text" name="password" class="form-control">
													</div>
												</div>
											</div>
											<div class="col-12 col-sm-6">
												<div class="form-group">
													<label>邮箱</label>
													<input type="email" name="email" class="form-control">
												</div>
											</div>
											<div class="col-12 col-sm-6">
												<div class="form-group">
													<label>地址</label>
													<input type="text" name="address" class="form-control">
												</div>
											</div>
											<div class="col-12">
												<button type="submit" class="btn btn-primary">添加</button>
												<span style="color:red">${uMsg0}</span>
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