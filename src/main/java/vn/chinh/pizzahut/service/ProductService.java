package vn.chinh.pizzahut.service;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpSession;
import vn.chinh.pizzahut.domain.Cart;
import vn.chinh.pizzahut.domain.CartDetail;
import vn.chinh.pizzahut.domain.Combo;
import vn.chinh.pizzahut.domain.Product;
import vn.chinh.pizzahut.domain.User;
import vn.chinh.pizzahut.domain.enums.ProductCategory;
import vn.chinh.pizzahut.repository.ProductRepository;

@Service
public class ProductService {
    private final ProductRepository productRepository;

    private final UserService userService;
    private final CartService cartService;
    private final CartDetailService cartDetailService;

    ProductService(ProductRepository productRepository, UserService userService, CartService cartService,
            CartDetailService cartDetailService) {
        this.productRepository = productRepository;
        this.userService = userService;
        this.cartService = cartService;
        this.cartDetailService = cartDetailService;
    }

    public void saveProduct(Product product) {
        this.productRepository.save(product);
    }

    public Page<Product> findAll(Pageable pageable) {
        return this.productRepository.findAll(pageable);
    }

    public Optional<Product> fetchProductById(long id) {
        return this.productRepository.findById(id);
    }

    public void deleteProductById(long id) {
        this.productRepository.deleteById(id);
    }

    public List<Product> fetchProductByCategoryAndCombo(ProductCategory category, Combo combo) {
        String categoryStr = category.getValue();
        return this.productRepository.findByCategoryAndCombo(categoryStr, combo);
    }

    public List<Product> fetchProductByCategory(ProductCategory category) {
        String categoryStr = category.getValue();
        return this.productRepository.findByCategory(categoryStr);
    }

    public void handleAddProductToCart(long productId, String email, HttpSession session) {
        // check user có cart chưa ? nếu chưa -> tạo cart mới
        User curUser = this.userService.fetchUserByEmail(email);
        Cart curCart = curUser.getCart();
        if (curCart == null) {
            Cart newCart = new Cart();
            newCart.setUser(curUser);
            newCart.setSum(0);

            curCart = this.cartService.handleSaveCart(newCart);
        }

        // lưu cart_detail

        Optional<Product> productOptional = this.productRepository.findById(productId);

        if (productOptional.isPresent()) {
            Product curProduct = productOptional.get();
            CartDetail curCartDetail = this.cartDetailService.findByCartAndProduct(curCart, curProduct);

            if (curCartDetail == null) {
                CartDetail newCartDetail = new CartDetail();
                newCartDetail.setCart(curCart);
                newCartDetail.setProduct(curProduct);
                newCartDetail.setPrice(curProduct.getPrice());
                newCartDetail.setQuantity(1);

                this.cartDetailService.handleSaveCartDetail(newCartDetail);

                // update cart (sum)
                int sum = curCart.getSum() + 1;
                curCart.setSum(sum);
                curCart = this.cartService.handleSaveCart(curCart);
                session.setAttribute("sum", sum);
                // session.setAttribute("cart", curCart);
            } else {
                curCartDetail.setQuantity(curCartDetail.getQuantity() + 1);
                this.cartDetailService.handleSaveCartDetail(curCartDetail);
            }

            List<CartDetail> cartDetails = this.cartDetailService.fetchByCart(curCart);
            session.setAttribute("cartDetails", cartDetails);

            double totalPrice = 0;
            for (CartDetail cartDetail : cartDetails) {
                totalPrice += cartDetail.getQuantity() * cartDetail.getPrice();
            }
            session.setAttribute("totalPrice", totalPrice);
        }
    }

    public void handleRemoveCartDetail(long cartDetailId, HttpSession session) {
        Optional<CartDetail> cartDetailOptional = this.cartDetailService.fetchById(cartDetailId);
        if (cartDetailOptional.isPresent()) {

            CartDetail curCartDetail = cartDetailOptional.get();

            // Xóa chi tiết giỏ hàng
            this.cartDetailService.deleteById(curCartDetail.getId());

            Optional<Cart> cartOptional = this.cartService.fetchById(curCartDetail.getCart().getId());
            Cart curCart = cartOptional.get();
            List<CartDetail> cartDetails = this.cartDetailService.fetchByCart(curCart);
            curCart.setCartDetails(cartDetails);

            // Cập nhật giỏ hàng hiện tại (sum)
            int newSum = curCart.getSum() - 1;
            curCart.setSum(newSum);

            if (newSum > 0) {
                this.cartService.handleSaveCart(curCart);
                session.setAttribute("sum", newSum);
            } else {
                this.cartService.deleteById(curCart.getId());
                session.setAttribute("sum", 0);
            }

            session.setAttribute("cartDetails", cartDetails);
            session.setAttribute("totalPrice", calculateTotalPrice(cartDetails));
        }
    }

    private double calculateTotalPrice(List<CartDetail> cartDetails) {
        return cartDetails.stream()
                .mapToDouble(cd -> cd.getQuantity() * cd.getPrice())
                .sum();
    }

}
