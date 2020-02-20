package com.auction.mvc.controllers;

import com.auction.core.services.AuctionService;
import com.auction.dto.TransactionDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/my-transaction")
public class MyTransactionPageController {

    private AuctionService auctionService;

    @Autowired
    public MyTransactionPageController(AuctionService auctionService) {
        this.auctionService = auctionService;
    }

    @GetMapping
    public ModelAndView initMyObserveListPage() {
        List<TransactionDTO> transactions = auctionService.findUserTransaction();

        return new ModelAndView("my-transaction","transactions",transactions);
    }

}
