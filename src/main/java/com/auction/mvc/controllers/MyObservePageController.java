package com.auction.mvc.controllers;

import com.auction.core.services.AuctionService;
import com.auction.dto.AuctionDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/my-observe-auctions")
public class MyObservePageController {

    @Autowired
    private AuctionService auctionService;

    @GetMapping
    public String initMyObserveListPage(Model model) {
        String myUsername = SecurityContextHolder.getContext().getAuthentication().getName();
        List<AuctionDTO> observeAuction = auctionService.findUserObserveList(myUsername);
        model.addAttribute("observeAuctions",observeAuction);
        return "my-observe";
    }

}
