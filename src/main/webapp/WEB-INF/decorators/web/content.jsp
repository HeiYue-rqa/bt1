<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="/WEB-INF/common/taglib.jsp" %>

<% request.setAttribute("action", request.getParameter("home")); %>
<c:choose>
	<c:when test="${action eq 'tuvan' }">
		<!-- Page header with logo and tagline-->
		<header class="py-5 bg-light border-bottom mb-4">
			<div class="container">
				<div class="text-center my-5">
					<h1 class="fw-bolder">Hỏi - đáp</h1>
					<p class="lead mb-0">Chúng tôi luôn cố gắng tìm ra câu trả lời cho những thắc mắc của bạn</p>
				</div>
			</div>
		</header>
		<!-- Page content-->
		<div class="container mt-5 pt-5">
			<div class="row">
				<jsp:include page="/WEB-INF/views/web/tuvan.jsp" />
				<jsp:include page="/WEB-INF/common/web/menu.jsp" />
			</div>
		</div>
	</c:when>
	<c:when test="${action eq 'blog' }">
		<!-- Page content-->
		<div class="container mt-5 pt-5">
			<div class="row">
				<jsp:include page="/WEB-INF/views/web/blog.jsp" />
				<jsp:include page="/WEB-INF/common/web/menu.jsp" />
			</div>
		</div>
	</c:when>
	<c:when test="${action eq 'benhly' }">
		<!-- Page header with logo and tagline-->
		<header class="py-5 bg-light border-bottom mb-4">
			<div class="container">
				<div class="text-center my-5">
					<h1 class="fw-bolder">Những bệnh lý thường gặp</h1>
					<p class="lead mb-0">Thông tin được trình bày chi tiết trong phần bài viết</p>
				</div>
			</div>
		</header>
		<!-- Page content-->
		<div class="container">
			<div class="row">
				<jsp:include page="/WEB-INF/views/web/benhly.jsp" />
				<jsp:include page="/WEB-INF/common/web/menu.jsp" />
			</div>
		</div>
	</c:when>
	<c:when test="${action eq 'notfound' }">
		<!-- Page header with logo and tagline-->
		<header class="py-5 bg-light border-bottom mb-4">
			<div class="container">
				<div class="text-center my-5">
					<h1 class="fw-bolder">Không tìm thấy bài viết</h1>
					<p class="lead mb-0">Rất tiếc! Bài viết bạn tìm không tồn tại.</p>
				</div>
			</div>
		</header>
		<!-- Page content-->
		<div class="container">
			<div class="row">
				<jsp:include page="/WEB-INF/views/web/notfound.jsp" />
				<jsp:include page="/WEB-INF/common/web/menu.jsp" />
			</div>
		</div>
	</c:when>
	<c:when test="${action eq 'about' }">
		<header class="py-5 bg-light border-bottom mb-4">
			<div class="container">
				<div class="text-center my-5">
					<h1 class="fw-bolder">Welcome to Blog Home!</h1>
					<p class="lead mb-0">A Bootstrap 5 starter layout for your next
						blog homepage</p>
				</div>
			</div>
		</header>
		<!-- Page content-->
		<div class="container">
			<div class="row">
				<jsp:include page="/WEB-INF/views/web/about.jsp" />
			</div>
		</div>
	</c:when>
	<c:otherwise>
		<!-- Page header with logo and tagline-->
		<header class="py-5 bg-light border-bottom mb-4">
			<div class="container">
				<div class="text-center my-5">
					<h1 class="fw-bolder">Welcome to Blog Home!</h1>
					<p class="lead mb-0">A Bootstrap 5 starter layout for your next
						blog homepage</p>
				</div>
			</div>
		</header>
		<!-- Page content-->
		<div class="container">
			<div class="row">
				<jsp:include page="/WEB-INF/views/web/home.jsp" />
			</div>
		</div>
	</c:otherwise>
</c:choose>

