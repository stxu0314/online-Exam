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

		<!-- Datatables CSS -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/static/plugins/datatables/datatables.min.css">
		
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
								<h3 class="page-title">学生列表</h3>
								<ul class="breadcrumb">
									<li class="breadcrumb-item"><a href="index.jsp">仪表板</a></li>
									<li class="breadcrumb-item active">学生列表</li>
								</ul>
							</div>
							<div class="col-auto text-right float-right ml-auto">
								<a href="#" class="btn btn-outline-primary mr-2"><i class="fas fa-download"></i> 下载</a>
								<a href="${pageContext.request.contextPath}/pages/add-student.jsp" class="btn btn-primary"><i class="fas fa-plus"></i> 添加学生</a>
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
													<th>ID</th>
													<th>用户名</th>
													<th>姓名</th>
													<th>性别</th>
													<th>年龄</th>
													<th>班级</th>
													<th>邮箱</th>
													<th>手机号码</th>
													<th>地址</th>
													<th class="text-right">操作</th>
												</tr>
											</thead>
											<tbody>
											<c:forEach items="${users}" var="user">
												<c:if test="${user.part == 0}">
													<tr>
														<td>${user.user_id}</td>
														<td>
															<h2 class="table-avatar">
																<a href="${pageContext.request.contextPath}/userServlet?action=findUserDetailById&userid=${user.user_id}" class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="${pageContext.request.contextPath}/static/img/profiles/avatar-01.jpg" alt="User Image"></a>
																<a href="${pageContext.request.contextPath}/userServlet?action=findUserDetailById&userid=${user.user_id}">${user.username}</a>
															</h2>
														</td>
														<td >${user.name}</td>
														<c:if test="${user.gender==1}">
															<td>男</td>
														</c:if>
														<c:if test="${user.gender==0}">
															<td>女</td>
														</c:if>

														<td>${user.age}</td>
														<c:if test="${user.class_id == null}">
															<td>未选择班级</td>
														</c:if>
														<c:if test="${user.class_id != null}">
															<td>${user.class_name}</td>
														</c:if>

														<td>${user.email}</td>
														<td>${user.phone}</td>
														<td>${user.address}</td>
														<td class="text-right">
															<div class="actions">
																<a href="${pageContext.request.contextPath}/userServlet?action=findUserById&userid=${user.user_id}" class="btn btn-sm bg-success-light mr-2">
																	<i class="fas fa-pen"></i>
																</a>
																<a href="javascript:;" onclick="deleteUser('${user.name}',${user.user_id})" class="btn btn-sm bg-danger-light">
																	<i class="fas fa-trash"></i>
																</a>
															</div>
														</td>
													</tr>
												</c:if>
											</c:forEach>

											</tbody>
										</table>
										<script src="${pageContext.request.contextPath}/static/js/jquery-3.5.1.min.js"></script>
										<script>
											function deleteUser(name,userid){
												if (confirm("是否要删除学生" + name + "?")) {
													$.post("${pageContext.request.contextPath}/userServlet",{"action":"deleteUserById","userid":userid}
															,function (data) {
																if (data.result){
																	alert("删除成功！")
																	window.location.href="${pageContext.request.contextPath}/userServlet?action=findUsers&part=0"
																}
															},"json")
												}else {
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