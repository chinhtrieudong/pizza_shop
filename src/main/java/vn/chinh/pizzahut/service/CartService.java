package vn.chinh.pizzahut.service;

import org.springframework.stereotype.Service;

import java.util.Optional;

import vn.chinh.pizzahut.domain.Cart;

import vn.chinh.pizzahut.repository.CartRepository;

@Service
public class CartService {
    private final CartRepository cartRepository;

    public CartService(CartRepository cartRepository) {
        this.cartRepository = cartRepository;
    }

    public void handleSaveCart(Cart cart) {
        this.cartRepository.save(cart);
    }

    public Optional<Cart> fetchById(long id) {
        return this.cartRepository.findById(id);
    }

    public void deleteById(long id) {
        this.cartRepository.deleteById(id);
    }
}
