package vn.chinh.pizzahut.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.chinh.pizzahut.domain.Combo;
import vn.chinh.pizzahut.domain.Product;

import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
    Product save(Product product);

    List<Product> findAll();

    List<Product> findByCategoryAndCombo(String category, Combo combo);

    List<Product> findByCategory(String category);

    void deleteById(long id);
}
