<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
                <!DOCTYPE html>
                <html lang="vi">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Pizza Hut Ordering Interface</title>
                    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
                    <link rel="stylesheet"
                        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
                    <link rel="stylesheet" href="/client/css/style.css">
                    <link rel="stylesheet" href="/client/css/checkout.css">
                </head>

                <body>
                    <div class="container-fluid px-0">

                        <jsp:include page="../layout/header.jsp" />
                        <div class="checkout-body">
                            <div class="checkout-banner">THANH TOÁN</div>
                            <div class="checkout-content">
                                <div class="container-sm">
                                    <form:form>
                                        <div class="card checkout-card_item" style="padding: 30px 25px">
                                            <ul class="list-group list-group-flush">
                                                <li class="list-group-item show-cart">
                                                    <div class="d-flex align-items-center">
                                                        <i class="payment-icon fas fa-cart-shopping icon-show_cart">
                                                            <div class="badge">${sessionScope.sum}</div>
                                                        </i>
                                                        Xem chi tiết giỏ hàng của bạn
                                                    </div>
                                                    <a href="/"><i class="btn-back payment-icon fas fa-arrow-right"></i>
                                                    </a>
                                                </li>
                                                <li class="list-group-item">
                                                    <i class=" payment-icon fas fa-location-dot"></i>
                                                    Giao hàng tận nơi: Hà Nội, Việt Nam
                                                </li>
                                                <li class="list-group-item">
                                                    <i class=" payment-icon fas fa-message"></i>
                                                    <input type="text" class="instruction-input"
                                                        placeholder="Hướng dẫn cho người giao hàng" />
                                                </li>
                                                <li class="list-group-item">
                                                    <i class=" payment-icon fas fa-clock"></i>
                                                    Giao hàng vào lúc: <p class="delivery-time">Càng sớm các tốt</p>
                                                </li>
                                            </ul>

                                        </div>
                                        <div class="card checkout-card_item" style="padding: 30px 25px">
                                            <div class="card-title">
                                                Thông tin đặt hàng
                                            </div>

                                            <div class="form-group">
                                                <label for="formGroupExampleInput">Họ và tên*</label>
                                                <input type="text" class="form-control" id="formGroupExampleInput"
                                                    value="${sessionScope.fullName}">
                                            </div>
                                            <div class="form-group">
                                                <label for="formGroupExampleInput2">Số điện thoại*</label>
                                                <input type="text" class="form-control" id="formGroupExampleInput2"
                                                    value="${sessionScope.phone}">
                                            </div>
                                            <div class="form-group">
                                                <label for="formGroupExampleInput2">Email*</label>
                                                <input type="text" class="form-control" id="formGroupExampleInput2"
                                                    value="${sessionScope.email}">
                                            </div>
                                        </div>

                                        <div class="card checkout-card_item" style="padding: 30px 25px">
                                            <div class="card-title">
                                                Phương thức thanh toán
                                            </div>

                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="flexRadioDefault"
                                                    id="CODPayment">
                                                <label class="form-check-label btn-payment-radio" for="CODPayment">
                                                    <img class="payment-icon" src="/client/images/money.png" alt="">
                                                    <p class="pl-2">Thanh toán bằng tiền mặt</p>
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="flexRadioDefault"
                                                    id="ZaloPayment">
                                                <label class="form-check-label btn-payment-radio" for="ZaloPayment">
                                                    <img class="payment-icon" src="/client/images/zalopay.png" alt="">
                                                    <p class="pl-2">Thanh toán bằng ZaloPay</p>
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="flexRadioDefault"
                                                    id="momoPayment">
                                                <label class="form-check-label btn-payment-radio" for="momoPayment">
                                                    <img class="payment-icon" src="/client/images/momo.png" alt="">
                                                    <p class="pl-2">Thanh toán Momo</p>
                                                </label>
                                            </div>
                                            <button class="btn btn-success btn-checkout">
                                                ĐẶT HÀNG
                                                <fmt:formatNumber type="number" value="${totalPrice}" />đ
                                            </button>
                                        </div>
                                    </form:form>
                                </div>
                            </div>

                        </div>

                    </div>

                    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
                    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
                    <script src="/client/js/script.js"></script>

                </body>

                </html>