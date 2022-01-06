<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="/WEB-INF/common/taglib.jsp" %>
    <c:url var="APIurl" value="/api-admin-comment" />
    <c:url var="cmtURL" value="/admin-comment" />
        <!DOCTYPE html>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Danh sách câu hỏi</title>
        </head>

        <body>
            <div class="main-content ml-menu">
                <div class="main-content-inner">
                    <div class="breadcrumbs ace-save-state" id="breadcrumbs">
                        <ul class="breadcrumb">
                            <li><i class="ace-icon fa fa-home home-icon"></i> <a href="/admin-home">Trang
                                    chủ</a></li>
                        </ul>
                        <!-- /.breadcrumb -->
                    </div>
                    <div class="page-content">
                        <div class="row">
                            <div class="col-xs-12">
                                <c:if test="${not empty messageResponse}">
                                    <div class="alert alert-${alert}">${messageResponse}</div>
                                </c:if>
                                <form action="<c:url value='/admin-comment' />" id="formSubmit" method="get">
                                    <div class="widget-box table-filter">
                                        <div class="table-btn-controls">
                                            <div class="pull-right tableTools-container">
                                                <div class="dt-buttons btn-overlap btn-group">
                                                    <button id="btnDelete" type="button"
                                                        class="dt-button buttons-html5 btn btn-white btn-primary btn-bold"
                                                        data-toggle="tooltip" title='Xóa câu hỏi'>
                                                        <span> <i class="fa fa-trash-o bigger-110 pink"></i>
                                                        </span>
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <div class="table-responsive">
                                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                                    <thead>
                                                        <tr>
                                                            <th style="min-width: 40px; max-width: 50px;"><input type="checkbox" id="checkAll"></th>
                                                            <th style="min-width: 100px; max-width: 120px;">Người hỏi</th>
                                                            <th>Câu hỏi</th>
                                                            <th>Trả lời</th>
                                                            <th style="min-width: 100px; max-width: 120px;">Thao tác</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach var="item" items="${model.listResult}">
                                                            <tr>
                                                                <td><input type="checkbox" id="checkbox_${item.id}"
                                                                        value="${item.id}"></td>
                                                                <td><c:out value="${item.createdBy}" /></td>
                                                                <td><c:out value="${item.question}" /></td>
                                                                <td><c:out value="${item.answer}" /></td>
                                                                <td>
                                                                    <c:url var="editURL" value="/admin-comment">
                                                                        <c:param name="type" value="edit" />
                                                                        <c:param name="id" value="${item.id}" />
                                                                    </c:url> <a class="btn btn-sm btn-primary btn-edit"
                                                                        data-toggle="tooltip" title="Cập nhật câu trả lời"
                                                                        href='${editURL}'><i
                                                                            class="fa fa-pencil-square-o"
                                                                            aria-hidden="true"></i> </a>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.main-content -->
            <script>
                
             	// Call the dataTables jQuery plugin
                $(document).ready(function() {
                  $('#dataTable').DataTable();
                });
             

                $("#btnDelete").click(function () {
                    var data = {};
                    var ids = $('tbody input[type=checkbox]:checked').map(function () {
                        return $(this).val();
                    }).get();
                    data['ids'] = ids;
                    deleteNew(data);
                });

                function deleteNew(data) {
                    $.ajax({
                            url: '${APIurl}',
                            type: 'DELETE',
                            contentType: 'application/json',
                            data: JSON.stringify(data),
                            success: function (result) {
                                window.location.href = "${cmtURL}?type=list&message=delete_success";
                            },
                            error: function (error) {
                                window.location.href = "${cmtURL}?type=list&message=error_system";
                            }
                        });
                }
            </script>
        </body>

        </html>