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
                <link rel="stylesheet" href="/client/css/detail.css">
            </head>

            <body>
                <div class="detail-container container-fluid">
                    <jsp:include page="../layout/header.jsp" />
                    <div class="container main-container">
                        <a class="btn-back" href="/">
                            <i class="back-icon fas fa-less-than"></i>
                            <p class="back-text">
                                QUAY LẠI
                            </p>
                        </a>

                        <div class="combo-body">
                            <div class="combo-info">
                                <h6 class="combo-name">${combo.name}</h6>
                                <p class="combo-detail">${combo.detailDesc}</p>
                                <div class="cost-detail">
                                    <div class="combo-price">
                                        <p class="price-label">Giá COMBO:</p>
                                        <span class="w-36"></span>
                                        <p class="price-value">
                                            <fmt:formatNumber type="number" value="${combo.price}" /> ₫
                                        </p>
                                    </div>
                                    <div class="combo-fee">
                                        <p class="price-label">Phí Giao Hàng:</p>
                                        <span class="w-36"><i class="fas fa-circle-exclamation"></i></span>
                                        <p class="price-value">22,000 ₫</p>
                                    </div>
                                </div>
                            </div>
                            <div class="combo-image">
                                <img src="/images/combo/${combo.image}" alt="Combo Image" class="combo-image_style">
                            </div>
                        </div>
                        <div class="collapse-item">
                            <div id="accordion">
                                <div class="card">
                                    <div class="card-header" id="headingOne">
                                        <button class="btn btn-link" data-toggle="collapse" data-target="#collapseOne"
                                            aria-expanded="true" aria-controls="collapseOne">
                                            Chọn pizza
                                        </button>
                                        <i class="fa-solid fa-plus icon-add"></i>
                                    </div>

                                    <div id="collapseOne" class="collapse " aria-labelledby="headingOne">
                                        <div class="card-body">
                                            <div class="row">
                                                <c:forEach var="product" items="${pizzas}">
                                                    <div class="col col-md-3 product-item">
                                                        <div class="combo-card">
                                                            <div class="product-item_header">
                                                                <div class="product-img">
                                                                    <img src="/images/product/${product.image}"
                                                                        alt="Combo Image" class="card-img-top">
                                                                </div>
                                                                <div class="product-name">
                                                                    <span class="card-title">${product.name}</span>
                                                                </div>
                                                            </div>
                                                            <div class="card-body">
                                                                <div class="card-body_info">
                                                                    <p class="card-body_text" id="combo-${product.id}"
                                                                        data-combo-id="${product.id}">
                                                                        ${product.detailDesc}
                                                                        <span class="more-link"
                                                                            id="more-link-${product.id}">... xem
                                                                            thêm</span>
                                                                    </p>
                                                                </div>

                                                                <div class="card-footer">
                                                                    <button class="btn btn-select">CHỌN<span
                                                                            class="value">
                                                                            <fmt:formatNumber type="number"
                                                                                value="${product.price}" /> ₫
                                                                        </span></button>

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-header" id="headingTwo">
                                        <button class="btn btn-link collapsed" data-toggle="collapse"
                                            data-target="#collapseTwo" aria-expanded="false"
                                            aria-controls="collapseTwo">
                                            Chọn món ăn kèm
                                        </button>
                                        <i class="fa-solid fa-plus icon-add"></i>
                                    </div>
                                    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo">
                                        <div class="card-body">
                                            <div class="row">
                                                <c:forEach var="product" items="${appetizers}">
                                                    <div class="col col-md-3 product-item">
                                                        <div class="combo-card">
                                                            <div class="product-item_header">
                                                                <div class="product-img">
                                                                    <img src="/images/product/${product.image}"
                                                                        alt="Combo Image" class="card-img-top">
                                                                </div>
                                                                <div class="product-name">
                                                                    <span class="card-title">${product.name}</span>
                                                                </div>
                                                            </div>
                                                            <div class="card-body">
                                                                <div class="card-body_info">
                                                                    <p class="card-body_text" id="combo-${product.id}"
                                                                        data-combo-id="${product.id}">
                                                                        ${product.detailDesc}
                                                                        <span class="more-link"
                                                                            id="more-link-${product.id}">... xem
                                                                            thêm</span>
                                                                    </p>
                                                                </div>

                                                                <div class="card-footer">
                                                                    <button class="btn btn-select">CHỌN<span
                                                                            class="value">
                                                                            <fmt:formatNumber type="number"
                                                                                value="${product.price}" /> ₫
                                                                        </span></button>

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-header" id="headingThree">
                                        <button class="btn btn-link collapsed" data-toggle="collapse"
                                            data-target="#collapseThree" aria-expanded="false"
                                            aria-controls="collapseThree">
                                            Chọn thức uống
                                        </button>
                                        <i class="fa-solid fa-plus icon-add"></i>
                                    </div>
                                    <div id="collapseThree" class="collapse" aria-labelledby="headingThree">
                                        <div class="card-body">
                                            <div class="row">
                                                <c:forEach var="product" items="${drinks}">
                                                    <div class="col col-md-3 product-item">
                                                        <div class="combo-card">
                                                            <div class="product-item_header">
                                                                <div class="product-img">
                                                                    <img src="/images/product/${product.image}"
                                                                        alt="Combo Image" class="card-img-top">
                                                                </div>
                                                                <div class="product-name">
                                                                    <span class="card-title">${product.name}</span>
                                                                </div>
                                                            </div>
                                                            <div class="card-body">
                                                                <div class="card-body_info">
                                                                    <p class="card-body_text" id="combo-${product.id}"
                                                                        data-combo-id="${product.id}">
                                                                        ${product.detailDesc}
                                                                        <span class="more-link"
                                                                            id="more-link-${product.id}">... xem
                                                                            thêm</span>
                                                                    </p>
                                                                </div>

                                                                <div class="card-footer">
                                                                    <button class="btn btn-select">CHỌN<span
                                                                            class="value">
                                                                            <fmt:formatNumber type="number"
                                                                                value="${product.price}" /> ₫
                                                                        </span></button>

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <button class="btn btn-success btn-add_cart">
                                <p class="btn-success_text">Thêm vào giỏ hàng</p>
                            </button>
                        </div>
                    </div>
                </div>

                <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
                <script src="/client/js/script.js"></script>

            </body>

            </html>