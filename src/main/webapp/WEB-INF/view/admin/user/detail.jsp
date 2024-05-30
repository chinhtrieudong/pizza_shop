<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Product Detail</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    </head>

    <body>
        <jsp:include page="../layout/header.jsp" />
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-2 px-0">
                    <jsp:include page="../layout/sidebar.jsp" />
                </div>
                <div class="col-12 col-md-10 bg-light">
                    <div class="col-12  py-5 my-3">
                        <div class="row flex-column ">
                            <h1 class="mt-4">Manage Users</h1>
                            <ol class="breadcrumb mb-4">
                                <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                <li class="breadcrumb-item active">Create Users</li>
                            </ol>
                        </div>
                        <div class="card  mt-5 w-100">

                            <div class="card-header">
                                User with id = ${user.id}
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-4">
                                        <img src="/admin/images/avatar/${user.avatar}" class="img-fluid"
                                            alt="Product Image">
                                    </div>
                                    <div class="col-md-8">
                                        <h4>Full name: <span>${user.fullName}</span></h4>
                                        <p>Email: <span>${use.email}</span></p>
                                        <p>Phone number: <span>${user.phone}</span></p>
                                        <p>Address: <span>${user.address}</span></p>
                                        <p>Role: <span>${user.role.name}</span></p>
                                        <div class="mt-4">
                                            <button class="btn btn-primary"><a class="text-decoration-none text-white"
                                                    href="/admin/user/update/${user.id}">Chỉnh sửa</a></button>
                                            <button class="btn btn-danger">Xóa</button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="/admin/js/main.js"></script>
    </body>

    </html>