package vn.chinh.pizzahut.controller.admin;

import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import vn.chinh.pizzahut.domain.User;
import vn.chinh.pizzahut.service.UploadService;
import vn.chinh.pizzahut.service.UserService;

import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class UserController {
    private final UserService userService;
    private final UploadService uploadService;
    private final PasswordEncoder passwordEncoder;

    public UserController(UserService userService, UploadService uploadService,
            PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.uploadService = uploadService;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping("/admin/user")
    public String getUserPage(Model model) {
        List<User> users = this.userService.fetchAll();
        model.addAttribute("users", users);
        return "admin/user/show";
    }

    @GetMapping("/admin/user/create")
    public String getUserCreatePage(Model model) {
        User user = new User();
        model.addAttribute("newUser", user);
        return "admin/user/create";
    }

    @PostMapping("/admin/user/create")
    public String handleCreateUser(@ModelAttribute("newUser") User newUser, @RequestParam("file") MultipartFile file) {

        String avatar = uploadService.handleUploadFile(file, "avatar");
        String hashPassword = passwordEncoder.encode(newUser.getPassword());

        newUser.setPassword(hashPassword);
        newUser.setAvatar(avatar);
        newUser.setRole(this.userService.fetchRoleByName(newUser.getRole().getName()).get());
        this.userService.handleSaveUser(newUser);

        return "redirect:/admin/user";
    }

    @GetMapping("/admin/user/update/{id}")
    public String getUserUpdatePage(Model model, @PathVariable long id) {
        User user = this.userService.fetchUserById(id);
        model.addAttribute("newUser", user);
        return "admin/user/update";
    }

    @PostMapping("/admin/user/update")
    public String handleUpdateUser(@ModelAttribute("newUser") User user, @RequestParam("file") MultipartFile file) {
        User curUser = this.userService.fetchUserById(user.getId());
        String fileName = this.uploadService.handleUploadFile(file, "avatar");

        curUser.setEmail(user.getEmail());
        curUser.setAddress(user.getAddress());
        curUser.setFullName(user.getFullName());
        curUser.setRole(user.getRole());
        curUser.setPhone(user.getPhone());
        curUser.setAvatar(fileName);

        this.userService.handleSaveUser(curUser);

        return "redirect:/admin/user";

    }

    @GetMapping("/admin/user/{id}")
    public String getUserDetailPage(@PathVariable("id") long id, Model model) {
        User user = this.userService.fetchUserById(id);
        model.addAttribute("user", user);
        return "admin/user/detail";
    }

    @GetMapping("/admin/user/delete/{id}")
    public String getUserDeletePage(Model model, @PathVariable("id") long id) {
        User curUser = this.userService.fetchUserById(id);
        model.addAttribute("user", curUser);
        return "admin/user/delete";
    }

    @PostMapping("/admin/user/delete")
    public String handleDeleteUser(@ModelAttribute("user") User user) {
        this.userService.handleDeleteUserById(user.getId());
        return "redirect:/admin/user";
    }

}
