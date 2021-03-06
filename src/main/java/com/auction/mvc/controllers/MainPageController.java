package com.auction.mvc.controllers;

import com.auction.core.services.AuctionService;
import com.auction.core.services.CategoryService;
import com.auction.dto.AuctionDTO;
import com.auction.dto.CategoryDTO;
import com.auction.dto.FilterAuctionDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/")
public class MainPageController {

    private CategoryService categoryService;
    private AuctionService auctionService;

    @Autowired
    public MainPageController(CategoryService categoryService, AuctionService auctionService) {
        this.categoryService = categoryService;
        this.auctionService = auctionService;
    }

    @GetMapping
    public String start(Model model){
        List<CategoryDTO> allCategories = categoryService.findAllCategory();
        List<CategoryDTO> mainCategories = categoryService.findMainCategories();
        List<AuctionDTO> lastAuctions = auctionService.findLastAddedAuctions();
        List<AuctionDTO> endingAuctions = auctionService.findEndingAuctions();
        List<AuctionDTO> promotedAuctions = auctionService.findPromotedAuctions();
        model.addAttribute("categories", allCategories);
        model.addAttribute("mainCategories", mainCategories);
        model.addAttribute("lastAuctions", lastAuctions);
        model.addAttribute("endingAuctions", endingAuctions);
        model.addAttribute("promotedAuctions", promotedAuctions);
        model.addAttribute("filter", new FilterAuctionDTO());
        return "main";
    }

}
