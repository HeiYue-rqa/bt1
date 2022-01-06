<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="/WEB-INF/common/taglib.jsp" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>Bài viết</title>
        </head>

        <body>
            <div class="col-lg-8">
                <!-- Post content-->
                <article>
                    <!-- Post header-->
                    <header class="mb-4">
                        <!-- Post title-->
                        <h1 class="fw-bolder mb-1">${readNew.title}</h1>
                        <!-- Post meta content-->
                        <div class="text-muted fst-italic mb-2">
                        <c:if test="${not empty readNew.createdDate}"><span>Posted on ${readNew.createdDate}</span></c:if>
                        <c:if test="${not empty readNew.createdBy}"><span> by ${readNew.createdBy}</span></c:if>
                        </div>
                        <!-- Post categories-->
                        <a class="badge bg-secondary text-decoration-none link-light" href="#!">${readNew.categoryCode}</a>
                    </header>
                    <!-- Preview image figure-->
                    <figure class="mb-4">
                    <c:if test="${not empty readNew.thumbnail}">
                        <img class="img-fluid rounded" src="${readNew.thumbnail}"
                            alt="..." /></c:if>
                    </figure>
                    <!-- Post content-->
                    <section class="mb-5">
                        <p class="fs-5 mb-4">${readNew.content}</p>
                    </section>
                </article>
            </div>
        </body>

        </html>