<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <!doctype html>
            <html lang="en">

            <head>

                <meta charset="utf-8">
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
                <title>User manager</title>

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
                        const avatarFile = $("#avatarFile");
                        const orgImage = "${newUser.avatar}"
                        if (orgImage) {
                            const urlImage = "/admin/images/avatar/" + orgImage;
                            $("#avatarPreview").attr("src", urlImage);
                            $("#avatarPreview").css({ "display": "block" });
                            debugger
                        }
                        avatarFile.change(function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#avatarPreview").attr("src", imgURL);
                            $("#avatarPreview").css({ "display": "block" });
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
                                <h1 class="mt-4">Manage Users</h1>
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                    <li class="breadcrumb-item"><a href="/admin/user">User</a></li>
                                    <li class="breadcrumb-item active">Update User</li>
                                </ol>
                            </nav>

                            <div class="mt-5">
                                <div class="d-flex">
                                    <a class="btn btn-primary mr-2" href="/admin/user">Back</a>
                                    <h3>Update user with id = ${newUser.id}</h3>
                                </div>
                                <hr />
                                <div class="mt-3">
                                    <form:form method="POST" enctype="multipart/form-data" action="/admin/user/update"
                                        modelAttribute="newUser" class="row">
                                        <div class="col-12 col-md-6 form-group d-none">
                                            <label for="exampleInputPassword1">Id</label>
                                            <form:input path="id" type="text" class="form-control" />
                                        </div>

                                        <!-- form error -->
                                        <c:set var="emailError">
                                            <form:errors path="email" cssClass="invalid-feedback" />
                                        </c:set>
                                        <c:set var="fullNameError">
                                            <form:errors path="fullName" cssClass="invalid-feedback" />
                                        </c:set>
                                        <c:set var="addressError">
                                            <form:errors path="address" cssClass="invalid-feedback" />
                                        </c:set>
                                        <c:set var="phoneError">
                                            <form:errors path="phone" cssClass="invalid-feedback" />
                                        </c:set>

                                        <div class="col-12 col-md-6 form-group">
                                            <label for="exampleInputEmail1">Email</label>
                                            <form:input path="email" type="email"
                                                class="form-control ${not empty emailError ? 'is-invalid' : ''}" />
                                            ${emailError}
                                        </div>
                                        <div class="col-12 col-md-6 form-group">
                                            <label for="pwd" class="form-label">Full name:</label>
                                            <form:input path="fullName" type="text"
                                                class="form-control ${not empty fullNameError ? 'is-invalid' : ''}" />
                                            ${fullNameError}
                                        </div>
                                        <div class="col-12 col-md-6 form-group">
                                            <label for="exampleInputPassword1">Address</label>
                                            <form:input path="address" type="text"
                                                class="form-control ${not empty addressError ? 'is-invalid' : ''}" />
                                            ${addressError}
                                        </div>
                                        <div class="col-12 col-md-6 form-group">
                                            <label for="exampleInputPassword1">Phone</label>
                                            <form:input path="phone" type="text"
                                                class="form-control ${not empty phoneError ? 'is-invalid' : ''}" />
                                            ${phoneError}
                                        </div>
                                        <div class="col-12 col-md-6 form-group">
                                            <label for="avatarFile">Avatar</label>
                                            <input name="file" type="file" class="form-control-file" id="avatarFile" />
                                        </div>
                                        <div class="col-12 col-md-6">
                                            <label class="form-label d-block">Role:</label>
                                            <form:select class="form-select" path="role.name">
                                                <form:option value="ADMIN">ADMIN</form:option>
                                                <form:option value="USER">USER</form:option>
                                            </form:select>
                                        </div>
                                        <div class="col-12 mb-3">
                                            <img src="" style="max-height: 250px; display: none;" alt="avatar preview"
                                                id="avatarPreview">
                                        </div>
                                        <div class="col-12 mb-5">
                                            <button type="submit" class="btn btn-primary">Submit</button>
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