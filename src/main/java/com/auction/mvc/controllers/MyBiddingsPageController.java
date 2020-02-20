package com.auction.mvc.controllers;

import jdk.nashorn.internal.objects.annotations.Getter;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/my-biddings")
public class MyBiddingsPageController {

    @GetMapping
    public String initMyBiddingsPage(){
        return "my-biddings";
    }
}
