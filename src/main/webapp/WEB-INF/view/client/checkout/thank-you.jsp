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
                    <div class="container-fluid thanks-wrapper">
                        <jsp:include page="../layout/header.jsp" />
                        <div class="thank-you-container text-center mt-5">
                            <div class="thank-you-icon">
                                <i class="fas fa-check-circle"></i>
                            </div>
                            <h1>Thank You for Your Order!</h1>
                            <p>Your order has been placed successfully. We appreciate your business!</p>
                            <a href="/" class="btn btn-outline-success mt-3">Back to Home</a>
                        </div>
                    </div>

                    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
                    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
                    <script src="/client/js/script.js"></script>

                </body>

                </html>