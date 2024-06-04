<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <div class="col-lg-3 cart-container">
        <div class="cart">
            <div class="cart-header">
                <h2 class="text-center cart-header_title">Giỏ Hàng</h2>
            </div>
            <div class="cart-content">
                <div class="cart-content_notify alert alert-info text-center">Không có sản phẩm trong giỏ hàng</div>
                <!-- <div class="cart-items">
                    <div class="cart-item d-flex justify-content-between align-items-center">
                        <div class="d-flex align-items-center">
                            <img src="path/to/image.jpg" class="img-thumbnail" alt="Product Image"
                                style="width: 80px; height: 80px;">
                            <div class="ml-3">
                                <h5>Cánh Gà Nướng BBQ (4 miếng)</h5>
                                <p>119,000đ</p>
                            </div>
                        </div>
                        <button class="btn btn-danger btn-sm">Thêm</button>
                    </div>
                </div> -->
            </div>

            <div class="cart-footer">
                <div class="voucher-section text-center">
                    <div class="footer-btn_vourcher"><button class="btn btn-voucher">SỬ DỤNG VOUCHER</button></div>
                    <p class="add-food">Thêm món Yêu thích</p>
                </div>

                <div id="favoriteCarousel" class="carousel slide" data-ride="carousel">

                    <div class="carousel-inner shadow-sm">
                        <div class="carousel-item  active">
                            <div class="favorite-item text-center">
                                <img src="/client/images/pizzas/delight1.jpg" class="favorite-img" alt="">
                                <div class="favorite-item_info">
                                    <span class="favorite-item_name">Món Yêu Thích</span>
                                    <span class="favorite-item_price">89,000đ</span>
                                </div>
                                <button class="btn btn-success">Thêm</button>
                            </div>
                        </div>
                        <div class="carousel-item ">
                            <div class="favorite-item text-center">
                                <img src="/client/images/pizzas/delight1.jpg" class="favorite-img" alt="">
                                <div class="favorite-item_info">
                                    <span class="favorite-item_name">Món Yêu Thích</span>
                                    <span class="favorite-item_price">89,000đ</span>
                                </div>
                                <button class="btn btn-success">Thêm</button>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-indicators">
                        <button class="carousel-indicator_btn" type="button" data-bs-target="#carouselExampleIndicators"
                            data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                        <button class="carousel-indicator_btn" type="button" data-bs-target="#carouselExampleIndicators"
                            data-bs-slide-to="1" aria-label="Slide 2"></button>
                    </div>
                </div>
                <div class="cart-summary mt-4">
                    <p>Tổng: <span class="value">0đ</span></p>
                    <p>Giảm T.Viên: <span class="value">(0đ)</span></p>
                    <p>Giảm K.mại: <span class="value">(0đ)</span></p>
                    <p>Phí Giao Hàng: <span class="value">0đ</span></p>
                </div>
                <div class="text-center footer-btn_checkout">
                    <button class="btn btn-primary btn-checkout">THANH TOÁN <span class="value">0đ</span></button>
                </div>
            </div>
        </div>
    </div>
    </div>