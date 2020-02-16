package com.auction.mvc.controllers;

import com.auction.core.services.AuctionService;
import com.auction.core.services.CategoryService;
import com.auction.core.services.UserService;
import com.auction.core.validators.BidValidator;
import com.auction.data.repositories.AuctionRepository;
import com.auction.dto.AuctionDTO;
import com.auction.dto.BidDTO;
import com.auction.dto.CategoryDTO;
import com.auction.dto.SellerUserDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.validation.Valid;
import java.util.List;

@Controller
public class BidAuctionController {
    private AuctionService auctionService;
    private BidValidator bidValidator;
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private UserService userService;

    @Autowired
    public BidAuctionController(AuctionService auctionService, BidValidator bidValidator) {
        this.auctionService = auctionService;
        this.bidValidator = bidValidator;
    }

    @PostMapping("/bidAuction")
    public String makeBidToAuction(@Valid @ModelAttribute("bid") BidDTO bid, BindingResult result, Model model) {
        bidValidator.validate(bid, result);
        if (!result.hasErrors()) {
            auctionService.makeBid(bid);
            return "redirect:auction/" + bid.getAuctionId();
        } else {
            List<AuctionDTO> auctionList = auctionService.findAllById(String.valueOf(bid.getAuctionId()));
            AuctionDTO auctionDTO = auctionList.get(0);
            model.addAttribute("auction", auctionDTO);
            CategoryDTO category = categoryService.findCategoryById(auctionDTO.getCategoryId());
            model.addAttribute("category", category);
            SellerUserDTO seller = userService.getUserDTOById(auctionDTO.getSellerId());
            model.addAttribute("seller", seller);
            model.addAttribute("bid", bid);
            return "auction";
        }

    }
}
