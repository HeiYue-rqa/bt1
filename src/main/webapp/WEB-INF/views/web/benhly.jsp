<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="/WEB-INF/common/taglib.jsp" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8" />
            <title>Bệnh lý</title>
        </head>

        <body>
            <!-- Blog entries-->
            <div class="col-lg-8">
                <form action="/trang-new" id="formBaiviet" name="formBaiviet" method="get">
                    <input type="hidden" name="submitRead" />
                    <input type="hidden" value="read" name="action" />
                    <!-- Featured blog post-->
                    <c:if test="${not empty maxNew}">
                        <div class="card mb-4">
                            <a href="#!"><img class="card-img-top" src="<c:if test=" ${empty maxNew.thumbnail}">
                                <c:set var="thumbnail" value="https://dummyimage.com/850x350/dee2e6/6c757d.jpg" />
                                ${thumbnail}
                    </c:if>
                    <c:if test="${not empty maxNew.thumbnail}">
                        <c:out value="${maxNew.thumbnail}" />
                    </c:if>" alt="..." /></a>
                    <div class="card-body">
                        <div class="small text-muted">${maxNew.createdDate}</div>
                        <h2 class="card-title">${maxNew.title}</h2>
                        <p class="card-text">${maxNew.shortDescription}</p>
                        <button class="btn btn-primary" value="${maxNew.id}" type="submit"
                            onclick="{document.formBaiviet.submitRead.value=this.value;document.formBaiviet.submit();}">Read
                            more →</button>
                    </div>
            </div>
            </c:if>
            <c:if test="${empty maxNew}">
                <c:redirect url="/trang-chu?home=notfound" />
            </c:if>
            <!-- Nested row for non-featured blog posts-->
            <div class="row">
                <c:forEach var="item" items="${model.listResult}">
                    <c:if test="${item.id != maxNew.id}">
                        <div class="col-lg-6">
                            <!-- Blog post-->
                            <div class="card mb-4">
                                <a href="#!"><img class="card-img-top" src="<c:if test=" ${empty item.thumbnail}">
                                    <c:set var="thumbnail" value="https://dummyimage.com/850x350/dee2e6/6c757d.jpg" />
                                    <c:out value="${thumbnail}" />
                    </c:if>
                    <c:if test="${not empty item.thumbnail}">
                        <c:out value="${item.thumbnail}" />
                    </c:if>
                    " alt="..." /></a>
                    <div class="card-body">
                        <div class="small text-muted">${item.createdDate}</div>
                        <h2 class="card-title h4">${item.title}</h2>
                        <p class="card-text">${item.shortDescription}</p>
                        <button class="btn btn-primary" value="${item.id}" type="submit"
                            onclick="{document.formBaiviet.submitRead.value=this.value;document.formBaiviet.submit();}">Read
                            more →</button>
                    </div>
            </div>
            </div>
            </c:if>
            </c:forEach>
            </div>
            </form>
            </div>

        </body>

        </html>