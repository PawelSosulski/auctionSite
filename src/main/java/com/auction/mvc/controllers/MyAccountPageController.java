package com.auction.mvc.controllers;

import com.auction.core.services.UserService;
import com.auction.data.model.UserAccount;
import com.auction.dto.LoggedUserDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.Valid;

@Controller
@RequestMapping("/my-account")
public class MyAccountPageController {

    private UserService userService;

    @Autowired
    public MyAccountPageController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping
    public String myAccountPageInit(Model model) {
        String myUsername = SecurityContextHolder.getContext().getAuthentication().getName();
        LoggedUserDTO loggedUserDTO = userService.getUserByLogin(myUsername);
        model.addAttribute("myAccount", loggedUserDTO);
        return "my-account";
    }

    @PostMapping
    public String editAccount(@Valid @ModelAttribute("myAccount") LoggedUserDTO loggedUserDTO) {
        userService.editUser(loggedUserDTO);
        return "redirect:/my-account";
    }

}
