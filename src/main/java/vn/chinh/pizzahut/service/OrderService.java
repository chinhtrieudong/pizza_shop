package vn.chinh.pizzahut.service;

import java.time.LocalTime;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
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
    private final OrderDetailRepository orderDetailRepository;
    private final CartService cartService;
    private final CartDetailService cartDetailService;

    OrderService(OrderRepository orderRepository, CartService cartService, CartDetailService cartDetailService,
            OrderDetailRepository orderDetailRepository) {
        this.orderRepository = orderRepository;
        this.cartService = cartService;
        this.cartDetailService = cartDetailService;
        this.orderDetailRepository = orderDetailRepository;
    }

    public Page<Order> findAll(Pageable pageable) {
        return this.orderRepository.findAll(pageable);
    }

    public List<Order> fetchAllOrders() {
        return this.orderRepository.findAll();
    }

    public Order saveOrder(Order order) {
        return this.orderRepository.save(order);
    }

    public Optional<Order> fetchById(long id) {
        return this.orderRepository.findById(id);
    }

    public List<Order> fetchOrdersByUser(User user) {
        return this.orderRepository.findByUser(user);
    }

    public void handleDeleteById(long id) {
        Optional<Order> orderOptional = this.orderRepository.findById(id);
        if (orderOptional.isPresent()) {
            Order curOrder = orderOptional.get();
            // xóa orderDetail
            List<OrderDetail> orderDetails = this.orderDetailRepository.findByOrder(curOrder);
            for (OrderDetail orderDetail : orderDetails) {
                this.orderDetailRepository.deleteById(orderDetail.getId());
            }
            // xóa order
            this.orderRepository.deleteById(id);
        }
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

                order.setOrderDate(new Date());
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
    }
}
