<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>

<%request.setAttribute("action", request.getParameter("home")); %>
<c:choose>
<c:when test="${action eq 'clist' }">
	<jsp:include page="/WEB-INF/views/admin/comment/list.jsp"/>
</c:when>
<c:when test="${action eq 'cedit' }">
	<jsp:include page="/WEB-INF/views/admin/comment/edit.jsp"></jsp:include>
</c:when>
<c:when test="${action eq 'nlist' }">
	<jsp:include page="/WEB-INF/views/admin/new/list.jsp"/>
</c:when>
<c:when test="${action eq 'nedit' }">
	<jsp:include page="/WEB-INF/views/admin/new/edit.jsp"></jsp:include>
</c:when>
<c:otherwise>
	<jsp:include page="/WEB-INF/views/admin/home.jsp"></jsp:include>
</c:otherwise>
</c:choose>