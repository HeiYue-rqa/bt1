<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <link href="<c:url value='/template/general/css/edited-bootstrap.css' />" rel="stylesheet" id="bootstrap-css">
    <link href="<c:url value='/template/login/style.css' />" rel="stylesheet" type="text/css" media="all"/>
</head>
<body id="LoginForm">
    <jsp:include page="/WEB-INF/views/login.jsp"></jsp:include>
    <script src="<c:url value='/template/general/js/jquery-3.6.0.js' />"></script>
    <script src="<c:url value='/template/general/js/bootstrap.min.js' />"></script>
</body>
</html>