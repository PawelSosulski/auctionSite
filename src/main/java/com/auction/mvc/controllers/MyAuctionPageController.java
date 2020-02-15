package com.auction.mvc.controllers;

import com.auction.core.services.AuctionService;
import com.auction.core.services.UserService;
import com.auction.data.model.Auction;
import com.auction.data.model.UserAccount;
import com.auction.data.repositories.UserAccountRepository;
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
    private UserService userService;

    @Autowired
    public MyAuctionPageController(AuctionService auctionService, UserService userService) {
        this.auctionService = auctionService;
        this.userService = userService;
    }

    @GetMapping
    public String MyAuctionPageInit(Model model) {
        String myUsername = SecurityContextHolder.getContext().getAuthentication().getName();
        LoggedUserDTO loggedUserDTO = userService.getUserByLogin(myUsername);
        List<AuctionDTO> myAuctions = auctionService.findAllBySellerId(loggedUserDTO.getId());
        model.addAttribute("myAuctions", myAuctions);
        return "my-auction";
    }
}
