package vn.chinh.pizzahut.service;

import org.springframework.stereotype.Service;

import java.util.Optional;

import vn.chinh.pizzahut.domain.Cart;
import vn.chinh.pizzahut.domain.User;
import vn.chinh.pizzahut.repository.CartRepository;

@Service
public class CartService {
    private final CartRepository cartRepository;

    public CartService(CartRepository cartRepository) {
        this.cartRepository = cartRepository;
    }

    public Cart handleSaveCart(Cart cart) {
        return this.cartRepository.save(cart);
    }

    public Optional<Cart> fetchById(long id) {
        return this.cartRepository.findById(id);
    }

    public Cart fetchByUser(User user) {
        return this.cartRepository.findByUser(user);
    }

    public void deleteById(long id) {
        this.cartRepository.deleteById(id);
    }

}
