package vn.chinh.pizzahut.controller.client;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import vn.chinh.pizzahut.domain.CartDetail;
import vn.chinh.pizzahut.service.ProductService;

@Controller
public class ItemController {
    private final ProductService productService;

    public ItemController(ProductService productService) {
        this.productService = productService;
    }

    @PostMapping("/add-product-to-cart/{id}")
    public String addProductToCart(@PathVariable long id, HttpServletRequest request) {
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");

        List<CartDetail> cartDetail = (List<CartDetail>) session.getAttribute("cartDetails ");
        long productId = id;
        productService.handleAddProductToCart(productId, email, session);
        return "redirect:/PIZZA";
    }

}
