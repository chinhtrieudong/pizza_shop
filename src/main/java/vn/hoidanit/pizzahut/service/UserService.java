package vn.hoidanit.pizzahut.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import vn.hoidanit.pizzahut.domain.Role;
import vn.hoidanit.pizzahut.domain.User;
import vn.hoidanit.pizzahut.repository.RoleRepository;
import vn.hoidanit.pizzahut.repository.UserRepository;

@Service
public class UserService {
    UserRepository userRepository;
    RoleRepository roleRepository;

    public UserService(UserRepository userRepository, RoleRepository roleRepository) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
    }

    public void handleSaveUser(User user) {
        this.userRepository.save(user);
    }

    public List<User> fetchAll() {
        return this.userRepository.findAll();
    }

    public Optional<Role> fetchRoleByName(String name) {
        return this.roleRepository.findByName(name);
    }

    public User fetchUserById(long id) {
        return this.userRepository.findById(id);
    }

    public void handleDeleteUserById(long id) {
        this.userRepository.deleteById(id);
    }
}
