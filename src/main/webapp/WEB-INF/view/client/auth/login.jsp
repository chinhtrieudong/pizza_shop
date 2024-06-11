<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <!DOCTYPE html>
            <html>

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
                <jsp:include page="../layout/header.jsp" />
                <div class="register-container">
                    <div class="container">
                        <div class="row">
                            <img class="login-panel col-md-6 p-0" src="/admin/images/panel-login.jpg" alt="">
                            <div class="login-content col-md-6 col-12 p-0">
                                <p class="login-title">🍕🍕 WELCOME BACK!</p>
                                <form:form class="login-form " method="post" action="/login" modelAttribute="user">
                                    <!-- <c:set var="emailError">
                                        <form:errors path="email" cssClass="invalid-feedback" />
                                    </c:set>
                                    <c:set var="passwordError">
                                        <form:errors path="password" cssClass="invalid-feedback" />
                                    </c:set> -->

                                    <div class="form-group col-12">
                                        <label class="font-weight-bold">Email *</label>
                                        <form:input path="email" type="email"
                                            class="form-control ${not empty emailError ? 'is-invalid' : ''}" />
                                        <!-- ${emailError} -->
                                    </div>
                                    <div class="form-group col-12">
                                        <label class="font-weight-bold">Password *</label>
                                        <form:input path="password" type="password"
                                            class="form-control ${not empty passwordError ? 'is-invalid' : ''}" />
                                        <!-- ${passwordError} -->
                                    </div>

                                    <div class="w-100 d-flex justify-content-center">
                                        <button type="submit" class="btn register-btn">Login</button>
                                    </div>
                                </form:form>
                            </div>
                        </div>
                    </div>
                </div>
                <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
                <script src="/client/js/script.js"></script>
            </body>

            </html>