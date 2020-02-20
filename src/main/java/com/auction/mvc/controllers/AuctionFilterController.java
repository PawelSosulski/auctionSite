package com.auction.mvc.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AuctionFilterController {

    @RequestMapping(value = "auction-clear-filter", method = RequestMethod.POST)
    public String clearFilter(){
        return "redirect:/auction";
    }



}
