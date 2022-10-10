<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>Preskool - Expenses</title>
		
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
								<h3 class="page-title">修改试卷</h3>
								<ul class="breadcrumb">
									<li class="breadcrumb-item"><a href="">试卷</a></li>
									<li class="breadcrumb-item active">修改试卷</li>
								</ul>
							</div>
						</div>
					</div>
					<!-- /Page Header -->
				
					<div class="row">
						<div class="col-sm-12">
						
							<div class="card">
								<div class="card-body">
									<form method="post" action="${pageContext.request.contextPath}/paperServlet">
										<input type="hidden" name="paper_id" value="${paper.paper_id}">
										<input type="hidden" name="action" value="updatePaper">
										<div class="row">
											<div class="col-12">
												<h5 class="form-title"><span>试卷信息</span></h5>
											</div>
											<div class="col-12 col-sm-6">  
												<div class="form-group">
													<label>试卷名</label>
													<input type="text"  name="paper_name" value="${paper.paper_name}" class="form-control">
												</div>
											</div>
											<div class="col-12 col-sm-6">
												<div class="form-group">
													<label>单选分数</label>
													<input type="text" name="score_sin" value="${paper.score_sin}" class="form-control">
												</div>
											</div>
											<div class="col-12 col-sm-6">
												<div class="form-group">
													<label>多选分数</label>
													<input type="text" name="score_che" value="${paper.score_che}" class="form-control">
												</div>
											</div>
											<div class="col-12 col-sm-6">
												<div class="form-group">
													<label>判断分数</label>
													<input type="text" name="score_jug" value="${paper.score_jug}" class="form-control">
												</div>
											</div>
											<div class="col-12">
												<button type="submit" class="btn btn-primary">修改</button>
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