package com.auction.mvc.controllers;

import com.auction.core.services.AuctionService;
import com.auction.data.model.Auction;
import com.auction.dto.AuctionDTO;
import com.auction.utils.enums.AuctionStatus;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.Valid;
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
        List<AuctionDTO> auctionsOngoing = auctionService
                .findAllByUserLoginAndStatus(myUsername, AuctionStatus.PENDING);
        model.addAttribute("ongoing", auctionsOngoing);
        List<AuctionDTO> auctionsFinished = auctionService
                .findAllByUserLoginAndStatus(myUsername,
                        AuctionStatus.SOLD,AuctionStatus.CLOSE);
        model.addAttribute("finished", auctionsFinished);
        model.addAttribute("endAuction", new AuctionDTO());
        return "my-auction";
    }

    @PostMapping
    public String endAuctionButton(@Valid @ModelAttribute("endAuction") AuctionDTO auctionDTO) {
        auctionService.finishedAuctionDTO(auctionDTO);
        return "redirect:/my-auction";
    }

}
