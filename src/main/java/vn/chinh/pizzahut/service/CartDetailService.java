package vn.chinh.pizzahut.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import vn.chinh.pizzahut.domain.Cart;
import vn.chinh.pizzahut.domain.CartDetail;
import vn.chinh.pizzahut.domain.Product;
import vn.chinh.pizzahut.repository.CartDetailRepository;

@Service
public class CartDetailService {
    private final CartDetailRepository cartDetailRepository;

    public CartDetailService(CartDetailRepository cartDetailRepository) {
        this.cartDetailRepository = cartDetailRepository;
    }

    public Optional<CartDetail> fetchCartDetailsById(long id) {
        return this.cartDetailRepository.findById(id);
    }

    public void deleteById(long id) {
        this.cartDetailRepository.deleteById(id);
    }

    public CartDetail findByCartAndProduct(Cart cart, Product product) {
        return this.cartDetailRepository.findByCartAndProduct(cart, product);
    }

    public CartDetail handleSaveCartDetail(CartDetail cartDetail) {
        return this.cartDetailRepository.save(cartDetail);
    }

    public List<CartDetail> fetchByCart(Cart cart) {
        return this.cartDetailRepository.findByCart(cart);
    }

    public Optional<CartDetail> fetchById(long id) {
        return this.cartDetailRepository.findById(id);
    }
}
