package vn.chinh.pizzahut.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomePageController {

    @GetMapping("/client/product")
    public String getMenuPage() {
        return "client/product/show";
    }

    @GetMapping("/client/product/{id}")
    public String getComboDetailPage() {
        return "client/product/detail";
    }

}
