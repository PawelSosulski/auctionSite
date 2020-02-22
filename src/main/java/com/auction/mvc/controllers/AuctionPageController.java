package com.auction.mvc.controllers;

import com.auction.core.services.AuctionService;
import com.auction.core.services.CategoryService;
import com.auction.core.services.UserService;
import com.auction.dto.*;
import com.auction.utils.enums.AuctionStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/auction")
public class AuctionPageController {

    private AuctionService auctionService;
    private CategoryService categoryService;
    private UserService userService;

    @Autowired
    public AuctionPageController(AuctionService auctionService, CategoryService categoryService, UserService userService) {
        this.auctionService = auctionService;
        this.categoryService = categoryService;
        this.userService = userService;
    }

    @GetMapping
    public String auctionPageInit(Model model) {
        List<AuctionDTO> allAuctions = auctionService
                .findAllByStatusWithCategory(AuctionStatus.PENDING);
        model.addAttribute("auctions", allAuctions);
        model.addAttribute("categories", categoryService.findAllCategory());
        model.addAttribute("mainCategories", categoryService.findMainCategories());
        model.addAttribute("filter", new FilterAuctionDTO());
        return "auction-list";
    }


    @PostMapping
    public String auctionFilter(FilterAuctionDTO filter, Model model) {
        List<AuctionDTO> filteredAuction = auctionService.doPendingAuctionFilter(filter);
        model.addAttribute("auctions", filteredAuction);
        model.addAttribute("categories", categoryService.findAllCategory());
        model.addAttribute("mainCategories", categoryService.findMainCategories());
        model.addAttribute("filter", filter);
        return "auction-list";
    }

    @GetMapping
    @RequestMapping("/{auctionId}")
    public String prepareAuctionPage(@PathVariable("auctionId") Long auctionId, Model model) {
        if (auctionService.getAllAuctionsId().contains(auctionId)) {
            List<AuctionDTO> auctionList = auctionService.findAllById(auctionId);
            if (auctionList.size() == 1) {
                AuctionDTO auctionDTO = auctionList.get(0);
                model.addAttribute("auction", auctionDTO);
                LoggedUserDTO loggedUser = userService.getUserByLogin(SecurityContextHolder.getContext().getAuthentication().getName());
                model.addAttribute("user", loggedUser);
//                CategoryDTO category = categoryService.findCategoryById(auctionDTO.getCategoryId());
//                model.addAttribute("category", category);

                CategoryDTO categories = categoryService.findCategoryWithParentName(auctionDTO.getCategoryId());
                model.addAttribute("category", categories);

                TransactionUserDTO seller = userService.getUserDTOById(auctionDTO.getSellerId());
                model.addAttribute("seller", seller);
                BidDTO bid = new BidDTO();
                bid.setAuctionId(auctionDTO.getId());
                model.addAttribute("bid", bid);
                ObserveDTO observeDTO = new ObserveDTO();
                observeDTO.setAuctionId(auctionId);
                observeDTO.setIsObserved(userService.checkIfAuctionObserve(auctionId));
                model.addAttribute("observe", observeDTO);
                return "auction";
            }
        }
        return "redirect:auction";
    }



    @PostMapping("/observe-auction")
    public String addOrRemoveAuctionToObserve(ObserveDTO observe) {
        userService.removeOrAddObserveAuction(observe);
        return "redirect:/auction/" + observe.getAuctionId();
    }

}
