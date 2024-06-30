package vn.chinh.pizzahut.controller.client;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import vn.chinh.pizzahut.domain.Cart;
import vn.chinh.pizzahut.domain.Product;
import vn.chinh.pizzahut.domain.enums.ProductCategory;
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

        long productId = id;
        productService.handleAddProductToCart(productId, email, session);
        return "redirect:/PIZZA";
    }

    @PostMapping("/delete-cart-product/{id}")
    public String delProductFromCart(@PathVariable long id, HttpServletRequest request) {
        HttpSession session = request.getSession();
        this.productService.handleRemoveCartDetail(id, session);
        return "redirect:/";
    }

    @GetMapping("/PIZZA")
    public String getPizzaPage(Model model) {
        List<Product> pizzas = this.productService.fetchProductByCategory(ProductCategory.PIZZA);
        model.addAttribute("pizzas", pizzas);
        return "client/pizza/show";
    }

    @GetMapping("/CHICKEN_LOVER")
    public String getChickenPage(Model model) {
        List<Product> chickens = this.productService.fetchProductByCategory(ProductCategory.CHICKEN);
        model.addAttribute("chickens", chickens);
        return "client/chicken/show";
    }

    @GetMapping("/MY_BOX")
    public String getMyBoxPage(Model model) {
        return "client/chicken/show";
    }

    @GetMapping("/DRINK")
    public String getDinkPage(Model model) {
        List<Product> drinks = this.productService.fetchProductByCategory(ProductCategory.DRINK);
        model.addAttribute("drinks", drinks);
        return "client/drink/show";
    }

    @GetMapping("/STARTER")
    public String getAppetizerPage(Model model) {
        List<Product> appetizer = this.productService.fetchProductByCategory(ProductCategory.APPETIZER);
        model.addAttribute("appetizer", appetizer);
        return "client/starter/show";
    }

    @PostMapping("/confirm-checkout")
    public String confirmCheckout(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        int sum = (int) session.getAttribute("sum");
        double totalPrice = (double) session.getAttribute("totalPrice");
        model.addAttribute("sum", sum);
        model.addAttribute("totalPrice", totalPrice);
        return "client/checkout/show";
    }
}
