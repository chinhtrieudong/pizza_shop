<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <!doctype html>
            <html lang="en">

            <head>
                <!-- Required meta tags -->
                <meta charset="utf-8">
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

                <!-- Bootstrap CSS -->
                <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
                    integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
                    crossorigin="anonymous">
                <script defer src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"
                    integrity="sha384-rOA1PnstxnOBLzCLMcre8ybwbTmemjzdNlILg8O7z1lUkLXozs4DHonlDtnE7fpc"
                    crossorigin="anonymous"></script>
                <link rel="stylesheet" href="/admin/css/styles.css">
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

                <title>User manager</title>
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
                        <div class="container col-12 col-md-10 bg-light">
                            <nav aria-label="breadcrumb">
                                <h1 class="mt-4">Manage Users</h1>
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                    <li class="breadcrumb-item active">Create Users</li>
                                </ol>
                            </nav>

                            <div class="">
                                <div class="justify-content-between">
                                    <h3>Update a user with id = ${newUser.id}</h3>
                                </div>
                                <hr />
                                <div class="mt-3">
                                    <form:form method="POST" enctype="multipart/form-data" action="/admin/user/update"
                                        modelAttribute="newUser" class="row">
                                        <div class="col-12 col-md-6 form-group d-none">
                                            <label for="exampleInputPassword1">Id</label>
                                            <form:input path="password" type="password" class="form-control"
                                                placeholder="Password" />
                                        </div>
                                        <div class="col-12 col-md-6 form-group">
                                            <label for="exampleInputEmail1">Email</label>
                                            <form:input path="email" type="email" class="form-control"
                                                placeholder="user@gmail.com" />
                                        </div>
                                        <div class="col-12 col-md-6 form-group">
                                            <label for="pwd" class="form-label">Full name:</label>
                                            <form:input path="fullName" type="text" class="form-control"
                                                placeholder="Orochi" />
                                        </div>
                                        <div class="col-12 col-md-6 form-group">
                                            <label for="exampleInputPassword1">Address</label>
                                            <form:input path="address" type="text" class="form-control"
                                                placeholder="Quảng Trị" />
                                        </div>
                                        <div class="col-12 col-md-6 form-group">
                                            <label for="exampleInputPassword1">Phone</label>
                                            <form:input path="phone" type="text" class="form-control"
                                                placeholder="053 3663 536" />
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


                <div class="modal fade" id="signOutModal" tabindex="-1" role="dialog">
                    <div class="modal-dialog modal-dialog-centered">
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

                <!-- Optional JavaScript -->
                <!-- Popper.js, Bootstrap JS -->
                <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
                    integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
                    crossorigin="anonymous"></script>
                <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
                    integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
                    crossorigin="anonymous"></script>
                <script src="/admin/js/main.js"></script>
            </body>


            </html>