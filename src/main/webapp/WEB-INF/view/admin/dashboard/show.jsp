<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Admin manager</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
        integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
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
            <div class="col-12 col-md-10 bg-light">
                <div class="col-12 py-5  my-3">
                    <div class="row">
                        <div class="col">
                            <h2 class="text-info">Dashboard /
                                <small class="text-muted">My Dashboard</small>
                            </h2>
                        </div>
                    </div>
                    <div class="row inform-cards">
                        <div class="col-sm-6 col-md-4 col-lg-3 p-4">
                            <div class="card text-white my-2 rounded">
                                <div class="card-body bg-primary d-flex align-items-center justify-content-between">
                                    <i class="fas fa-users fa-2x"></i>
                                    <div class="inner-text text-right">
                                        <h3><span class="badge badge-danger badge-pill">${countUsers}</span> Quantity
                                        </h3>
                                        <h5>Users</h5>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-4 col-lg-3 p-4">
                            <div class="card text-white my-2 rounded">
                                <div class="card-body bg-primary d-flex align-items-center justify-content-between">
                                    <i class="fas fa-pizza-slice fa-2x"></i>
                                    <div class="inner-text text-right">
                                        <h3><span class="badge badge-info badge-pill">${countProducts}</span> Quantity
                                        </h3>
                                        <h5>Products</h5>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-4 col-lg-3 p-4">
                            <div class="card text-white my-2 rounded">
                                <div class="card-body bg-primary d-flex align-items-center justify-content-between">
                                    <i class="fas fa-utensils fa-2x"></i>
                                    <div class="inner-text text-right">
                                        <h3><span class="badge badge-success badge-pill">${countOrders}</span> Quantity
                                        </h3>
                                        <h5>Orders</h5>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-4 col-lg-3 p-4">
                            <div class="card text-white my-2 rounded">
                                <div class="card-body bg-primary d-flex align-items-center justify-content-between">
                                    <i class="fas fa-truck-moving fa-2x"></i>
                                    <div class="inner-text text-right">
                                        <h3><span class="badge badge-warning badge-pill">${countDeliveries}</span>
                                            Quantity </h3>
                                        <h5>Deliveries</h5>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-4">
                            <canvas id="lineChart" width="400" height="400"></canvas>
                        </div>
                        <div class="col-sm-4">
                            <canvas id="sampleChart" width="400" height="400"></canvas>
                        </div>
                        <div class="col-sm-4">
                            <canvas id="pieChart" width="400" height="400"></canvas>
                        </div>
                    </div>
                </div>
            </div>
        </div>



        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.js"></script>

        <script src="/admin/js/line.js"></script>
        <script src="/admin/js/sample.js"></script>
        <script src="/admin/js/pie.js"></script>
        <script src="/admin/js/main.js"></script>
</body>

</html>