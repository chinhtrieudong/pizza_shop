package vn.chinh.pizzahut.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.chinh.pizzahut.domain.Combo;

@Repository
public interface ComboRepository extends JpaRepository<Combo, Long> {
    List<Combo> findAll();

    Combo save(Combo combo);

    Combo findById(long id);
}
