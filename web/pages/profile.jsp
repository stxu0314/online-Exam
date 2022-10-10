<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>Preskool - Profile</title>
		
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

			<c:if test="${USER.part == 1}">
				<!-- Sidebar -->
				<%@include file="/pages/common/sidebar.jsp"%>
				<!-- /Sidebar -->
			</c:if>

			<c:if test="${USER.part == 0}">
				<!-- Sidebar -->
				<%@include file="/pages/common/sidebar-stu.jsp"%>
				<!-- /Sidebar -->
			</c:if>



			<!-- Page Wrapper -->
            <div class="page-wrapper">
                <div class="content container-fluid">
					
					<!-- Page Header -->
					<div class="page-header">
						<div class="row">
							<div class="col">
								<h3 class="page-title">个人中心</h3>
								<ul class="breadcrumb">
									<li class="breadcrumb-item"><a href="index.jsp">仪表板</a></li>
									<li class="breadcrumb-item active">个人中心</li>
								</ul>
							</div>
						</div>
					</div>
					<!-- /Page Header -->
					
					<div class="row">
						<div class="col-md-12">
							<div class="profile-header">
								<div class="row align-items-center">
									<div class="col-auto profile-image">
										<a href="#">
											<c:if test="${file == null}">
											<img class="rounded-circle" alt="User Image" src="${USER.img}">
											</c:if>
											<c:if test="${file != null}">
											<img class="rounded-circle" alt="User Image" src="${file}">
											</c:if>
										</a>
									</div>
									<div class="col ml-md-n2 profile-user-info">
										<h4 class="user-name mb-0">${USER.name}</h4>
										<div class="user-Location"><i class="fas fa-map-marker-alt"></i>${USER.address}</div>
									</div>
									<div class="col-auto profile-btn">
										<form method="post" action="${pageContext.request.contextPath}/userServlet?action=uploadHeadImg&userId=${USER.user_id}"  enctype="multipart/form-data" >
											<input type="file" name="file" class="btn btn-primary">
											<button type="submit" class="btn btn-primary">上传头像</button>
										</form>
									</div>
								</div>
							</div>
							<div class="profile-menu">
								<ul class="nav nav-tabs nav-tabs-solid">
									<li class="nav-item">
										<a class="nav-link active" data-toggle="tab" href="#per_details_tab">基本信息</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" data-toggle="tab" href="#password_tab">密码</a>
									</li>
								</ul>
							</div>	
							<div class="tab-content profile-tab-cont">
								
								<!-- Personal Details Tab -->
								<div class="tab-pane fade show active" id="per_details_tab">
								
									<!-- Personal Details -->
									<div class="row">
										<div class="col-lg-9">
											<div class="card">
												<div class="card-body">
													<h5 class="card-title d-flex justify-content-between">
														<span>个人信息</span>
														<a class="edit-link" data-toggle="modal" href="#edit_personal_details"><i class="far fa-edit mr-1"></i>编辑</a>
													</h5>
													<div class="row">
														<p class="col-sm-3 text-muted text-sm-right mb-0 mb-sm-3">姓名</p>
														<p class="col-sm-9">${USER.name}</p>
													</div>
													<div class="row">
														<p class="col-sm-3 text-muted text-sm-right mb-0 mb-sm-3">年龄</p>
														<p class="col-sm-9">${USER.age}</p>
													</div>
													<div class="row">
														<p class="col-sm-3 text-muted text-sm-right mb-0 mb-sm-3">邮箱</p>
														<p class="col-sm-9">${USER.email}</p>
													</div>
													<div class="row">
														<p class="col-sm-3 text-muted text-sm-right mb-0 mb-sm-3">电话号码</p>
														<p class="col-sm-9">${USER.phone}</p>
													</div>
													<div class="row">
														<p class="col-sm-3 text-muted text-sm-right mb-0">地址</p>
														<p class="col-sm-9 mb-0">${USER.address}</p>

													</div>
												</div>
											</div>
											
										</div>

										<div class="col-lg-3">
											
											<!-- Account Status -->
											<div class="card">
												<div class="card-body">
													<h5 class="card-title d-flex justify-content-between">
														<span>Account Status</span>
														<a class="edit-link" href="#"><i class="far fa-edit mr-1"></i> Edit</a>
													</h5>
													<button class="btn btn-success" type="button"><i class="fe fe-check-verified"></i> Active</button>
												</div>
											</div>
											<!-- /Account Status -->

											<!-- Skills -->
											<div class="card">
												<div class="card-body">
													<h5 class="card-title d-flex justify-content-between">
														<span>Skills </span> 
														<a class="edit-link" href="#"><i class="far fa-edit mr-1"></i> Edit</a>
													</h5>
													<div class="skill-tags">
														<span>Html5</span>
														<span>CSS3</span>
														<span>WordPress</span>
														<span>Javascript</span>
														<span>Android</span>
														<span>iOS</span>
														<span>Angular</span>
														<span>PHP</span>
													</div>
												</div>
											</div>
											<!-- /Skills -->

										</div>
									</div>
									<!-- /Personal Details -->

								</div>
								<!-- /Personal Details Tab -->
								
								<!-- Change Password Tab -->
								<div id="password_tab" class="tab-pane fade">
								
									<div class="card">
										<div class="card-body">
											<h5 class="card-title">修改密码</h5>
											<div class="row">
												<div class="col-md-10 col-lg-6">
													<form id="from01" method="post" action="${pageContext.request.contextPath}/userServlet">
														<input type="hidden" name="action" value="updatePassword">
														<input type="hidden" name="userId" value="${USER.user_id}">
														<div class="form-group">
															<label>旧密码</label>
															<input type="password" name="oldPassword" class="form-control">
														</div>
														<div class="form-group">
															<label>新密码</label>
															<input type="password" name="password" class="form-control">
														</div>
														<div class="form-group">
															<label>确认密码</label>
															<input type="password" name="repassword" class="form-control">
														</div>
														<button class="btn btn-primary" type="submit">保存</button>
													</form>
													<script>
														$("#from01").submit(function(){
															if ($("input[name='password']").val() != $("input[name='repassword']").val()){
																alert("密码和确认密码不一致")
																return false;
															}
														})
														$(function () {
															if ("${msg}" != ""){
																alert("旧密码错误")
															}
															var res = "${result}";
															if (res != null && res != ""){
																if (res){
																	if (confirm("修改成功，跳转到登录")){
																		window.location.href="${pageContext.request.contextPath}/userServlet?action=logout";
																	}
																}
															}
														})
													</script>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- /Change Password Tab -->
								
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
		<script  src="${pageContext.request.contextPath}/static/js/script.js"></script>
		
    </body>
</html>