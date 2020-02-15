package com.auction.mvc.controllers;

import com.auction.core.services.AuctionService;
import com.auction.data.repositories.AuctionRepository;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class BidAuctionController {
    private AuctionService auctionService;

    public BidAuctionController(AuctionService auctionService) {
        this.auctionService = auctionService;
    }

    @PostMapping("/bidAuction")
    public String makeBidToAuction(String value, String auctionId) {
        if (auctionService.makeBid(auctionId, value)) {
            return "redirect:auction/"+auctionId;
        } else {
            return "redirect:/";
        }

    }
}
