package com.auction.mvc.controllers;

import com.auction.core.services.AuctionService;
import com.auction.core.services.CategoryService;
import com.auction.core.services.UserService;
import com.auction.core.validators.AuctionAddValidator;
import com.auction.data.model.UserAccount;
import com.auction.dto.AuctionDTO;
import com.auction.dto.LoggedUserDTO;
import com.auction.utils.bean.UserComponent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.server.Session;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;

@Controller
@RequestMapping("/auction-add")
public class AddAuctionController {
    private CategoryService categoryService;
    private AuctionService auctionService;
    private AuctionAddValidator auctionValidator;
    private UserService userService;

    @Autowired
    public AddAuctionController(CategoryService categoryService,
                                AuctionService auctionService,
                                AuctionAddValidator auctionValidator,
                                UserService userService) {
        this.categoryService = categoryService;
        this.auctionService = auctionService;
        this.auctionValidator = auctionValidator;
        this.userService = userService;

    }




    @GetMapping
    public ModelAndView addAuctionInitPage(Model model) {

        model.addAttribute("categories", categoryService.getCategoriesMap());
        return new ModelAndView("add-auction", "newAuction", new AuctionDTO());
    }

    @PostMapping
    public String addNewAuction(@Valid @ModelAttribute("newAuction") AuctionDTO auctionDTO,
                                BindingResult result) {
        auctionValidator.validate(auctionDTO,result);
        if (result.hasErrors()) {
            return "add-auction";
        }
        String sellerUsername = SecurityContextHolder.getContext().getAuthentication().getName();
        LoggedUserDTO loggedUserDTO = userService.getUserByLogin(sellerUsername);
        auctionDTO.setSellerId(loggedUserDTO.getId());
        Long auctionId = auctionService.addAuction(auctionDTO);
        return "redirect:/auction/" + auctionId;
    }
}
