package vn.chinh.pizzahut.controller.client;

import java.net.http.HttpRequest;
import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import vn.chinh.pizzahut.domain.Cart;
import vn.chinh.pizzahut.domain.Combo;
import vn.chinh.pizzahut.domain.Order;
import vn.chinh.pizzahut.domain.Product;
import vn.chinh.pizzahut.domain.User;
import vn.chinh.pizzahut.domain.dto.RegisterDTO;
import vn.chinh.pizzahut.domain.enums.ProductCategory;
import vn.chinh.pizzahut.service.ComboService;
import vn.chinh.pizzahut.service.OrderService;
import vn.chinh.pizzahut.service.ProductService;
import vn.chinh.pizzahut.service.UserService;

import org.springframework.web.bind.annotation.PostMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomePageController {
    private final UserService userService;
    private final PasswordEncoder passwordEncoder;
    private final ComboService comboService;
    private final OrderService orderService;
    private final ProductService productService;

    public HomePageController(UserService userService, PasswordEncoder passwordEncoder, ComboService comboService,
            ProductService productService, OrderService orderService) {
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
        this.comboService = comboService;
        this.productService = productService;
        this.orderService = orderService;
    }

    @GetMapping("/")
    public String getMenuPage(Model model) {
        model.addAttribute("cart", new Cart());
        List<Combo> combos = this.comboService.fetchAllCombos();
        model.addAttribute("combos", combos);
        return "client/combo/show";
    }

    @GetMapping("/menu/combo/{id}")
    public String getComboDetailPage(@PathVariable long id, Model model) {
        Combo combo = this.comboService.fetchById(id);
        List<Product> pizzas = this.productService.fetchProductByCategoryAndCombo(ProductCategory.PIZZA, combo);
        List<Product> appetizers = this.productService.fetchProductByCategoryAndCombo(ProductCategory.APPETIZER,
                combo);
        List<Product> drinks = this.productService.fetchProductByCategoryAndCombo(ProductCategory.DRINK, combo);
        model.addAttribute("combo", combo);
        model.addAttribute("pizzas", pizzas);
        model.addAttribute("appetizers", appetizers);
        model.addAttribute("drinks", drinks);
        return "client/combo/detail";
    }

    @GetMapping("/register")
    public String getRegisterPage(Model model) {
        model.addAttribute("registerUser", new RegisterDTO());
        return "client/auth/register";
    }

    @PostMapping("/register")
    public String handleRegisterUser(@ModelAttribute("registerUser") @Valid RegisterDTO resRegisterDTO,
            BindingResult registerBindingResult) {
        List<FieldError> errors = registerBindingResult.getFieldErrors();

        for (FieldError error : errors) {
            System.out.println(">>>" + error.getField() + " - " + error.getDefaultMessage());
        }

        if (registerBindingResult.hasErrors()) {
            return "client/auth/register";
        }

        User newUser = this.userService.RegisterDTOtoUser(resRegisterDTO);

        String hashPassword = this.passwordEncoder.encode(resRegisterDTO.getPassword());
        newUser.setPassword(hashPassword);
        newUser.setRole(this.userService.fetchRoleByName("USER"));

        this.userService.handleSaveUser(newUser);
        return "redirect:/login";
    }

    @GetMapping("/login")
    public String getLoginPage(Model model) {
        return "client/auth/login";
    }

    @GetMapping("/access-deny")
    public String getAccessDenyPage(Model model) {
        return "client/auth/deny";
    }

    @GetMapping("/order-history")
    public String getOrderHistoryPage(Model model, HttpServletRequest request) {
        User user = new User();
        HttpSession session = request.getSession();
        long userId = (long) session.getAttribute("userId");
        user.setId(userId);

        List<Order> orders = this.orderService.fetchOrdersByUser(user);
        model.addAttribute("orders", orders);
        return "client/checkout/order-history";
    }

}
