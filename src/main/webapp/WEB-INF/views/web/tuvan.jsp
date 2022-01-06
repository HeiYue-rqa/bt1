<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="/WEB-INF/common/taglib.jsp" %>
        <c:url var="APIurl" value="/api-admin-comment" />
        <c:url var="cmtURL" value="/trang-comment" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tư vấn</title>
</head>
<body>

		<!-- Comments section-->
		<section class="col-lg-8 mb-5">
			<c:if test="${not empty messageResponse}">
                <div class="alert alert-${alert}">
                    ${messageResponse}
                </div>
            </c:if>
			<div class="card bg-light mb-4">
				<div class="card-body">
					<!-- Comment form-->
					<form id="formSubmit">
						<div class="mb-3">
                            <label for="createdBy" class="control-label no-padding-right">Tên của bạn</label>
                            <input type="text" class="form-control" id="createdBy" name="createdBy"
                                value="${model.createdBy}" required />
                        </div>
                        <div class="mb-3">
                            <label for="question" class="control-label no-padding-right">Câu hỏi</label>
                            <textarea class="form-control" rows="6" cols="" id="question" form="formSubmit"
                                name="question" required >${model.question}</textarea>
                        </div>
                        <div class="mb-3">
                            <c:if test="${empty model.id}">
                                <input type="button" class="btn btn-white btn-primary btn-bold"
                                    value="Gửi" id="btnAdd" />
                            </c:if>
                        </div>
                        <input type="hidden" value="${model.id}" id="id" name="id" />
                        <input type="hidden" value="edit" name="type" />
                    </form>
                </div>
            </div>
		<div class="card bg-light">
			<div class="card-body">
				<!-- Comment with nested comments-->
				<c:forEach var="item" items="${list }">
					<div class="d-flex mt-4">
						<!-- Parent comment-->
						<div class="ms-3">
							<div><span class="fw-bold">${item.createdBy} </span>
							#${item.id }</div>
							<p class="card-text">${item.question}</p>
							<!-- Child comment 1-->
							<c:if test="${not empty item.answer }">
								<div class="d-flex mt-4">
									<div class="flex-shrink-0"></div>
									<div class="ms-3">
										<div><span class="fw-bold">${item.modifiedBy} </span>
										#${item.id }</div>
										<p class="card-text">${item.answer}</p>
									</div>
								</div>
							</c:if>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
		<script>

                $('#btnAdd').click(function () {
                    var data = {};
                    var formData = $('#formSubmit').serializeArray();
                    $.each(formData, function (i, v) {
                        data["" + v.name + ""] = v.value;
                    });
                    var id = $('#id').val();
                    var params = {
                   		url: '${APIurl}',
                        contentType: 'application/json',
                        data: JSON.stringify(data),
                        dataType: 'json',
                        error: function (error) {
                            window.location.href = "${cmtURL}?type=edit&message=error_system";
                        }
                   	};
                   	if ($('#createdBy').val() === "" || $('#question').val() === "") {
                   	} else {
                   	    params.type = 'POST';
                   	    params.success = function (result) {
                               window.location.href = "${cmtURL}?type=edit&id="
                                   + result.id + "&message=comment_success";
                           };
                   	}
                   	$.ajax(params);
                    
                });

               	$(document).ajaxComplete(function() {
               		window.setTimeout(function(){
                        window.location.href = "${cmtURL}";
                    }, 5000);
               	});
                
            </script>
</body>
</html>