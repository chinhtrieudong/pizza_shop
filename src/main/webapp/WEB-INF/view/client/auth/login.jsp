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
                        <div class="row container">
                            <img class="login-panel col-md-6 p-0" src="/client/images/panel-login.jpg" alt="">
                            <div class="login-content col-md-6 col-12 p-0">
                                <p class="login-title">🍕🍕 WELCOME BACK!</p>
                                <form class="login-form " method="post" action="/login" modelAttribute="user">
                                    <c:if test="${param.error != null}">
                                        <div class="col-12 my-2 text-center" style="color: red;">
                                            Invalid email or password.
                                        </div>
                                    </c:if>
                                    <c:if test="${param.logout != null}">
                                        <div class="col-12 my-2 text-center" style="color: green;">
                                            Log out success.
                                        </div>
                                    </c:if>
                                    <div class="form-group col-12">
                                        <label class="font-weight-bold">Email *</label>
                                        <input name="username" type="email" class="form-control " />
                                    </div>
                                    <div class="form-group col-12">
                                        <label class="font-weight-bold">Password *</label>
                                        <input name="password" type="password" class="form-control " />
                                    </div>

                                    <!-- <div class="form-group col-12">
                                        <td><input type="checkbox" name="remember-me" /></td>
                                        <td>Remember Me:</td>
                                    </div> -->

                                    <div>
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                    </div>

                                    <div class="btn-login w-100 d-flex justify-content-center">
                                        <button type="submit" class="btn register-btn">Login</button>
                                    </div>
                                    <p class="redirect-to-register py-2 d-flex justify-content-center">
                                        Do not have an account?
                                        <a href="/register" class="px-1">
                                            Register now
                                        </a>
                                    </p>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <script src=" https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
                <script src="/client/js/script.js"></script>
            </body>

            </html>