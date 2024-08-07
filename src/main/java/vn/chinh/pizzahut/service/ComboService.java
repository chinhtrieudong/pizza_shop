package vn.chinh.pizzahut.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import vn.chinh.pizzahut.domain.Combo;
import vn.chinh.pizzahut.repository.ComboRepository;

@Service
public class ComboService {
    private final ComboRepository comboRepository;

    public ComboService(ComboRepository comboRepository) {
        this.comboRepository = comboRepository;
    }

    public Page<Combo> findAll(Pageable pageable) {
        return this.comboRepository.findAll(pageable);
    }

    public List<Combo> fetchAllCombos() {
        return this.comboRepository.findAll();
    }

    public Combo saveCombo(Combo combo) {
        return this.comboRepository.save(combo);
    }

    public Combo fetchById(long id) {
        return this.comboRepository.findById(id);
    }

    public void handleDeleteById(long id) {
        this.comboRepository.deleteById(id);
    }

    public Combo fetchComboByShortName(String shortName) {
        return this.comboRepository.findByShortName(shortName);
    }
}
