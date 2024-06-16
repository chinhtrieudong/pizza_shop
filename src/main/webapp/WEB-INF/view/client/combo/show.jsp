<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
            </head>

            <body>
                <div class="container-fluid">
                    <div class="row">
                        <div class="main-container col-lg-9">
                            <header class="header-menu">
                                <jsp:include page="../layout/header.jsp" />
                                <jsp:include page="../layout/navbar.jsp" />
                            </header>
                            <div class="row">
                                <c:forEach var="combo" items="${combos}">
                                    <div class="col-md-6 product-item">
                                        <div class="combo-card">
                                            <a href="/menu/combo/${combo.id}" class="product-item_header">
                                                <div class="product-img">
                                                    <img src="/images/combo/${combo.image}" alt="Combo Image"
                                                        class="card-img-top">
                                                </div>

                                                <div class="product-name">
                                                    <span class="card-title">${combo.name}</span>
                                                    <span class="new-icon">NEW</span>
                                                </div>
                                            </a>
                                            <div class="card-body">
                                                <div class="card-body_info">
                                                    <input type="hidden" id="combo-id-input">
                                                    <p class=" card-body_text" id="combo-${combo.id}"
                                                        data-combo-id="${combo.id}">
                                                        ${combo.detailDesc}
                                                        <span class="more-link" id="more-link-${combo.id}">... xem
                                                            thêm</span>
                                                    </p>
                                                </div>
                                                <div class="card-footer">
                                                    <p class="card-footer_item">
                                                        <span class="card-footer_text">Giá chỉ từ</span>
                                                        <span class="card-footer_price">

                                                            <fmt:formatNumber type="number" value="${combo.price}" /> ₫

                                                        </span>
                                                    </p>
                                                    <button class="btn-select_product btn btn-primary">Chọn</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>

                        <jsp:include page="../layout/sidebar.jsp" />
                    </div>
                </div>

                <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
                <script src="/client/js/script.js"></script>

            </body>

            </html>