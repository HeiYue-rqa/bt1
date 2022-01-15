<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="/WEB-INF/common/taglib.jsp" %>
        <c:url var="APIurl" value="/api-admin-new" />
        <c:url var="NewURL" value="/admin-new" />
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
                                <a href="/admin-new?type=list">Danh sách bài viết</a>
                            </li>
                            <li class="active">Chỉnh sửa bài viết</li>
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
                                        <label for="categoryCode" class="control-label no-padding-right">Thể
                                            loại</label>
                                        <select class="form-select" id="categoryCode" name="categoryCode">
                                            <c:if test="${empty model.categoryCode}">
                                                <option value="">Chọn loại bài viết</option>
                                                <c:forEach var="item" items="${categories}">
                                                    <option value="${item.code}">${item.name}</option>
                                                </c:forEach>
                                            </c:if>
                                            <c:if test="${not empty model.categoryCode}">
                                                <option value="">Chọn loại bài viết</option>
                                                <c:forEach var="item" items="${categories}">
                                                    <option value="${item.code}" <c:if
                                                        test="${item.code == model.categoryCode}">
                                                        selected="selected"
                                            </c:if>>
                                            ${item.name}
                                            </option>
                                            </c:forEach>
                                            </c:if>
                                        </select>
                                    </div>
                                    <div class="mb-3">
                                        <label for="title" class="control-label no-padding-right">Tiêu đề</label>
                                        <input type="text" class="form-control" id="title" name="title"
                                            value="${model.title}" />
                                    </div>
                                    <div class="mb-3">
                                        <label for="thumbnail" class="control-label no-padding-right">Hình đại
                                            diện</label>
                                        <input type="text" class="form-control" id="thumbnail" name="thumbnail"
                                            value="${model.thumbnail}" />
                                    </div>
                                    <div class="mb-3">
                                        <label for="shortDescription" class="control-label no-padding-right">Mô tả
                                            ngắn</label>
                                        <input type="text" class="form-control" id="shortDescription"
                                            name="shortDescription" value="${model.shortDescription}" />
                                    </div>
                                    <div class="mb-3">
                                        <label for="content" class="control-label no-padding-right">Nội dung</label>
                                        <textarea class="form-control" rows="6" cols="" id="content" form="formSubmit"
                                            name="content">${model.content}</textarea>
                                    </div>
                                    <div class="mb-3">
                                        <c:if test="${not empty model.id}">
                                            <input type="button" class="btn btn-white btn-warning btn-bold"
                                                value="Cập nhật bài viết" id="btnAddOrUpdateNew" />
                                        </c:if>
                                        <c:if test="${empty model.id}">
                                            <input type="button" class="btn btn-white btn-warning btn-bold"
                                                value="Thêm bài viết" id="btnAddOrUpdateNew" />
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

                $('#btnAddOrUpdateNew').click(function () {
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
                               window.location.href = "${NewURL}?type=list&message=error_system";
                           }
                   	};
                   	if ($('#id').val()) {
                   	    params.type = 'PUT';
                   	    params.success = function (result) {
                               window.location.href = "${NewURL}?type=edit&id="
                                   + result.id + "&message=update_success";
                           };
                   	} else {
                   	    params.type = 'POST';
                   	    params.success = function (result) {
                               window.location.href = "${NewURL}?type=edit&id="
                                   + result.id + "&message=insert_success";
                           };
                   	}
                   	$.ajax(params);
                });
                
                
            </script>
        </body>

        </html>