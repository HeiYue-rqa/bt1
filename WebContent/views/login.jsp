<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="/WEB-INF/common/taglib.jsp" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Đăng nhập</title>
        </head>

        <body>
            <div class="container">
                <div class="login-form">
                    <div class="wrapper">
                        <div style="height: 58px;">
                            <c:if test="${not empty message}">
                                <div class="alert alert-${alert}">${message}</div>
                            </c:if>
                        </div>

                        <form action="<c:url value='/dang-nhap'/>" id="formLogin" class="form-signin" method="post">
                            <h2 class="form-signin-heading">Please login</h2>
                            <div class="mb-3">
                            	<label for="userName" class="form-label">Tên đăng nhập</label>
	                            <input type="text" class="form-control" name="userName" id="userName"
	                                required autofocus />
                            </div>
                            <div class="mb-3">
                            	<label for="password" class="form-label">Mật khẩu</label>
							    <input type="password" class="form-control" name="password" id="password"
                                	required />
							</div>
                            <input type="hidden" value="login" name="action" />
                            <div class="d-grid">
                                <button class="btn btn-lg btn-primary " type="submit">Đăng nhập</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </body>

        </html>