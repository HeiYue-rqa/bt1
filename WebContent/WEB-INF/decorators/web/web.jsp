<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="/WEB-INF/common/taglib.jsp" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <link rel="shortcut icon" href="/template/general/logo.png?" type="image/x-icon" />
            <link rel="stylesheet" href="<c:url value='/template/general/css/edited-bootstrap.css'/>" />
            <link rel="stylesheet" href="<c:url value='/template/web/style.css?123'/>" />
            <script src="<c:url value='/template/general/js/jquery-3.6.0.js'/>"></script>
            <script src="<c:url value='/template/general/paging/jquery.twbsPagination.js' />"></script>

        </head>

        <body>
            <%@ include file="/WEB-INF/common/web/header.jsp" %>

                <jsp:include page="/WEB-INF/decorators/web/content.jsp"></jsp:include>

                <%@ include file="/WEB-INF/common/web/footer.jsp" %>
                    <script src="<c:url value='/template/general/js/bootstrap.min.js' />"></script>
                    <!-- Messenger Plugin chat Code -->
                    <div id="fb-root"></div>

                    <!-- Your Plugin chat code -->
                    <div id="fb-customer-chat" class="fb-customerchat">
                    </div>

                    <script>
                        var chatbox = document.getElementById('fb-customer-chat');
                        chatbox.setAttribute("page_id", "102337999019875");
                        chatbox.setAttribute("attribution", "biz_inbox");
                    </script>

                    <!-- Your SDK code -->
                    <script>
                        window.fbAsyncInit = function () {
                            FB.init({
                                xfbml: true,
                                version: 'v12.0'
                            });
                        };

                        (function (d, s, id) {
                            var js, fjs = d.getElementsByTagName(s)[0];
                            if (d.getElementById(id)) return;
                            js = d.createElement(s); js.id = id;
                            js.src = 'https://connect.facebook.net/vi_VN/sdk/xfbml.customerchat.js';
                            fjs.parentNode.insertBefore(js, fjs);
                        }(document, 'script', 'facebook-jssdk'));
                    </script>
        </body>

        </html>