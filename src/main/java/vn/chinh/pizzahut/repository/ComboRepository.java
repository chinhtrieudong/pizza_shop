package vn.chinh.pizzahut.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.chinh.pizzahut.domain.Combo;

@Repository
public interface ComboRepository extends JpaRepository<Combo, Long> {
    Page<Combo> findAll(Pageable pageable);

    Combo save(Combo combo);

    Combo findById(long id);

    Combo findByShortName(String shortName);

    void deleteById(long id);

}
