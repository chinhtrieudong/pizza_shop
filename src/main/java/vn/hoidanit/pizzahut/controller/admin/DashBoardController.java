package vn.hoidanit.pizzahut.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
class DashBoardController {
    @GetMapping("/admin")
    public String getMethodName() {
        return "admin/dashboard/show";
    }

}