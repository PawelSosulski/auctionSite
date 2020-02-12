package com.auction.mvc.controllers;

import com.auction.core.services.AuctionService;
import com.auction.core.services.CategoryService;
import com.auction.core.validators.AuctionAddValidator;
import com.auction.dto.AuctionDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;

@Controller
@RequestMapping("/auction-add")
public class AddAuctionController {
    private CategoryService categoryService;
    private AuctionService auctionService;
    private AuctionAddValidator auctionValidator;

    @Autowired
    public AddAuctionController(CategoryService categoryService, AuctionService auctionService, AuctionAddValidator auctionValidator) {
        this.categoryService = categoryService;
        this.auctionService = auctionService;
        this.auctionValidator = auctionValidator;
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
        auctionDTO.setSellerId(1L);
        Long auctionId = auctionService.addAuction(auctionDTO);
        return "redirect:/auction/" + auctionId;
    }
}
