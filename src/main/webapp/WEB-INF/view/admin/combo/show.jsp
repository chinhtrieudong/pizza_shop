<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <html lang="en">

            <head>
                <meta charset="utf-8">
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
                <title>Combo manager</title>

                <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
                    integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
                    crossorigin="anonymous">
                <script defer src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"
                    integrity="sha384-rOA1PnstxnOBLzCLMcre8ybwbTmemjzdNlILg8O7z1lUkLXozs4DHonlDtnE7fpc"
                    crossorigin="anonymous"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <link rel="stylesheet" href="/admin/css/styles.css">
            </head>

            <body>
                <jsp:include page="../layout/header.jsp" />

                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-2 px-0">
                            <jsp:include page="../layout/sidebar.jsp" />
                        </div>
                        <!-- MAIN CARDS-->
                        <div class="main-container container col-12 col-md-10 bg-light">
                            <nav aria-label="breadcrumb">
                                <h1 class="mt-4">Manage combos</h1>
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                    <li class="breadcrumb-item active">Combo</li>
                                </ol>
                            </nav>
                            <div class="mt-5">
                                <div class="d-flex justify-content-between ">
                                    <h3>Table combo</h3>
                                    <a href="/admin/combo/create">
                                        <btn class="btn btn-primary">Create combo</btn>
                                    </a>
                                </div>
                                <hr />
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th scope="col">ID</th>
                                            <th scope="col">name</th>
                                            <th scope="col">price</th>
                                            <th scope="col">action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="combo" items="${combos}">
                                            <tr>
                                                <th scope="row">${combo.id}</th>
                                                <td>${combo.name}</td>
                                                <td>
                                                    <fmt:formatNumber type="number" value="${combo.price}" /> đ
                                                </td>
                                                <td>
                                                    <a href="/admin/combo/${combo.id}" class="btn btn-success">View</a>
                                                    <a href="/admin/combo/update/${combo.id}"
                                                        class="btn btn-warning">Update</a>
                                                    <a href="/admin/combo/delete/${combo.id}"
                                                        class="btn btn-danger">Delete</a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                </div>


                <div class="modal fade" id="signOutModal" tabindex="-1" role="dialog">
                    <div class="modal-dialog  modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h2>Already want to leave?</h2>
                                <button type="button" class="close" data-dismiss="modal">
                                    <span>&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <p class="lead">It is sad to see you go. Please press logout to leave.</p>
                            </div>
                            <div class="modal-footer">
                                <button class="btn btn-danger" type="button" data-dismiss="modal">Logout</button>
                                <div class="btn btn-primary" type="button">Stay</div>
                            </div>
                        </div>
                    </div>
                </div>

                <script src="/admin/js/main.js"></script>
            </body>

            </html>