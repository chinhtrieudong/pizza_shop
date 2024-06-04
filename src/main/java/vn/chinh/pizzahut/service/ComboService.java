package vn.chinh.pizzahut.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.chinh.pizzahut.domain.Combo;
import vn.chinh.pizzahut.repository.ComboRepository;

@Service
public class ComboService {
    private final ComboRepository comboRepository;

    public ComboService(ComboRepository comboRepository) {
        this.comboRepository = comboRepository;
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
}
