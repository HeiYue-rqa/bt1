<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<!-- Side widgets-->
<div class="col-lg-4">
	<!-- Search widget-->
	<div class="card mb-4">
		<div class="card-header">Tìm tiêu đề bài viết</div>
		<div class="card-body">
			<form action="/trang-new" method="post">
			<div class="input-group">
				<input class="form-control" type="text" placeholder="Enter search term..."
					aria-label="Enter search term..." aria-describedby="button-search" name="search" />
				<input type="hidden" value="search" name="action" />
				<button class="btn btn-primary" id="button-search" type="submit" name="btnGo">Go!</button>
			</div>
			</form>
		</div>
	</div>
	<!-- Categories widget-->
	<div class="card mb-4">
		<div class="card-header">Danh mục bài viết</div>
		<div class="card-body">
		<form action="/trang-new" method="get" name="formFind">
			<div class="list-group">
				<input type="hidden" name="submitFind" />
				<input type="hidden" value="find" name="action" />
				<c:forEach var="item" items="${categories}">
					<button class="list-group-item" value="${item.id}" type="submit" style="text-align: left;"
					onclick="{document.formFind.submitFind.value=this.value;document.formFind.submit();}">${item.name}</button>
				</c:forEach>
			</div>
		</form>
		</div>
	</div>
	<!-- Side widget-->
	<div class="card mb-4">
		<div class="card-header">Sức khỏe</div>
		<div class="card-body">Giữ tâm trạng thoải mái và đừng quên rằng "Một nụ cười bằng mười thang thuốc bổ"</div>
	</div>
</div>