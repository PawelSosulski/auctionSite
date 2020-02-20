package com.auction.mvc.controllers;

import com.auction.core.services.BiddingService;
import com.auction.dto.MyBiddingsDTO;
import jdk.nashorn.internal.objects.annotations.Getter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

import static org.springframework.security.core.context.SecurityContextHolder.getContext;

@Controller
@RequestMapping("/my-biddings")
public class MyBiddingsPageController {

    @Autowired
    private BiddingService biddingService;

    @GetMapping
    public String initMyBiddingsPage(Model model){
        String login = getContext().getAuthentication().getName();
        List<MyBiddingsDTO> biddingsByLogin = biddingService.getBiddingsByLogin(login);
        model.addAttribute("biddings",biddingsByLogin);
        return "my-biddings";
    }
}
