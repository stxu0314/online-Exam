<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>Preskool - Student Details</title>
		
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
				
					<div class="page-header">
						<div class="row">
							<div class="col-sm-12">
								<h3 class="page-title">学生详情</h3>
								<ul class="breadcrumb">
									<li class="breadcrumb-item"><a href="students.jsp">学生</a></li>
									<li class="breadcrumb-item active">学生详情</li>
								</ul>
							</div>
						</div>
					</div>
					
					<div class="card">
						<div class="card-body">
							<div class="row">
								<div class="col-md-12">
									<div class="about-info">
										<h4>学生信息</h4>
										
										<div class="media mt-3">
											<img src="${pageContext.request.contextPath}/static/img/user.jpg" class="mr-3" alt="${pageContext.request.contextPath}.">
											<div class="media-body">
												<ul>
                                                    <li>
                                                        <span class="title-span">用户名 : </span>
                                                        <span class="info-span">${user.username}</span>
                                                    </li>
                                                    <li>
                                                        <span class="title-span">姓名 : </span>
                                                        <span class="info-span">${user.name}</span>
                                                    </li>
                                                    <li>
                                                        <span class="title-span">电话号码 : </span>
                                                        <span class="info-span">${user.phone}</span>
                                                    </li>
                                                    <li>
                                                        <span class="title-span">邮箱 : </span>
                                                        <span class="info-span">${user.email}</span>
                                                    </li>
                                                    <li>
                                                        <span class="title-span">性别 : </span>
														<c:if test="${user.gender==1}">
															<span class="info-span">男</span>
														</c:if>
														<c:if test="${user.gender==0}">
															<span class="info-span">女</span>
														</c:if>

                                                    </li>
                                                    <li>
                                                        <span class="title-span">年龄 : </span>
                                                        <span class="info-span">${user.age} 岁</span>
                                                    </li>
                                                </ul>
											</div>
										</div>

										<div class="row mt-3">
											<div class="col-md-12">
												<p>Hello I am Daisy Parks. Lorem Ipsum is simply dummy text of the printing and typesetting industry, simply dummy text of the printing and typesetting industry.</p>
											</div>                                            
										</div>
										
										<div class="row follow-sec">
                                            <div class="col-md-4 mb-3">
                                                <div class="blue-box">
                                                    <h3>2850</h3>
                                                    <p>最高成绩</p>
                                                </div>
                                            </div>
                                            <div class="col-md-4 mb-3">
                                                <div class="blue-box">
                                                    <h3>2050</h3>
                                                    <p>平均成绩</p>
                                                </div>
                                            </div>
                                            <div class="col-md-4 mb-3">
                                                <div class="blue-box">
                                                    <h3>2950</h3>
                                                    <p>最低成绩</p>
                                                </div>
                                            </div>
										</div>
										
										<div class="row mt-2">
											<div class="col-md-12">
												<h5>地址</h5>
												<p>中软国际教育有限公司</p>
											</div>                                            
                                        </div>

									</div>
								</div>								
							</div>

							<div class="row mt-2">
								<div class="col-md-12">
									<div class="skill-info">
										<h4>知识掌握情况</h4>
										<p>以下数据通过考试成绩计算所得：</p>
										
										<ul>
                                            <li>
                                                <label>java基础掌握情况</label>
                                                <div class="progress">
                                                    <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 100%"></div>
                                                </div>
                                            </li>

                                            <li>
                                                <label>数据库相关掌握情况</label>
                                                <div class="progress">
                                                    <div class="progress-bar progress-bar-striped progress-bar-animated bg-success" role="progressbar" aria-valuenow="69" aria-valuemin="0" aria-valuemax="100" style="width: 69%"></div>
                                                </div>
                                            </li>

                                            <li>
                                                <label>框架相关掌握情况</label>
                                                <div class="progress">
                                                    <div class="progress-bar progress-bar-striped progress-bar-animated bg-info" role="progressbar" aria-valuenow="86" aria-valuemin="0" aria-valuemax="100" style="width: 86%"></div>
                                                </div>
                                            </li>

                                            <li>
                                                <label>jvm相关掌握情况</label>
                                                <div class="progress">
                                                    <div class="progress-bar progress-bar-striped progress-bar-animated bg-warning" role="progressbar" aria-valuenow="65" aria-valuemin="0" aria-valuemax="100" style="width: 65%"></div>
                                                </div>
                                            </li>                                            
										</ul>
										
										<div class="row mt-3">
											<div class="col-md-12">
												<h5>教育经历</h5>
												<p class="mt-3">xxx小学</p>
												<p>xxx中学</p>
												<p>xxx高中</p>
												<p>xxx大学</p>
											</div>                                            
										</div>
										
										<div class="row mt-3">
											<div class="col-md-12">
												<h5>技能特长</h5>
												<p class="mt-3">学习能力强；</p>
												<p>表达能力强；</p>
												<p>英语六级；</p>
												<p>基础扎实。</p>
											</div>                                            
                                        </div>
									</div>
								</div>
							</div>

							<div class="row mt-2">
								<div class="col-md-12">
									<div class="skill-info">
										<h4>修改密码</h4>

										<form>
											<div class="row mt-3">
												<div class="col-12 col-sm-6">  
													<div class="form-group">
														<label>用户名</label>
														<input type="text" class="form-control">
													</div>
												</div>
												<div class="col-12 col-sm-6">  
													<div class="form-group">
														<label>旧密码</label>
														<input type="password" class="form-control">
													</div>
												</div>
												<div class="col-12 col-sm-6">  
													<div class="form-group">
														<label>新密码</label>
														<input type="password" class="form-control">
													</div>
												</div>
												<div class="col-12">
													<button type="submit" class="btn btn-primary">修改</button>
												</div>
											</div>
										</form>
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
		
		<!-- Custom JS -->
		<script  src="${pageContext.request.contextPath}/static/js/script.js"></script>
		
    </body>
</html>