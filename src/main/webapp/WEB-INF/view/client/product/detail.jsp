<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="vi">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Pizza Hut Ordering Interface</title>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link rel="stylesheet" href="/client/css/style.css">
        <link rel="stylesheet" href="/client/css/detail.css">
    </head>

    <body>
        <div class="detail-container container-fluid">
            <jsp:include page="../layout/header.jsp" />
            <div class="container main-container">
                <a class="btn-back" href="/client/product">
                    <i class="back-icon fas fa-less-than"></i>
                    <p class="back-text">
                        QUAY LẠI
                    </p>
                </a>

                <div class="combo-body">
                    <div class="combo-info">
                        <h6 class="combo-name">COMBO CHẤM SƯƠNG SƯƠNG</h6>
                        <p class="combo-detail">01 Pizza Rau Củ Nướng Phô Mai/ Hải Sản Vi Vu (Kèm Xốt Tartar)/
                            Gà Giòn Rộp Rộp (Kèm Xốt Phô Mai) (Cỡ Vừa); 01 Khoai Tây Chiên/ Bánh Cuộn Phô Mai/
                            Bánh Mì Bơ Tỏi; 02 Ly/Lon Nước Ngọt/ Aquafina</p>
                        <div class="cost-detail">
                            <div class="combo-price">
                                <p class="price-label">Giá COMBO:</p>
                                <span class="w-36"></span>
                                <p class="price-value">269,000 ₫</p>
                            </div>
                            <div class="combo-fee">
                                <p class="price-label">Phí Giao Hàng:</p>
                                <span class="w-36"><i class="fas fa-circle-exclamation"></i></span>
                                <p class="price-value">22,000 ₫</p>
                            </div>
                        </div>
                    </div>
                    <div class="combo-image">
                        <img src="/admin/images/product/deals/deals1.jpg" alt="Combo Image" class="combo-image_style">
                    </div>
                </div>
                <div class="collapse-item">
                    <div id="accordion">
                        <div class="card">
                            <div class="card-header" id="headingOne">
                                <button class="btn btn-link" data-toggle="collapse" data-target="#collapseOne"
                                    aria-expanded="true" aria-controls="collapseOne">
                                    Chọn pizza
                                </button>
                                <i class="fa-solid fa-plus icon-add"></i>
                            </div>

                            <div id="collapseOne" class="collapse show" aria-labelledby="headingOne"
                                data-parent="#accordion">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col col-md-3 product-item">
                                            <div class="combo-card">
                                                <div class="product-item_header">
                                                    <div class="product-img">
                                                        <img src="/admin/images/product/deals/deals1.jpg"
                                                            alt="Combo Image" class="card-img-top">
                                                    </div>
                                                    <div class="product-name">
                                                        <span class="card-title">Pizza Gà Giòn Rộp Rộp</span>

                                                    </div>
                                                </div>
                                                <div class="card-body">
                                                    <div class="card-body_info">
                                                        <p class="card-body_text">
                                                            Tuyệt Phẩm Từ Gà Popcorn Giòn Rụm, Hành Tây Và Nấm Tươi Trên
                                                            Lớp Phô Mai Cheddar Béo Ngậy (Kèm Xốt Phô Mai)
                                                            <span class="more-link">...xem thêm</span>
                                                        </p>
                                                    </div>

                                                    <div class="card-footer">
                                                        <button class="btn btn-select">CHỌN<span class="value">0
                                                                ₫</span></button>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col col-md-3 product-item">
                                            <div class="combo-card">
                                                <div class="product-item_header">
                                                    <div class="product-img">
                                                        <img src="/admin/images/product/deals/deals1.jpg"
                                                            alt="Combo Image" class="card-img-top">
                                                    </div>
                                                    <div class="product-name">
                                                        <span class="card-title">Pizza Gà Giòn Rộp Rộp</span>

                                                    </div>
                                                </div>
                                                <div class="card-body">
                                                    <p class="card-body_text">Tuyệt Phẩm Từ Gà Popcorn Giòn Rụm, Hành
                                                        Tây Và
                                                        Nấm Tươi Trên Lớp Phô Mai Cheddar Béo Ngậy (Kèm Xốt Phô Mai)
                                                    </p>
                                                    <div class="card-footer">
                                                        <button class="btn btn-select">CHỌN<span class="value">0
                                                                ₫</span></button>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col col-md-3 product-item">
                                            <div class="combo-card">
                                                <div class="product-item_header">
                                                    <div class="product-img">
                                                        <img src="/admin/images/product/deals/deals1.jpg"
                                                            alt="Combo Image" class="card-img-top">
                                                    </div>
                                                    <div class="product-name">
                                                        <span class="card-title">Pizza Gà Giòn Rộp Rộp</span>

                                                    </div>
                                                </div>
                                                <div class="card-body">
                                                    <p class="card-body_text">Tuyệt Phẩm Từ Gà Popcorn Giòn Rụm, Hành
                                                        Tây Và
                                                        Nấm Tươi Trên Lớp Phô Mai Cheddar Béo Ngậy (Kèm Xốt Phô Mai)
                                                    </p>
                                                    <div class="card-footer">
                                                        <button class="btn btn-select">CHỌN<span class="value">0
                                                                ₫</span></button>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col col-md-3 product-item">
                                            <div class="combo-card">
                                                <div class="product-item_header">
                                                    <div class="product-img">
                                                        <img src="/admin/images/product/deals/deals1.jpg"
                                                            alt="Combo Image" class="card-img-top">
                                                    </div>
                                                    <div class="product-name">
                                                        <span class="card-title">Pizza Gà Giòn Rộp Rộp</span>

                                                    </div>
                                                </div>
                                                <div class="card-body">
                                                    <p class="card-body_text">Tuyệt Phẩm Từ Gà Popcorn Giòn Rụm, Hành
                                                        Tây Và
                                                        Nấm Tươi Trên Lớp Phô Mai Cheddar Béo Ngậy (Kèm Xốt Phô Mai)
                                                    </p>
                                                    <div class="card-footer">
                                                        <button class="btn btn-select">CHỌN<span class="value">0
                                                                ₫</span></button>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header" id="headingTwo">

                                <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseTwo"
                                    aria-expanded="false" aria-controls="collapseTwo">
                                    Chọn món ăn kèm
                                </button>
                                <i class="fa-solid fa-plus icon-add"></i>
                            </div>
                            <div id="collapseTwo" class="collapse " aria-labelledby="headingTwo"
                                data-parent="#accordion">
                                <div class="card-body">
                                    Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry
                                    richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor
                                    brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt
                                    aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et.
                                    Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente
                                    ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer
                                    farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them
                                    accusamus labore sustainable VHS.
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header" id="headingThree">

                                <button class="btn btn-link collapsed" data-toggle="collapse"
                                    data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                    Chọn thức uống
                                </button>
                                <i class="fa-solid fa-plus icon-add"></i>
                            </div>
                            <div id="collapseThree" class="collapse" aria-labelledby="headingThree"
                                data-parent="#accordion">
                                <div class="card-body">
                                    Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry
                                    richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor
                                    brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt
                                    aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et.
                                    Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente
                                    ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer
                                    farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them
                                    accusamus labore sustainable VHS.
                                </div>
                            </div>
                        </div>
                    </div>
                    <button class="btn btn-success btn-add_cart">
                        <p class="btn-success_text">Thêm vào giỏ hàng</p>
                    </button>
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="/client/js/script.js"></script>

    </body>

    </html>