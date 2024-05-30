<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
        integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <title>Admin Dashboard</title>
</head>

<body>
    <jsp:include page="../layout/header.jsp" />
    <section id="main">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-2 d-none d-md-block px-0">
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
                                            <h3><span class="badge badge-danger badge-pill">20</span> New </h3>
                                            <h5>Users</h5>
                                        </div>
                                    </div>
                                    <div class="card-footer bg-dark">
                                        <a href="#" class="btn btn-link text-danger">Learn more</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-md-4 col-lg-3 p-4">
                                <div class="card text-white my-2 rounded">
                                    <div class="card-body bg-primary d-flex align-items-center justify-content-between">
                                        <i class="fas fa-utensils fa-2x"></i>
                                        <div class="inner-text text-right">
                                            <h3><span class="badge badge-success badge-pill">5</span> New </h3>
                                            <h5>Orders</h5>
                                        </div>
                                    </div>
                                    <div class="card-footer bg-dark">
                                        <a href="#" class="btn btn-link text-danger">Learn more</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-md-4 col-lg-3 p-4">
                                <div class="card text-white my-2 rounded">
                                    <div class="card-body bg-primary d-flex align-items-center justify-content-between">
                                        <i class="fas fa-store fa-2x"></i>
                                        <div class="inner-text text-right">
                                            <h3><span class="badge badge-info badge-pill">12</span> New </h3>
                                            <h5>Stock</h5>
                                        </div>
                                    </div>
                                    <div class="card-footer bg-dark">
                                        <a href="#" class="btn btn-link text-danger">Learn more</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-md-4 col-lg-3 p-4">
                                <div class="card text-white my-2 rounded">
                                    <div class="card-body bg-primary d-flex align-items-center justify-content-between">
                                        <i class="fas fa-truck-moving fa-2x"></i>
                                        <div class="inner-text text-right">
                                            <h3><span class="badge badge-warning badge-pill">8</span> New </h3>
                                            <h5>Deliveries</h5>
                                        </div>
                                    </div>
                                    <div class="card-footer bg-dark">
                                        <a href="#" class="btn btn-link text-danger">Learn more</a>
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
    </section>

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

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
        integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
        integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.js"></script>

    <!-- Custom scripts -->
    <script src="/admin/js/line.js"></script>
    <script src="/admin/js/sample.js"></script>
    <script src="/admin/js/pie.js"></script>
    <script src="/admin/js/main.js"></script> <!-- Include your main.js script here -->
</body>

</html>