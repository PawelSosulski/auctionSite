package com.auction.mvc.controllers;

import com.auction.core.UserValidator;
import com.auction.core.services.UserService;
import com.auction.dto.NewUserDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.awt.*;
import java.time.LocalDateTime;


@Controller
@RequestMapping("/register")
public class RegisterPageController {
    private UserService userService;
    private UserValidator userValidator;

    @Autowired
    public RegisterPageController(UserService userService, UserValidator userValidator) {
        this.userService = userService;
        this.userValidator=userValidator;
    }

    @GetMapping
    public ModelAndView prepareRegisterPage() {
        return new ModelAndView("register", "newUser", new NewUserDTO());

    }

    @PostMapping
    public String registerNewUser(@Valid @ModelAttribute("newUser") NewUserDTO newUserDTO,
                                  BindingResult result) {
        userValidator.validate(newUserDTO,result);
        if (result.hasErrors()) {
            return "register";
        }
        newUserDTO.setCreatedAt(LocalDateTime.now());
        userService.addNewUser(newUserDTO);

        return "redirect:/";
    }

}
