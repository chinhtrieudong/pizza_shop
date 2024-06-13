<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
            <title>Admin Dashboard</title>

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
                            <h1 class="mt-4">Manage products</h1>
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                <li class="breadcrumb-item"><a href="/admin/product">Product</a></li>
                                <li class="breadcrumb-item active">Detail product</li>
                            </ol>
                        </nav>
                        <div class="card mt-5 w-100">
                            <div class="card-header">
                                <a class="btn btn-primary" href="/admin/product">Back</a>
                                product with id = ${product.id}
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-4">
                                        <img src="/images/product/${product.image}" class="img-fluid"
                                            alt="Product Image">
                                    </div>
                                    <div class="col-md-8">
                                        <h4>Name: <span>${product.name}</span></h4>
                                        <p>Price: <span>
                                                <td>
                                                    <fmt:formatNumber type="number" value="${product.price}" /> đ
                                                </td>
                                            </span></p>
                                        <p>Category: <span>${product.category}</span></p>
                                        <p>Quantity: <span>${product.quantity}</span></p>
                                        <p>Description: <span>${product.detailDesc}</span></p>
                                        <p>Sold: <span>${product.sold}</span></p>

                                        <div class="mt-4">
                                            <a class="btn btn-warning" href="/admin/product/update/${product.id}">Chỉnh
                                                sửa</a>
                                            <a class="btn btn-danger" href="/admin/product/delete/${product.id}">Xóa</a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>


            <script src="/admin/js/main.js"></script>
        </body>

        </html>