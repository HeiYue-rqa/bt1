<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<nav class="navbar navbar-expand-lg navbar-dark fixed-top" style="background-color: var(--primary-color);">
	<div class="container-fluid">
		<a class="navbar-brand" href="#">Quầy thuốc TAAP</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav ms-auto">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="index.jsp">Trang chủ</a></li>
				<li class="nav-item"><a class="nav-link"
					href="/trang-new?type=benhly">Bệnh lý</a></li>
				<li class="nav-item"><a class="nav-link"
					href="/trang-comment">Tư vấn</a></li>
				<li class="nav-item"><a class="nav-link" href="/trang-chu?home=about">Giới
						thiệu</a></li>
				<c:if test="${not empty USERMODEL }">
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle"
						href="#" id="navbarDropdown" role="button"
						data-bs-toggle="dropdown" aria-expanded="false">
							${USERMODEL.fullName}</a>
						<ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDropdown">
							<li><a href="/admin-home" class="nav-link">Trang Admin</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a href='<c:url value = "/thoat?action=logout" />'
								class="nav-link">Thoát ?</a></li>
						</ul>
					</li>
				</c:if>
				<c:if test="${ empty USERMODEL }">
					<li class="nav-item"><a
						href='<c:url value = "/dang-nhap?action=login" />'
						class="nav-link">Đăng nhập</a></li>
				</c:if>
			</ul>
		</div>
	</div>
</nav>