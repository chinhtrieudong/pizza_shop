package vn.chinh.pizzahut.service;

import java.util.List;
import java.util.Optional;
import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpSession;
import vn.chinh.pizzahut.domain.Cart;
import vn.chinh.pizzahut.domain.CartDetail;
import vn.chinh.pizzahut.domain.Combo;
import vn.chinh.pizzahut.domain.Product;
import vn.chinh.pizzahut.domain.User;
import vn.chinh.pizzahut.domain.enums.ProductCategory;
import vn.chinh.pizzahut.repository.CartDetailRepository;
import vn.chinh.pizzahut.repository.CartRepository;
import vn.chinh.pizzahut.repository.ProductRepository;

@Service
public class ProductService {
    private final ProductRepository productRepository;
    private final CartRepository cartRepository;
    private final CartDetailRepository cartDetailRepository;
    private final UserService userService;
    private final CartService cartService;

    ProductService(ProductRepository productRepository, CartRepository cartRepository,
            CartDetailRepository cartDetailRepository, UserService userService, CartService cartService) {
        this.productRepository = productRepository;
        this.cartRepository = cartRepository;
        this.cartDetailRepository = cartDetailRepository;
        this.userService = userService;
        this.cartService = cartService;
    }

    public void saveProduct(Product product) {
        this.productRepository.save(product);
    }

    public List<Product> findAll() {
        return this.productRepository.findAll();
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

            curCart = this.cartRepository.save(newCart);
        }

        // lưu cart_detail

        Optional<Product> productOptional = this.productRepository.findById(productId);

        if (productOptional.isPresent()) {
            Product curProduct = productOptional.get();
            CartDetail curCartDetail = this.cartDetailRepository.findByCartAndProduct(curCart, curProduct);

            if (curCartDetail == null) {
                CartDetail newCartDetail = new CartDetail();
                newCartDetail.setCart(curCart);
                newCartDetail.setProduct(curProduct);
                newCartDetail.setPrice(curProduct.getPrice());
                newCartDetail.setQuantity(1);

                this.cartDetailRepository.save(newCartDetail);

                // update cart (sum)
                int sum = curCart.getSum() + 1;
                curCart.setSum(sum);
                curCart = this.cartRepository.save(curCart);
                session.setAttribute("sum", sum);
                // session.setAttribute("cart", curCart);
            } else {
                curCartDetail.setQuantity(curCartDetail.getQuantity() + 1);
                this.cartDetailRepository.save(curCartDetail);
            }

            List<CartDetail> cartDetails = this.cartDetailRepository.findByCart(curCart);
            session.setAttribute("cartDetails", cartDetails);

            double totalPrice = 0;
            for (CartDetail cartDetail : cartDetails) {
                totalPrice += cartDetail.getQuantity() * cartDetail.getPrice();
            }
            session.setAttribute("totalPrice", totalPrice);
        }
    }

    public void handleRemoveCartDetail(long cartDetailId, HttpSession session) {
        Optional<CartDetail> cartDetailOptional = this.cartDetailRepository.findById(cartDetailId);
        if (cartDetailOptional.isPresent()) {

            CartDetail curCartDetail = cartDetailOptional.get();

            // Xóa chi tiết giỏ hàng
            this.cartDetailRepository.deleteById(curCartDetail.getId());

            Optional<Cart> cartOptional = this.cartRepository.findById(curCartDetail.getCart().getId());
            Cart curCart = cartOptional.get();
            List<CartDetail> cartDetails = this.cartDetailRepository.findByCart(curCart);
            curCart.setCartDetails(cartDetails);

            // Cập nhật giỏ hàng hiện tại (sum)
            int newSum = curCart.getSum() - 1;
            curCart.setSum(newSum);

            // Xóa giỏ hàng nếu không còn chi tiết nào
            if (newSum > 0) {
                this.cartService.handleSaveCart(curCart);
                session.setAttribute("sum", newSum);
            } else {
                this.cartService.deleteById(curCart.getId());
                session.setAttribute("sum", 0);
            }

            // Lấy danh sách chi tiết giỏ hàng mới
            // List<CartDetail> cartDetails = this.cartDetailRepository.findByCart(curCart);
            session.setAttribute("cartDetails", cartDetails);

            // Tính tổng giá
            double totalPrice = cartDetails.stream()
                    .mapToDouble(cd -> cd.getQuantity() * cd.getPrice())
                    .sum();
            session.setAttribute("totalPrice", totalPrice);
        }
    }

}
