package com.auction.mvc.controllers;

import com.auction.core.services.AuctionService;
import com.auction.core.services.UserService;
import com.auction.dto.AuctionDTO;
import com.auction.dto.LoggedUserDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/my-auction")
public class MyAuctionPageController {

    private AuctionService auctionService;

    public MyAuctionPageController(AuctionService auctionService) {
        this.auctionService = auctionService;
    }

    @GetMapping
    public String MyAuctionPageInit(Model model) {
        String myUsername = SecurityContextHolder.getContext().getAuthentication().getName();
        List<AuctionDTO> myAuctions = auctionService.findAllByUserLogin(myUsername);
        model.addAttribute("myAuctions", myAuctions);
        return "my-auction";
    }
}
