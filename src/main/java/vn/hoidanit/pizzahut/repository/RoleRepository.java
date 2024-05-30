package vn.hoidanit.pizzahut.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import vn.hoidanit.pizzahut.domain.Role;
import java.util.Optional;

public interface RoleRepository extends JpaRepository<Role, Long> {
    Optional<Role> findByName(String name);
}
