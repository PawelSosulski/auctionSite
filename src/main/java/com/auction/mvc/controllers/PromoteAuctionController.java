package com.auction.mvc.controllers;

import com.auction.core.services.AuctionService;
import com.auction.dto.AuctionDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.Valid;

@Controller
public class PromoteAuctionController {
    private AuctionService auctionService;

    @Autowired
    public PromoteAuctionController(AuctionService auctionService) {
        this.auctionService = auctionService;
    }

    @PostMapping
    @RequestMapping("/promote-auction")
    public String promoteAuctionButton(@Valid @ModelAttribute("auctionActions") AuctionDTO auctionDTO) {
        auctionService.promoteAuction(auctionDTO);
        return "redirect:/my-auction";
    }
}
