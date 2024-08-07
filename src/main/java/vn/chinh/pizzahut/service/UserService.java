package vn.chinh.pizzahut.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import vn.chinh.pizzahut.domain.Role;
import vn.chinh.pizzahut.domain.User;
import vn.chinh.pizzahut.domain.dto.RegisterDTO;
import vn.chinh.pizzahut.domain.enums.OrderStatus;
import vn.chinh.pizzahut.repository.OrderRepository;
import vn.chinh.pizzahut.repository.ProductRepository;
import vn.chinh.pizzahut.repository.RoleRepository;
import vn.chinh.pizzahut.repository.UserRepository;

@Service
public class UserService {
    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
    private final OrderRepository orderRepository;
    private final ProductRepository productRepository;

    public UserService(UserRepository userRepository, RoleRepository roleRepository, OrderRepository orderRepository,
            ProductRepository productRepository) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
        this.orderRepository = orderRepository;
        this.productRepository = productRepository;
    }

    public void handleSaveUser(User user) {
        this.userRepository.save(user);
    }

    public List<User> fetchAll() {
        return this.userRepository.findAll();
    }

    public Role fetchRoleByName(String name) {
        return this.roleRepository.findByName(name);
    }

    public User fetchUserById(long id) {
        return this.userRepository.findById(id);
    }

    public void handleDeleteUserById(long id) {
        this.userRepository.deleteById(id);
    }

    public User RegisterDTOtoUser(RegisterDTO registerDTO) {
        User newUser = new User();
        newUser.setFullName(registerDTO.getFirstName() + " " + registerDTO.getLastName());
        newUser.setEmail(registerDTO.getEmail());
        newUser.setAddress(registerDTO.getAddress());
        return newUser;
    }

    public boolean checkEmailExists(String email) {
        return this.userRepository.existsByEmail(email);
    }

    public User getUserByUsername(String email) {
        return this.userRepository.findByEmail(email);
    }

    public User fetchUserByEmail(String email) {
        return this.userRepository.findByEmail(email);
    }

    public void save(User user) {
        this.userRepository.save(user);
    }

    public long countUsers() {
        return this.userRepository.count();
    }

    public long countProducts() {
        return this.productRepository.count();
    }

    public long countOrders() {
        return this.orderRepository.count();
    }

    public long countDeliveries() {
        return this.orderRepository.countByStatus(OrderStatus.PROCESSING);
    }
}
