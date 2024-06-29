package vn.chinh.pizzahut.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import vn.chinh.pizzahut.domain.Cart;
import vn.chinh.pizzahut.domain.CartDetail;
import vn.chinh.pizzahut.domain.Product;

public interface CartDetailRepository extends JpaRepository<CartDetail, Long> {
    CartDetail findByCartAndProduct(Cart cart, Product product);

    List<CartDetail> findByCart(Cart cart);
}
