<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <html lang="en">

            <head>
                <meta charset="utf-8">
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
                <title>Product manager</title>

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
                                <h1 class="mt-4">Manage Products</h1>
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                    <li class="breadcrumb-item active">Product</li>
                                </ol>
                            </nav>
                            <div class="mt-5">
                                <div class="d-flex justify-content-between ">
                                    <h3>Table product</h3>
                                    <div>
                                        <a href="/admin/product/create" class="btn btn-primary">Create product
                                        </a>
                                    </div>
                                </div>
                                <hr />
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th scope="col">ID</th>
                                            <th colspan="2" scope="col">name</th>
                                            <th scope="col">price</th>
                                            <th scope="col">quantity</th>
                                            <th colspan="2" scope="col">category</th>
                                            <th scope="col">action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="product" items="${products}">
                                            <tr>
                                                <th scope="row">${product.id}</th>
                                                <td colspan="2">${product.name}</td>
                                                <td>
                                                    <fmt:formatNumber type="number" value="${product.price}" /> đ
                                                </td>
                                                <td>${product.quantity}</td>
                                                <td colspan="2">${product.category}</td>
                                                <td colspan="2">
                                                    <a href="/admin/product/${product.id}"
                                                        class="btn btn-success">View</a>
                                                    <a href="/admin/product/update/${product.id}"
                                                        class="btn btn-warning">Update</a>
                                                    <a href="/admin/product/delete/${product.id}"
                                                        class="btn btn-danger">Delete</a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                <nav aria-label="Page navigation example">
                                    <ul class="pagination justify-content-center">
                                        <li class="${ curPage eq 1 ? 'disabled page-item': 'page-item'}">
                                            <a class="page-link"
                                                href="http://localhost:8080/admin/product?page=${curPage - 1}"
                                                aria-label="Previous">
                                                <span aria-hidden="true">&laquo;</span>
                                                <span class="sr-only">Previous</span>
                                            </a>
                                        </li>
                                        <c:forEach begin="1" end="${totalPages}" varStatus="loop">
                                            <li class="page-item">
                                                <a class="${loop.index eq curPage ? 'active page-link': 'page-link'}"
                                                    href="http://localhost:8080/admin/product?page=${loop.index}">
                                                    ${loop.index}
                                                </a>
                                            </li>
                                        </c:forEach>
                                        <li class="${ curPage eq totalPages ? 'disabled page-item': 'page-item'}">
                                            <a class="page-link"
                                                href="http://localhost:8080/admin/product?page=${curPage + 1}"
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

                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="/admin/js/main.js"></script>
            </body>

            </html>