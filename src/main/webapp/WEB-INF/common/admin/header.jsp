<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="/WEB-INF/common/taglib.jsp" %>
        <!DOCTYPE html>
        <div id="navbar" class="navbar navbar-dark navbar-expand-lg ace-save-state">
            <div class="container-fluid navbar-container ace-save-state" id="navbar-container">
                <button type="button" class="navbar-toggler menu-toggler pull-left" id="menu-toggler"
                    data-target="#sidebar">
                    <span class="visually-hidden">Toggle sidebar</span>
                    <span class="navbar-toggler-icon"></span>
                </button>

                <a href="#" class="navbar-brand me-auto">
                    <small>
                        <i class="fa fa-leaf"></i>
                        Trang quản trị
                    </small>
                </a>

                <div class="navbar-buttons collapse navbar-collapse" role="navigation">
                    <ul class="nav ace-nav ms-auto">
                        <li>
                            <a href="/trang-chu" class="btn light-hov bg-transparent">
                                Xin chào, ${USERMODEL.fullName}
                            </a>
                        </li>
                        <li>
                            <a href='<c:url value="/thoat?action=logout"/>' class="btn light-hov bg-transparent">
                                <i class="ace-icon fa fa-power-off"></i>
                                Thoát
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>