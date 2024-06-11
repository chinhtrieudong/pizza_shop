package vn.chinh.pizzahut.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.chinh.pizzahut.domain.Combo;
import vn.chinh.pizzahut.domain.Product;
import vn.chinh.pizzahut.domain.enums.ProductCategory;
import vn.chinh.pizzahut.repository.ProductRepository;

@Service
public class ProductService {
    private final ProductRepository productRepository;

    ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    public void saveProduct(Product product) {
        this.productRepository.save(product);
    }

    public List<Product> findAll() {
        return this.productRepository.findAll();
    }

    public Product fetchProductById(long id) {
        return this.productRepository.findById(id);
    }

    public void deleteProductById(long id) {
        this.productRepository.deleteById(id);
    }

    public List<Product> fetchProductByCategoryAndCombo(ProductCategory category, Combo combo) {
        String categoryStr = category.getValue();
        return this.productRepository.findByCategoryAndCombo(categoryStr, combo);
    }
}
