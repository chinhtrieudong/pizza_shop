<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
                <!DOCTYPE html>
                <html lang="vi">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Pizza Hut - Thank You</title>
                    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
                    <link rel="stylesheet"
                        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
                    <link rel="stylesheet" href="/client/css/style.css">
                </head>

                <body>
                    <div class="container-fluid thanks-wrapper px-0">
                        <jsp:include page="../layout/header.jsp" />
                        <div class="history-container mt-5">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">Sản phẩm</th>
                                        <th scope="col">Tên</th>
                                        <th scope="col">Giá cả</th>
                                        <th scope="col">Số lượng</th>
                                        <th scope="col">Thành tiền</th>
                                        <th scope="col">Trang thái</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="order" items="${orders}">
                                        <tr>
                                            <td colspan="2">Order Id = ${order.id}</td>
                                            <td colspan="3">
                                                <fmt:formatNumber type="number" value="${order.totalPrice}" /> ₫
                                            </td>
                                            <td colspan="1">${order.status}</td>
                                        </tr>
                                        <c:forEach var="orderDetail" items="${order.orderDetails}">
                                            <tr>
                                                <td class="align-middle">
                                                    <img class="product-image"
                                                        src="/admin/images/product/${orderDetail.product.image}" alt="">
                                                </td>
                                                <td class="align-middle">${orderDetail.product.name}</td>
                                                <td class="align-middle">
                                                    <fmt:formatNumber type="number" value="${orderDetail.price} " /> ₫
                                                </td class="align-middle">
                                                <td class="align-middle">${orderDetail.quantity}</td>
                                                <td colspan="2" class="align-middle">
                                                    <fmt:formatNumber type="number"
                                                        value="${orderDetail.price * orderDetail.quantity}" /> ₫
                                                </td>

                                            </tr>
                                        </c:forEach>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
                    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
                    <script src="/client/js/script.js"></script>

                </body>

                </html>