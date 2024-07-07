<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
                <html lang="en">

                <head>
                    <meta charset="utf-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
                    <title>Order Manager</title>

                    <link rel="stylesheet"
                        href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
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
                                    <h1 class="mt-4">Manage Orders</h1>
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                        <li class="breadcrumb-item active">Order</li>
                                    </ol>
                                </nav>
                                <div class="mt-5">
                                    <div class="d-flex justify-content-between ">
                                        <h3>Table Order</h3>
                                    </div>
                                    <hr />
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th scope="col">ID</th>
                                                <th scope="col">Name</th>
                                                <th scope="col">Price</th>
                                                <th scope="col">Phone</th>
                                                <th scope="col">Date</th>
                                                <th scope="col">Status</th>
                                                <th scope="col">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="order" items="${orders}">
                                                <tr>
                                                    <th scope="row">${order.id}</th>
                                                    <td>${order.receiverName}</td>
                                                    <td>
                                                        <fmt:formatNumber type="number" value="${order.totalPrice}" /> đ
                                                    </td>
                                                    <td>${order.receiverPhone}</td>
                                                    <td>
                                                        <fmt:formatDate type="both" value="${order.orderDate}" />
                                                    </td>
                                                    <td>${order.status}</td>
                                                    <td>
                                                        <!-- Button trigger modal -->
                                                        <button type="button" class="btn btn-danger"
                                                            data-bs-toggle="modal" data-bs-target="#exampleModal">
                                                            Delete
                                                        </button>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                    <nav aria-label="Page navigation example">
                                        <ul class="pagination justify-content-center">
                                            <li class="${ curPage eq 1 ? 'disabled page-item': 'page-item'}">
                                                <a class="page-link"
                                                    href="http://localhost:8080/admin/order?page=${curPage - 1}"
                                                    aria-label="Previous">
                                                    <span aria-hidden="true">&laquo;</span>
                                                    <span class="sr-only">Previous</span>
                                                </a>
                                            </li>
                                            <c:forEach begin="1" end="${totalPages}" varStatus="loop">
                                                <li class="page-item">
                                                    <a class="${loop.index eq curPage ? 'active page-link': 'page-link'}"
                                                        href="http://localhost:8080/admin/order?page=${loop.index}">
                                                        ${loop.index}
                                                    </a>
                                                </li>
                                            </c:forEach>
                                            <li class="${ curPage eq totalPages ? 'disabled page-item': 'page-item'}">
                                                <a class="page-link"
                                                    href="http://localhost:8080/admin/order?page=${curPage + 1}"
                                                    aria-label="Next">
                                                    <span aria-hidden="true">&raquo;</span>
                                                    <span class="sr-only">Next</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                        </div>
                    </div>


                    <!-- Modal -->
                    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                        aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-body">
                                    <h5>Delete Order</h5>
                                    <p>Are you sure you want to delete this order</p>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-outline-dark"
                                        data-bs-dismiss="modal">Cancel</button>
                                    <a id="deleteOrderLink" href="#" class="btn btn-danger">Delete</a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
                        integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
                        crossorigin="anonymous"></script>
                    <script src="/admin/js/main.js"></script>
                </body>

                </html>