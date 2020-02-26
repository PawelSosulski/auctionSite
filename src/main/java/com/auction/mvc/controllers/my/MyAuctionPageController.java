package com.auction.mvc.controllers.my;

import com.auction.core.services.AuctionService;
import com.auction.core.services.UserService;
import com.auction.dto.AuctionDTO;
import com.auction.utils.enums.AuctionStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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
        List<AuctionDTO> auctionsOngoing = auctionService
                .findAllByUserLoginAndStatus(myUsername, AuctionStatus.PENDING);
        model.addAttribute("ongoing", auctionsOngoing);
        List<AuctionDTO> auctionsFinished = auctionService
                .findAllByUserLoginAndStatus(myUsername,
                        AuctionStatus.SOLD,AuctionStatus.CLOSE);
        model.addAttribute("finished", auctionsFinished);
        model.addAttribute("auctionActions", new AuctionDTO());
        model.addAttribute("isPremiumUser",userService.isUserPromo());
        return "my-auction";
    }

    @PostMapping(params = {"end"})
    public String AuctionsButton(Long auctionId) {
        auctionService.finishedAuction(auctionId);
        return "redirect:/my-auction";
    }

    @PostMapping(params = {"promote"})
    public String promoteAuctionButton(Long auctionId) {
        auctionService.promoteAuction(auctionId);
        return "redirect:/my-auction";
    }

}
