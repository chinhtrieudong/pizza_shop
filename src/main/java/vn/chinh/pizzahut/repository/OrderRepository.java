package vn.chinh.pizzahut.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.chinh.pizzahut.domain.Order;
import vn.chinh.pizzahut.domain.User;
import vn.chinh.pizzahut.domain.enums.OrderStatus;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {
    long countByStatus(OrderStatus status);

    List<Order> findByUser(User user);

    Page<Order> findAll(Pageable pageable);
}
