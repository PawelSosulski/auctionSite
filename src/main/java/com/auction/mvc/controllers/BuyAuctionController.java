package com.auction.mvc.controllers;

import com.auction.core.services.AuctionService;
import com.auction.data.repositories.AuctionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class BuyAuctionController {
    private AuctionService auctionService;

    @Autowired
    public BuyAuctionController(AuctionService auctionService) {
        this.auctionService = auctionService;
    }

    @PostMapping("/buyAuction")
    public String buyNowAuction(String auctionId) {
        auctionService.buyAuctionByUser(auctionId);
        return "redirect:/";
    }

}
