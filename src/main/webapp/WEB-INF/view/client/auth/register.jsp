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
                <div class="auth-wrapper">
                    <jsp:include page="../layout/header.jsp" />
                    <div class="register-container">
                        <div class="container ">
                            <img class="register-panel" src="/client/images/panel-register.jpg" alt="">
                            <form:form class="register-form" method="post" action="/register"
                                modelAttribute="registerUser">

                                <c:set var="passwordError">
                                    <form:errors path="password" cssClass="invalid-feedback" />
                                </c:set>
                                <c:set var="confirmPasswordError">
                                    <form:errors path="confirmPassword" cssClass="invalid-feedback" />
                                </c:set>
                                <c:set var="firstNameError">
                                    <form:errors path="firstName" cssClass="invalid-feedback" />
                                </c:set>
                                <c:set var="lastNameError">
                                    <form:errors path="lastName" cssClass="invalid-feedback" />
                                </c:set>
                                <c:set var="emailError">
                                    <form:errors path="email" cssClass="invalid-feedback" />
                                </c:set>
                                <c:set var="addressError">
                                    <form:errors path="address" cssClass="invalid-feedback" />
                                </c:set>

                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label>First Name</label>
                                        <form:input path="firstName" type="text"
                                            class="form-control ${not empty firstNameError ? 'is-invalid' : ''}" />
                                        ${firstNameError}
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label>Last Name</label>
                                        <form:input path="lastName" type="text"
                                            class="form-control ${not empty lastNameError ? 'is-invalid' : ''}" />
                                        ${lastNameError}
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label>Email</label>
                                    <form:input path="email" type="email"
                                        class="form-control ${not empty emailError ? 'is-invalid' : ''}" />
                                    ${emailError}
                                </div>
                                <div class="form-group">
                                    <label>Address</label>
                                    <form:input path="address" type="text"
                                        class="form-control ${not empty addressError ? 'is-invalid' : ''}" />
                                    ${addressError}
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label>Password</label>
                                        <form:input path="password" type="password"
                                            class="form-control ${not empty passwordError ? 'is-invalid' : ''}" />
                                        ${passwordError}
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label>Confirm password</label>
                                        <form:input path="confirmPassword" type="password"
                                            class="form-control ${not empty confirmPasswordError ? 'is-invalid' : ''}" />
                                        ${confirmPasswordError}
                                    </div>
                                </div>
                                <div class="w-100 d-flex justify-content-center">
                                    <button type="submit" class="btn register-btn">Submit</button>
                                </div>

                            </form:form>
                        </div>
                    </div>
                </div>
                <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
                <script src="/client/js/script.js"></script>
            </body>

            </html>