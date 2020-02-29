package com.auction.mvc.controllers;

import com.auction.core.services.AuctionService;
import com.auction.core.services.TransactionService;
import com.auction.core.validators.RateValidator;
import com.auction.dto.RateDTO;
import com.auction.utils.enums.TransactionRole;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;

@Controller
public class RatePageController {

    private TransactionService transactionService;
    private RateValidator validator;
    private AuctionService auctionService;

    public RatePageController(TransactionService transactionService, RateValidator validator, AuctionService auctionService) {
        this.transactionService = transactionService;
        this.validator = validator;
        this.auctionService = auctionService;
    }

    @RequestMapping(value = "/rate", method = RequestMethod.POST)
    public ModelAndView initRatePage(@RequestParam TransactionRole role, @RequestParam Long purchaseId, Model model) {
        RateDTO rateDTO = new RateDTO();
        rateDTO.setPurchaseId(purchaseId);
        rateDTO.setRole(role);
        rateDTO.setAuctionTitle(auctionService.getAuctionTitleFromPurchase(purchaseId));
        return new ModelAndView("rate", "rate", rateDTO);
    }

    @RequestMapping(value = "/rate-add", method = RequestMethod.POST)
    public String addRate(@Valid @ModelAttribute("rate") RateDTO rateDTO, BindingResult result) {
        validator.validate(rateDTO, result);
        if (result.hasErrors()) {
            return "rate";
        }
        transactionService.fillTransaction(rateDTO);
        return "redirect:/my-transaction";
    }

       /*auctionValidator.validate(auctionDTO,result);
        if (result.hasErrors()) {
        model.addAttribute("categories", categoryService.getCategoriesMap());
        return "add-auction";
    }*/


}