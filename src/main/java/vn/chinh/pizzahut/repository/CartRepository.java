package vn.chinh.pizzahut.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import vn.chinh.pizzahut.domain.Cart;
import vn.chinh.pizzahut.domain.User;

public interface CartRepository extends JpaRepository<Cart, Long> {
    Cart findByUser(User user);

    Cart save(Cart cart);
}
