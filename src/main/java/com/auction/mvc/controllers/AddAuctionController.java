package com.auction.mvc.controllers;

import com.auction.core.services.AuctionService;
import com.auction.core.services.CategoryService;
import com.auction.dto.AuctionDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("auction-add")
public class AddAuctionController {
    private CategoryService categoryService;
    private AuctionService auctionService;

    @Autowired
    public AddAuctionController(CategoryService categoryService, AuctionService auctionService) {
        this.categoryService = categoryService;
        this.auctionService = auctionService;
    }

    @GetMapping

    public ModelAndView addAuctionInitPage(Model model) {

        model.addAttribute("categories", categoryService.getCategoriesMap());
        return new ModelAndView("add-auction", "newAuction", new AuctionDTO());
    }

    @PostMapping

    public String addNewAuction(AuctionDTO auctionDTO) {
        auctionDTO.setSellerId(1L);
        Long auctionId = auctionService.addAuction(auctionDTO);
        return "redirect:/auction/" + auctionId;
    }
}
