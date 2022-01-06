<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="/WEB-INF/common/taglib.jsp" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <link rel="stylesheet" href="<c:url value='/template/general/css/edited-bootstrap.css'/>" />
            <link rel="stylesheet" href="<c:url value='/template/web/style.css'/>" />
            <script src="<c:url value='/template/general/js/jquery-3.6.0.js'/>"></script>
       		<script src="<c:url value='/template/general/paging/jquery.twbsPagination.js' />"></script>

        </head>

        <body>
            <%@ include file="/WEB-INF/common/web/header.jsp" %>

                <jsp:include page="/WEB-INF/decorators/web/content.jsp"></jsp:include>

                <%@ include file="/WEB-INF/common/web/footer.jsp" %>
                    <script src="<c:url value='/template/general/js/bootstrap.min.js' />"></script>
        </body>

        </html>