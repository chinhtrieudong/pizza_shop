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
                <link rel="stylesheet" href="/client/css/pizza.css">
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
                                <c:forEach var="product" items="${appetizer}">
                                    <div class="col col-md-3 product-item">
                                        <div class="combo-card">
                                            <div class="product-item_header">
                                                <div class="product-img">
                                                    <img src="/images/product/${product.image}" alt="Combo Image"
                                                        class="card-img-top">
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
                                                        <span class="more-link" id="more-link-${product.id}">... xem
                                                            thêm</span>
                                                    </p>
                                                </div>

                                                <form action="/add-product-to-cart/${product.id}" method="post"
                                                    class="card-footer">
                                                    <input type="hidden" name="${_csrf.parameterName}"
                                                        value="${_csrf.token}" />
                                                    <button class="btn btn-select">CHỌN<span class="value">
                                                            <fmt:formatNumber type="number" value="${product.price}" />
                                                            ₫
                                                        </span></button>

                                                </form>
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