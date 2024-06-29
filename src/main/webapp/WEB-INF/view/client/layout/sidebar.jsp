<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <div class="d-none d-lg-block col-lg-3 cart-container">
                <div class="cart">
                    <div class="cart-header">
                        <h2 class="text-center cart-header_title">Giỏ Hàng</h2>
                    </div>
                    <div class="cart-content">
                        <c:if test="${empty sessionScope.cartDetails}">
                            <div class="cart-content_notify alert alert-info text-center">Không có sản phẩm trong giỏ
                                hàng
                            </div>
                        </c:if>
                        <div class="cart-items">
                            <c:if test="${not empty sessionScope.cartDetails}">
                                <c:forEach var="item" items="${sessionScope.cartDetails}">
                                    <div class="cart-item d-flex justify-content-between align-items-center">
                                        <div class="d-flex align-items-center justify-content-center">
                                            <div class="cart-item_quantity">
                                                <span class="cart-item_quantity-box">
                                                    <p class="cart-item_quantity-content">x${item.quantity}</p>
                                                </span>
                                            </div>
                                            <div class="d-flex ml-3 font-weight-bold">
                                                <p class="cart-item_name">${item.product.name}</p>
                                                <span class="cart-item_price">
                                                    <fmt:formatNumber type="number" value="${item.product.price}" />
                                                    ₫
                                                </span>
                                            </div>
                                        </div>
                                        <button class="btn cart-btn_del">&times</button>
                                    </div>
                                </c:forEach>
                            </c:if>
                        </div>
                    </div>
                    <div class="cart-footer">
                        <div class="voucher-section text-center">
                            <div class="footer-btn_vourcher"><button class="btn btn-voucher">SỬ DỤNG VOUCHER</button>
                            </div>
                            <p class="add-food">Thêm món Yêu thích</p>
                        </div>

                        <div id="favoriteCarousel" class="carousel slide" data-ride="carousel">

                            <div class="carousel-inner shadow-sm">
                                <div class="carousel-item  active">
                                    <div class="favorite-item text-center">
                                        <img src="/images/Xa_Lach_Ca_Ngu.jpg" class="favorite-img" alt="">
                                        <div class="favorite-item_info">
                                            <span class="favorite-item_name">Món Yêu Thích</span>
                                            <span class="favorite-item_price">89,000đ</span>
                                        </div>
                                        <button class="btn btn-success">Thêm</button>
                                    </div>
                                </div>
                                <div class="carousel-item ">
                                    <div class="favorite-item text-center">
                                        <img src="/images/Canh_Ga_Nuong_BBQ.jpg" class="favorite-img" alt="">
                                        <div class="favorite-item_info">
                                            <span class="favorite-item_name">Món Yêu Thích</span>
                                            <span class="favorite-item_price">89,000đ</span>
                                        </div>
                                        <button class="btn btn-success">Thêm</button>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-indicators">
                                <button class="carousel-indicator_btn" type="button"
                                    data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"
                                    aria-current="true" aria-label="Slide 1"></button>
                                <button class="carousel-indicator_btn" type="button"
                                    data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
                                    aria-label="Slide 2"></button>
                            </div>
                        </div>
                        <div class="cart-summary mt-4">
                            <p>Tổng:
                                <span class="value">
                                    <fmt:formatNumber type="number" value="${sessionScope.totalPrice}" />
                                    ₫
                                </span>
                            </p>
                            <p>Giảm T.Viên: <span class="value">(0đ)</span></p>
                            <p>Giảm K.mại: <span class="value">(0đ)</span></p>
                            <p>Phí Giao Hàng: <span class="value">0đ</span></p>
                        </div>
                        <div class="text-center footer-btn_checkout">
                            <button class="btn btn-primary btn-checkout">
                                THANH TOÁN
                                <span class="value">
                                    <fmt:formatNumber type="number" value="${sessionScope.totalPrice}" />
                                    ₫
                                </span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            </div>