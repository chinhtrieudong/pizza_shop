<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <!doctype html>
            <html lang="en">

            <head>

                <meta charset="utf-8">
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
                <title>product manager</title>

                <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
                    integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
                    crossorigin="anonymous">
                <script defer src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"
                    integrity="sha384-rOA1PnstxnOBLzCLMcre8ybwbTmemjzdNlILg8O7z1lUkLXozs4DHonlDtnE7fpc"
                    crossorigin="anonymous"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <link rel="stylesheet" href="/admin/css/styles.css">

                <script>
                    $(document).ready(() => {
                        const imageFile = $("#imageFile");
                        const orgImage = "${newProduct.image}"
                        if (orgImage) {
                            const urlImage = "/admin/images/product/" + orgImage;
                            $("#imagePreview").attr("src", urlImage);
                            $("#imagePreview").css({ "display": "block" });
                            debugger
                        }
                        imageFile.change(function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#imagePreview").attr("src", imgURL);
                            $("#imagePreview").css({ "display": "block" });
                        });
                    });
                </script>
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
                                    <li class="breadcrumb-item active">Update product</li>
                                </ol>
                            </nav>

                            <div class="mt-5">
                                <div class="d-flex">
                                    <a class="btn btn-primary mr-2" href="/admin/product">Back</a>
                                    <h3>Update product with id = ${newProduct.id}</h3>
                                </div>
                                <hr />
                                <div class="w-100 mt-3">
                                    <form:form method="POST" action="/admin/product/create"
                                        enctype="multipart/form-data" modelAttribute="newProduct" class="row">
                                        <div class="col-12 col-md-6 form-group d-none">
                                            <label class="form-label">Id:</label>
                                            <form:input path="id" type="text" class="form-control" />
                                        </div>
                                        <div class="col-12 col-md-6 form-group">
                                            <label class="form-label">Name:</label>
                                            <form:input path="name" type="name" class="form-control" />
                                        </div>
                                        <div class="col-12 col-md-6 form-group">
                                            <label class="form-label">Price:</label>
                                            <form:input path="price" type="text" class="form-control" />
                                        </div>
                                        <div class="col-12 col-md-12 form-group">
                                            <label class="form-label">Detail description:</label>
                                            <form:textarea path="detailDesc" type="text" class="form-control" />
                                        </div>
                                        <div class="col-12 col-md-6 form-group">
                                            <label class="form-label">Quantity:</label>
                                            <form:input path="quantity" type="text" class="form-control" />
                                        </div>

                                        <div class="col-12 col-md-6 form-group">
                                            <label for="imageFile" class="form-label">Product image:</label>
                                            <input name="file" class="form-control" type="file" id="imageFile">
                                        </div>

                                        <div class="col-12 col-md-3 d-flex align-items-start">
                                            <label class="form-label m-0 mr-2 ">Category:
                                            </label>
                                            <form:select class="form-select" path="category">
                                                <form:option value="PIZZA">PIZZA</form:option>
                                                <form:option value="CHICKEN">CHICKEN</form:option>
                                                <form:option value="APPETIZER">APPETIZER</form:option>
                                                <form:option value="BEVERAGE">BEVERAGE</form:option>
                                            </form:select>
                                        </div>

                                        <div class="col-12 col-md-3 d-flex align-items-start">
                                            <label class="form-label m-0 mr-2">Combo:
                                            </label>
                                            <form:select class="form-select w-100" path="category">
                                                <form:option value="SUONGSUONG">COMBO CHẤM SƯƠNG SƯƠNG</form:option>
                                                <form:option value="VUAVAN">COMBO CHẤM VỪA VẶN</form:option>
                                                <form:option value="NONE">COMBO CHẤM NO NÊ</form:option>
                                                <form:option value="PHUPHE">COMBO CHẤM PHỦ PHÊ</form:option>
                                            </form:select>
                                        </div>

                                        <div class="col-12 col-md-6 mb-3 ">
                                            <img src="" style="max-height: 250px; display: none;" alt="image preview"
                                                id="imagePreview">
                                        </div>

                                        <div class="col-12 mb-5 ">
                                            <button type="submit" class="btn btn-success">Submit</button>
                                        </div>
                                    </form:form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <script src="/admin/js/main.js"></script>
            </body>


            </html>