<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Trang Admin</title>
</head>

<body>
	<div class="main-content ml-menu">
		<div class="main-content-inner">
			<div class="breadcrumbs ace-save-state" id="breadcrumbs">
				<ul class="breadcrumb">
					<li><i class="ace-icon fa fa-home home-icon"></i> <a href="#">Trang
							chủ</a></li>
				</ul>
				<!-- /.breadcrumb -->
			</div>
			<div class="page-content">
			<h1>Chào mừng đến với Trang Admin</h1>
				<div class="row">
					<div class="col-lg-4">
						<div class="card mt-4 text-center">
							<div class="card-header fw-bold">Tổng số bài viết</div>
							<div class="card-body">${ncount}</div>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="card mt-4 text-center">
							<div class="card-header fw-bold">Tổng số câu hỏi</div>
							<div class="card-body">${ccount}</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /.main-content -->

</body>

</html>