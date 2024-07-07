<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <nav class="header-container navbar navbar-expand-lg navbar-light navbar-custom">
            <a href="/"> <img class="header-logo" src="/client/images/logo2.png" alt="Logo"></a>
            <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="#"><i class="header-map_icon fas fa-map-marker-alt"></i></a>
                    </li>
                    <!-- <li class="header-notify nav-item nav-icon">
                    <a class="nav-link" href="#"><i class="header-notify_icon far fa-bell"><span
                                class="notification-badge">1</span></i></a>
                </li>
                <li class="nav-item">
                    <a class="header-language nav-link" href="#">EN</a>
                </li> -->
                    <li class="nav-item header-user">
                        <!-- <i class="header-user_icon fas fa-circle-user"></i>
                    <a class="header-user_text header-user nav-link" href="#">Thành viên</a> -->

                        <c:if test="${not empty pageContext.request.userPrincipal}">
                            <div class="dropdown ">
                                <button class="btn btn-header_user" type="button" id="dropdownMenuButton"
                                    data-toggle="dropdown">
                                    <i class="header-user_icon fas fa-circle-user"></i>
                                    <span class="item-user_title">Hi ${sessionScope.fullName}</span>
                                </button>
                                <div class="dropdown-menu dropdown-user_items dropdown-menu-right">
                                    <a class="dropdown-item user-item_header" href="#">
                                        <img class="user-item_avatar" src="/images/avatar/${sessionScope.avatar}"
                                            alt="">
                                        <span class="user-item_text justify-content-center font-weight-bold py-2">
                                            <!-- <i class="item-user_icon fas fa-circle-user"></i> -->
                                            Xin chào
                                            <c:out value="${sessionScope.fullName}" />
                                        </span>
                                    </a>
                                    <a class="dropdown-item user-item_option" href="/order-history">
                                        <span class="user-item_text">
                                            <i class="item-user_icon fas fa-circle-exclamation"></i>
                                            Lịch sử mua hàng
                                        </span>
                                    </a>
                                    <form method="post" action="/logout" class="dropdown-item user-item_option">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                        <button class="btn-sign-out user-item_text">
                                            <i class="item-user_icon fa fa-sign-out" aria-hidden="true"></i>
                                            Sign out
                                        </button>
                                    </form>

                                </div>
                            </div>
                        </c:if>

                        <c:if test="${empty pageContext.request.userPrincipal}">
                            <a class="header-user_text header-user nav-link" href="/login">
                                <i class="header-icon_login fa fa-sign-in" aria-hidden="true"></i>
                                Sign in
                            </a>
                        </c:if>
                    </li>
                </ul>
            </div>
        </nav>