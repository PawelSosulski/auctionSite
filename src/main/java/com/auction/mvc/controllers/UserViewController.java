package com.auction.mvc.controllers;

import com.auction.core.services.AuctionService;
import com.auction.core.services.TransactionService;
import com.auction.core.services.UserService;
import com.auction.dto.AuctionDTO;
import com.auction.dto.AverageRateDTO;
import com.auction.dto.LoggedUserDTO;
import com.auction.dto.TransactionDTO;
import com.auction.utils.enums.AuctionStatus;
import com.auction.utils.enums.TransactionRole;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class UserViewController {
    private UserService userService;
    private AuctionService auctionService;
    private TransactionService transactionService;

    @Autowired
    public UserViewController(UserService userService, AuctionService auctionService, TransactionService transactionService) {
        this.userService = userService;
        this.auctionService = auctionService;
        this.transactionService = transactionService;
    }

    @GetMapping
    @RequestMapping("/user/{username}")
    public String userViewInit(@PathVariable("username") String username, Model model) {
        if (userService.getAllUsernames().contains(username)) {
            LoggedUserDTO user = userService.getUserByUsername(username);
            model.addAttribute("user", user);
            List<AuctionDTO> userAuctions = auctionService.findAllByUsernameAndStatusWithCategorySortedByPromote(user.getId(), AuctionStatus.PENDING);
            model.addAttribute("userAuctions", userAuctions);
            List<TransactionDTO> purchases = transactionService.findUserTransactionsByLogin(TransactionRole.Buyer, user.getLogin());
            model.addAttribute("purchases", purchases);
            List<TransactionDTO> sales = transactionService.findUserTransactionsByLogin(TransactionRole.Seller, user.getLogin());
            model.addAttribute("sales", sales);
            model.addAttribute("averageRates", transactionService.getAverageRates(purchases, sales));
            model.addAttribute("avatarId", userService.getAvatarIdByLogin(user.getLogin()));
            return "user";
        }
        return "redirect:../";
    }


}
