package com.auction.mvc.controllers;

import com.auction.core.services.AuctionService;
import com.auction.core.services.CategoryService;
import com.auction.core.services.UserService;
import com.auction.core.validators.AuctionAddValidator;
import com.auction.dto.AuctionDTO;
import com.auction.dto.LoggedUserDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

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

        model.addAttribute("categories", categoryService.findAllCategory());
        model.addAttribute("mainCategories", categoryService.findMainCategories());
        model.addAttribute("daysList", getDaysList(7));
        return new ModelAndView("add-auction", "newAuction", new AuctionDTO());
    }

    @PostMapping
    public String addNewAuction(@Valid @ModelAttribute("newAuction") AuctionDTO auctionDTO,
                                BindingResult result, Model model) {
        auctionValidator.validate(auctionDTO,result);
        if (result.hasErrors()) {
            model.addAttribute("categories", categoryService.getCategoriesMap());
            return "add-auction";
        }

        return "redirect:/auction/" + auctionService.addAuction(auctionDTO);
    }

    private List<Integer> getDaysList(Integer days) {
        List<Integer> daysList = new ArrayList<>();
        for (Integer i = 1; i <= days; i++) {
            daysList.add(i);
        }
        return daysList;
    }
}
