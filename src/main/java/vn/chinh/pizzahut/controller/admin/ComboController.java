package vn.chinh.pizzahut.controller.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import vn.chinh.pizzahut.domain.Combo;
import vn.chinh.pizzahut.service.ComboService;
import vn.chinh.pizzahut.service.UploadService;

@Controller
public class ComboController {
    private final ComboService comboService;
    private final UploadService uploadService;

    public ComboController(ComboService comboService, UploadService uploadService) {
        this.comboService = comboService;
        this.uploadService = uploadService;
    }

    @GetMapping("/admin/combo")
    public String getComboPage(Model model, @RequestParam("page") Optional<String> pageOptional) {
        int page = 1;
        try {
            if (pageOptional.isPresent()) {
                page = Integer.parseInt(pageOptional.get());
            }
        } catch (Exception e) {
            // TODO: handle exception
        }

        Pageable pageable = PageRequest.of(page - 1, 5);
        Page<Combo> cbs = this.comboService.findAll(pageable);
        List<Combo> combos = cbs.getContent();
        model.addAttribute("combos", combos);
        model.addAttribute("curPage", page);
        model.addAttribute("totalPages", cbs.getTotalPages());
        return "admin/combo/show";
    }

    @GetMapping("/admin/combo/create")
    public String getComboCreatePage(Model model) {
        Combo combo = new Combo();
        model.addAttribute("newCombo", combo);
        return "admin/combo/create";
    }

    @PostMapping("/admin/combo/create")
    public String handleComboCreate(@ModelAttribute("newCombo") Combo newCombo,
            @RequestParam("file") MultipartFile file) {
        String fileName = this.uploadService.handleUploadFile(file, "combo");
        newCombo.setImage(fileName);
        this.comboService.saveCombo(newCombo);
        return "redirect:/admin/combo";
    }

    @GetMapping("/admin/combo/{id}")
    public String getComboDetailPage(@PathVariable long id, Model model) {
        Combo combo = this.comboService.fetchById(id);
        model.addAttribute("combo", combo);
        return "admin/combo/detail";
    }

    @GetMapping("/admin/combo/update/{id}")
    public String getComboUpdatePage(@PathVariable long id, Model model) {
        Combo combo = this.comboService.fetchById(id);
        model.addAttribute("newCombo", combo);
        return "admin/combo/update";
    }

    @PostMapping("/admin/combo/update")
    public String handleComboUpdate(@ModelAttribute("newCombo") Combo newCombo,
            @RequestParam("file") MultipartFile file) {
        Combo curCombo = this.comboService.fetchById(newCombo.getId());

        if (curCombo != null) {
            if (!file.isEmpty()) {
                curCombo.setImage(this.uploadService.handleUploadFile(file, "combo"));
            }
            curCombo.setName(newCombo.getName());
            curCombo.setDetailDesc(newCombo.getDetailDesc());
            curCombo.setPrice(newCombo.getPrice());
            curCombo.setShortName(newCombo.getShortName());

            this.comboService.saveCombo(curCombo);
        }
        return "redirect:/admin/combo";
    }

    @GetMapping("/admin/combo/delete/{id}")
    public String getComboDeletePage(@PathVariable long id, Model model) {
        Combo combo = this.comboService.fetchById(id);
        model.addAttribute("combo", combo);
        return "admin/combo/delete";
    }

    @PostMapping("/admin/combo/delete")
    public String postMethodName(@ModelAttribute("combo") Combo combo) {
        this.comboService.handleDeleteById(combo.getId());
        return "redirect:/admin/combo";
    }

}
