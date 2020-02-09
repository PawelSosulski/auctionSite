package com.auction.mvc.controllers;

import com.auction.core.services.AuctionService;
import com.auction.dto.AuctionDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/auction")
public class AuctionPageController {

    private AuctionService auctionService;

    @Autowired
    public AuctionPageController(AuctionService auctionService) {
        this.auctionService = auctionService;
    }

    @GetMapping
    public String auctionPageInit(Model model) {
        List<AuctionDTO> allAuctions = auctionService.findAllAuctionsWithCategory();
        model.addAttribute("auctions", allAuctions);
        return "auction-list";
    }

}
