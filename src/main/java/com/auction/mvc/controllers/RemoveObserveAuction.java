package com.auction.mvc.controllers;

import com.auction.core.services.AuctionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/auction-remove")
public class RemoveObserveAuction {
    private AuctionService auctionService;

    @Autowired
    public RemoveObserveAuction(AuctionService auctionService) {
        this.auctionService = auctionService;
    }

    @PostMapping
    public String removeObserveAuction(Long auctionId){
        auctionService.removeMyObserveAuction(auctionId);
    return "redirect:/my-observe";
}
}
