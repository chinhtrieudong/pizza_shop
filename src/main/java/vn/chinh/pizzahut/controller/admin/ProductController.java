package vn.chinh.pizzahut.controller.admin;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import vn.chinh.pizzahut.domain.Product;
import vn.chinh.pizzahut.service.ProductService;
import vn.chinh.pizzahut.service.UploadService;

import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ProductController {
    private final ProductService productService;
    private final UploadService uploadService;

    ProductController(ProductService productService, UploadService uploadService) {
        this.productService = productService;
        this.uploadService = uploadService;
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
        model.addAttribute("newProduct", product);
        return "admin/product/create";
    }

    @PostMapping("/admin/product/create")
    public String handleCreateProduct(@ModelAttribute("newProduct") Product newProduct,
            @RequestParam("file") MultipartFile file) {
        String fileName = this.uploadService.handleUploadFile(file, "product");
        newProduct.setImage(fileName);
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
            curProduct.setName(product.getName());
            curProduct.setCategory(product.getCategory());
            curProduct.setImage(this.uploadService.handleUploadFile(file, "product"));
            curProduct.setQuantity(product.getQuantity());
            curProduct.setCombo(product.getCombo());
            curProduct.setPrice(product.getPrice());
            curProduct.setSold(product.getSold());
            curProduct.setDetailDesc(product.getDetailDesc());

            this.productService.saveProduct(product);
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
