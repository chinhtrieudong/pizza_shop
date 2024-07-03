package vn.chinh.pizzahut.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpSession;
import vn.chinh.pizzahut.domain.Cart;
import vn.chinh.pizzahut.domain.CartDetail;
import vn.chinh.pizzahut.domain.Order;
import vn.chinh.pizzahut.domain.OrderDetail;
import vn.chinh.pizzahut.domain.User;
import vn.chinh.pizzahut.domain.dto.OrderDTO;
import vn.chinh.pizzahut.domain.enums.OrderStatus;
import vn.chinh.pizzahut.repository.OrderDetailRepository;
import vn.chinh.pizzahut.repository.OrderRepository;

@Service
public class OrderService {
    private final OrderRepository orderRepository;
    private final CartService cartService;
    private final CartDetailService cartDetailService;
    private final OrderDetailRepository orderDetailRepository;

    OrderService(OrderRepository orderRepository, CartService cartService, CartDetailService cartDetailService,
            OrderDetailRepository orderDetailRepository) {
        this.orderRepository = orderRepository;
        this.cartService = cartService;
        this.cartDetailService = cartDetailService;
        this.orderDetailRepository = orderDetailRepository;
    }

    public void handlePlaceOrder(User user, OrderDTO orderDTO, HttpSession session) {
        Cart curCart = this.cartService.fetchByUser(user);
        if (curCart != null) {
            List<CartDetail> cartDetails = this.cartDetailService.fetchByCart(curCart);

            if (cartDetails != null) {
                Order order = new Order();
                order.setUser(user);
                order.setTotalPrice((double) session.getAttribute("totalPrice"));
                order.setReceiverName(orderDTO.getReceiverName());
                order.setReceiverPhone(orderDTO.getReceiverPhone());
                order.setReceiverAddress(orderDTO.getReceiverAddress());
                order.setReceiverEmail(orderDTO.getReceiverEmail());
                order.setStatus(OrderStatus.PENDING);
                Order curOrder = this.orderRepository.save(order);

                // save into orderDetail
                for (CartDetail cd : cartDetails) {
                    OrderDetail orderDetail = new OrderDetail();
                    orderDetail.setOrder(curOrder);
                    orderDetail.setProduct(cd.getProduct());
                    orderDetail.setPrice(cd.getPrice());
                    orderDetail.setQuantity(cd.getQuantity());
                    this.orderDetailRepository.save(orderDetail);
                }

                // delete from cartDetail
                for (CartDetail cartDetail : cartDetails) {
                    curCart.setSum(curCart.getSum() - 1);
                    this.cartDetailService.deleteById(cartDetail.getId());
                }

                // update session
                List<CartDetail> cds = this.cartDetailService.fetchByCart(curCart);
                session.setAttribute("cartDetails", cds);
                session.setAttribute("totalPrice", 0);
                session.setAttribute("sum", 0);
            }
        }
        // remove cart from session/ cartDetail/ cart
    }
}
