package vn.chinh.pizzahut.controller.admin;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;
import vn.chinh.pizzahut.domain.Combo;
import vn.chinh.pizzahut.domain.Product;
import vn.chinh.pizzahut.service.ComboService;
import vn.chinh.pizzahut.service.ProductService;
import vn.chinh.pizzahut.service.UploadService;

import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ProductController {
    private final ProductService productService;
    private final UploadService uploadService;
    private final ComboService comboService;

    ProductController(ProductService productService, UploadService uploadService, ComboService comboService) {
        this.productService = productService;
        this.uploadService = uploadService;
        this.comboService = comboService;
    }

    @GetMapping("/admin/product")
    public String getProductPage(Model model) {
        List<Product> products = this.productService.findAll();
        model.addAttribute("products", products);
        return "admin/product/show";
    }

    @GetMapping("/admin/product/create")
    public String getProductCreatePage(Model model) {
        Product product = new Product();
        List<Combo> combos = this.comboService.fetchAllCombos();
        model.addAttribute("newProduct", product);
        model.addAttribute("combos", combos);
        return "admin/product/create";
    }

    @PostMapping("/admin/product/create")
    public String handleCreateProduct(@ModelAttribute("newProduct") @Valid Product newProduct,
            BindingResult newProductBindingResult,
            @RequestParam("file") MultipartFile file) {
        // log validation
        List<FieldError> errors = newProductBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(error.getField() + "-" + error.getDefaultMessage());
        }

        if (newProductBindingResult.hasErrors()) {
            return "admin/product/create";
        }

        String fileName = this.uploadService.handleUploadFile(file, "product");
        newProduct.setImage(fileName);
        newProduct.setCombo(this.comboService.fetchComboByShortName(newProduct.getCombo().getShortName()));
        this.productService.saveProduct(newProduct);
        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/{id}")
    public String getProductDetailPage(@PathVariable long id, Model model) {
        Product product = this.productService.fetchProductById(id);
        model.addAttribute("product", product);
        return "admin/product/detail";
    }

    @GetMapping("/admin/product/update/{id}")
    public String getProductUpdatePage(@PathVariable long id, Model model) {
        Product product = this.productService.fetchProductById(id);
        model.addAttribute("newProduct", product);
        return "admin/product/update";
    }

    @PostMapping("/admin/product/update")
    public String handleUpdateProduct(@ModelAttribute("newProduct") Product product,
            @RequestParam("file") MultipartFile file) {

        Product curProduct = this.productService.fetchProductById(product.getId());
        if (curProduct != null) {

            if (!file.isEmpty()) {
                curProduct.setImage(this.uploadService.handleUploadFile(file, "product"));
            }

            curProduct.setName(product.getName());
            curProduct.setCategory(product.getCategory());
            curProduct.setQuantity(product.getQuantity());

            Combo curCombo = this.comboService.fetchComboByShortName(product.getCombo().getShortName());
            if (curCombo == null) {
                throw new IllegalArgumentException("Combo not found: " + product.getCombo().getShortName());
            }

            curProduct.setCombo(curCombo);
            curProduct.setPrice(product.getPrice());
            curProduct.setSold(product.getSold());
            curProduct.setDetailDesc(product.getDetailDesc());

            this.productService.saveProduct(curProduct);
        }
        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/delete/{id}")
    public String getProductDeletePage(@PathVariable long id, Model model) {
        Product product = this.productService.fetchProductById(id);
        model.addAttribute("product", product);
        return "admin/product/delete";
    }

    @PostMapping("/admin/product/delete")
    public String handleDeleteProduct(@ModelAttribute("product") Product product) {
        this.productService.deleteProductById(product.getId());
        return "redirect:/admin/product";
    }
}
