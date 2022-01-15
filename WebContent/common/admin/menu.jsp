<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="/WEB-INF/common/taglib.jsp" %>
        <!DOCTYPE html>
        <div id="sidebar" class="sidebar responsive ace-save-state">
            <script type="text/javascript">
                try { ace.settings.loadState('sidebar') } catch (e) { }
            </script>
            <div class="sidebar-shortcuts">
                <div class="sidebar-shortcuts-large">
                    <a href='<c:url value="/trang-new"/>' class="btn btn-success">
                        <i class="ace-icon fa fa-pencil"></i>
                    </a>
                    
                    <a href='<c:url value="/trang-comment"/>' class="btn btn-info">
                        <i class="ace-icon fa fa-signal"></i>
                    </a>

                    <a href='<c:url value="/trang-chu"/>' class="btn btn-warning">
                        <i class="ace-icon fa fa-paper-plane"></i>
                    </a>

                    <a href='<c:url value="/thoat?action=logout"/>' class="btn btn-danger">
                    	<i class="ace-icon fa fa-power-off"></i>
                    </a>
                </div>
                <div class="sidebar-shortcuts-mini">
                    <span class="btn btn-success"></span>

                    <span class="btn btn-info"></span>

                    <span class="btn btn-warning"></span>

                    <span class="btn btn-danger"></span>
                </div>
            </div>
            <ul class="nav-list">
                <li>
                    <a href="#" class="btn btn-light dropdown-toggle">
                        <i class="menu-icon fa fa-pencil"></i>
                        <span class="menu-text">Quản lý bài viết</span>
                        <b class="arrow"></b>
                    </a>
                    <b class="arrow"></b>
                    <ul class="submenu">
                        <li>
                            <a href='<c:url value="/admin-new?type=list"/>'>
                                <i class="menu-icon fa fa-caret-right"></i>
                                Danh sách bài viết
                            </a>
                            <b class="arrow"></b>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#" class="btn btn-light dropdown-toggle">
                        <i class="menu-icon fa fa-signal"></i>
                        <span class="menu-text">Quản lý câu hỏi</span>
                        <b class="arrow"></b>
                    </a>
                    <b class="arrow"></b>
                    <ul class="submenu">
                        <li>
                            <a href='<c:url value="/admin-comment?type=list"/>'>
                                <i class="menu-icon fa fa-caret-right"></i>
                                Danh sách câu hỏi
                            </a>
                            <b class="arrow"></b>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#" class="btn btn-light dropdown-toggle">
                    	<i class="menu-icon fa fa-user"></i>
                        <span class="menu-text">Tài khoản của tôi</span>
                        <b class="arrow"></b>
                    </a>
                    <b class="arrow"></b>
                    <ul class="submenu">
                        <li>
                            <a href='<c:url value="/trang-chu"/>'>
                                <i class="menu-icon fa fa-paper-plane"></i>
                                Trang người dùng
                            </a>
                            <b class="arrow"></b>
                        </li>
                        <li>
                            <a href='<c:url value="/thoat?action=logout"/>'>
                            	<i class="menu-icon fa fa-power-off"></i>
                                Thoát
                            </a>
                            <b class="arrow"></b>
                        </li>
                    </ul>
                </li>
            </ul>
            <div class="sidebar-toggle sidebar-collapse">
                <i class="ace-icon fa fa-angle-double-left ace-save-state" data-icon1="ace-icon fa fa-angle-double-left"
                    data-icon2="ace-icon fa fa-angle-double-right"></i>
            </div>
        </div>