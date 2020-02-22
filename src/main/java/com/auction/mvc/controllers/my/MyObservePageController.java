package com.auction.mvc.controllers.my;

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
@RequestMapping("/observe-auctions")
public class MyObservePageController {

    private AuctionService auctionService;

    @Autowired
    public MyObservePageController(AuctionService auctionService) {
        this.auctionService = auctionService;
    }

    @GetMapping
    public String initMyObserveListPage(Model model) {
        String myUsername = SecurityContextHolder.getContext().getAuthentication().getName();
        List<AuctionDTO> observeAuction = auctionService.findUserObserveList(myUsername);
        model.addAttribute("observeAuctions",observeAuction);
        return "my-observe";
    }

}
