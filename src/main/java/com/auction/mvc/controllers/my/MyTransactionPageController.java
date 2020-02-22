package com.auction.mvc.controllers.my;

import com.auction.core.services.AuctionService;
import com.auction.core.services.TransactionService;
import com.auction.dto.TransactionDTO;
import com.auction.utils.enums.TransactionRole;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/my-transaction")
public class MyTransactionPageController {

    private TransactionService transactionService;

    @Autowired
    public MyTransactionPageController(TransactionService transactionService) {
        this.transactionService = transactionService;
    }
    @GetMapping
    public String initMyObserveListPage(Model model) {
        List<TransactionDTO> purchases = transactionService.findUserTransactions(TransactionRole.Buyer);
        List<TransactionDTO> sales = transactionService.findUserTransactions(TransactionRole.Seller);
        model.addAttribute("purchases",purchases);
        model.addAttribute("sales",sales);
        return "my-transaction";
    }

}
