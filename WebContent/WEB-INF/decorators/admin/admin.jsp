<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="/WEB-INF/common/taglib.jsp" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <link rel="stylesheet"
                href="<c:url value='/template/admin/font-awesome/4.5.0/css/font-awesome.min.css' />" />
			<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
            <link rel="stylesheet" href="<c:url value='/template/admin/assets/css/ace.min.css' />"
                class="ace-main-stylesheet" id="main-ace-style" />
            <link rel="stylesheet" href="<c:url value='/template/general/css/edited-bootstrap.css' />" />
            <link rel="stylesheet" href="<c:url value='/template/admin/style.css' />" />
            <script src="<c:url value='/template/admin/assets/js/ace-extra.min.js' />"></script>
            <script src="<c:url value='/template/general/js/jquery-3.6.0.js' />"></script>
            <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.0/themes/start/jquery-ui.css" />
            <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
            <!-- important -->
        	<script src="<c:url value='/template/general/paging/jquery.twbsPagination.js' />"></script>
            <script src="<c:url value='/template/admin/assets/js/bootstrap.min.js' />"></script>
            <!-- important -->
        </head>

        <body class="no-skin">
            <%@ include file="/WEB-INF/common/admin/header.jsp" %>

                <div class="main-container" id="main-container">
                    <script type="text/javascript">
                        try { ace.settings.check('main-container', 'fixed') } catch (e) { }
                    </script>
                    <%@ include file="/WEB-INF/common/admin/menu.jsp" %>

                        <jsp:include page="/WEB-INF/decorators/admin/content.jsp"></jsp:include>

                        <%@ include file="/WEB-INF/common/admin/footer.jsp" %>

                            <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse display">
                                <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
                            </a>
                </div>
                <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
                <script src="<c:url value='/template/admin/assets/js/jquery-ui.custom.min.js' />"></script>
                <script src="<c:url value='/template/admin/assets/js/jquery.ui.touch-punch.min.js' />"></script>
                <script src="<c:url value='/template/admin/assets/js/jquery.easypiechart.min.js' />"></script>
                <script src="<c:url value='/template/admin/assets/js/jquery.sparkline.min.js' />"></script>
                <script src="<c:url value='/template/admin/assets/js/jquery.flot.min.js' />"></script>
                <script src="<c:url value='/template/admin/assets/js/jquery.flot.pie.min.js' />"></script>
                <script src="<c:url value='/template/admin/assets/js/jquery.flot.resize.min.js' />"></script>
                <script src="<c:url value='/template/admin/assets/js/ace-elements.min.js' />"></script>
                <script src="<c:url value='/template/admin/assets/js/ace.min.js' />"></script>

        </body>

        </html>