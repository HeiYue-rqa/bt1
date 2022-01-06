<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="/WEB-INF/common/taglib.jsp" %>
        <c:url var="APIurl" value="/api-admin-comment" />
        <c:url var="cmtURL" value="/admin-comment" />
        <!DOCTYPE html>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Chỉnh sửa bài viết</title>
        </head>

        <body>
            <div class="main-content ml-menu">
                <div class="main-content-inner">
                    <div class="breadcrumbs" id="breadcrumbs">
                        <script type="text/javascript">
                            try { ace.settings.check('breadcrumbs', 'fixed') } catch (e) { }
                        </script>
                        <ul class="breadcrumb">
                            <li>
                                <i class="ace-icon fa fa-home home-icon"></i>
                                <a href="/admin-home">Trang chủ</a>
                            </li>
                            <li>
                                <a href="/admin-comment?type=list">Danh sách câu hỏi</a>
                            </li>
                            <li class="active">Chỉnh sửa câu trả lời</li>
                        </ul><!-- /.breadcrumb -->
                    </div>
                    <div class="page-content">
                        <div class="row">
                            <div class="col-xs-12">
                                <c:if test="${not empty messageResponse}">
                                    <div class="alert alert-${alert}">
                                        ${messageResponse}
                                    </div>
                                </c:if>
                                <form id="formSubmit">
                                    <div class="mb-3">
                                        <label for="question" class="control-label no-padding-right">Câu hỏi</label>
                                        <textarea class="form-control" rows="6" cols="" id="question" form="formSubmit"
                                            name="question" readonly>${model.question}</textarea>
                                    </div>
                                    <div class="mb-3">
                                        <label for="answer" class="control-label no-padding-right">Trả lời</label>
                                        <textarea class="form-control" rows="6" cols="" id="answer" form="formSubmit"
                                            name="answer">${model.answer}</textarea>
                                    </div>
                                    <div class="mb-3">
                                        <c:if test="${not empty model.id}">
                                            <input type="button" class="btn btn-white btn-warning btn-bold"
                                                value="Trả lời" id="btnUpdate" />
                                        </c:if>
                                    </div>
                                    <input type="hidden" value="${model.id}" id="id" name="id" />
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.main-content -->
            <script>

                $('#btnUpdate').click(function () {
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
                               window.location.href = "${cmtURL}?type=list&message=error_system";
                           }
                   	};
                   	if ($('#id').val()) {
                   	    params.type = 'PUT';
                   	    params.success = function (result) {
                               window.location.href = "${cmtURL}?type=edit&id="
                                   + result.id + "&message=update_success";
                           };
                   	}
                   	$.ajax(params);
                });
                
                
            </script>
        </body>

        </html>