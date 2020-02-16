package com.auction.mvc.controllers;

import com.auction.core.services.AuctionService;
import com.auction.core.services.CategoryService;
import com.auction.core.services.UserService;
import com.auction.data.model.UserAccount;
import com.auction.dto.AuctionDTO;
import com.auction.dto.CategoryDTO;
import com.auction.dto.NewUserDTO;
import com.auction.dto.SellerUserDTO;
import com.auction.utils.enums.AuctionStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.text.DateFormat;
import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.util.Date;
import java.util.HashSet;
import java.util.List;

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
        return "auction-list";
    }

    @GetMapping
    @RequestMapping("/{auctionId}")
    public String prepareAuctionPage(@PathVariable("auctionId") String auctionId, Model model) {
        List<AuctionDTO> auctionList = auctionService.findAllById(auctionId);
        if (auctionList.size() == 1) {
            AuctionDTO auctionDTO = auctionList.get(0);
            model.addAttribute("auction", auctionDTO);
            CategoryDTO category = categoryService.findCategoryById(auctionDTO.getCategoryId());
            model.addAttribute("category", category);
            SellerUserDTO seller = userService.getUserDTOById(auctionDTO.getSellerId());
            model.addAttribute("seller", seller);

            return "auction";
        } else {
            return "redirect:auction";
        }
    }



}
