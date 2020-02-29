package com.auction.mvc.controllers;

import com.auction.core.services.AuctionService;
import com.auction.core.services.CategoryService;
import com.auction.core.services.UserService;
import com.auction.core.validators.AuctionAddValidator;
import com.auction.dto.AuctionDTO;
import com.auction.dto.FileDTO;
import com.auction.dto.LoggedUserDTO;
import com.auction.utils.ValidList;
import com.auction.utils.enums.AuctionType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.Resource;
import org.springframework.data.repository.query.Param;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Controller
@RequestMapping("/auction-add")
public class AddAuctionController {
    private CategoryService categoryService;
    private AuctionService auctionService;
    private AuctionAddValidator auctionValidator;
    private UserService userService;

    @Autowired
    public AddAuctionController(CategoryService categoryService,
                                AuctionService auctionService,
                                AuctionAddValidator auctionValidator,
                                UserService userService) {
        this.categoryService = categoryService;
        this.auctionService = auctionService;
        this.auctionValidator = auctionValidator;
        this.userService = userService;

    }

    @GetMapping
    public ModelAndView addAuctionInitPage(Model model) {
        prepareModel(model);
        AuctionDTO auctionDTO = new AuctionDTO();
        auctionDTO.setAuctionType(AuctionType.NORMAL);
        return new ModelAndView("add-auction", "newAuction", auctionDTO);
    }

/*    @PostMapping(params = {"next"})
    public String nextPageNewAuction(@Valid @ModelAttribute("newAuction") AuctionDTO auctionDTO,
                                     BindingResult result, Model model) {
        auctionValidator.validate(auctionDTO, result);
        if (result.hasErrors()) {
            prepareModel(model);
            return "add-auction";
        }
        model.addAttribute("newAuction", auctionDTO);
        Boolean isUserPromo = userService.isUserPromo();
        model.addAttribute("isUserPromo", isUserPromo);
        return "add-auction-photos";
    }*/

/*    @PostMapping(params = {"edit"})
    public String editNewAuction(@Param(value = "newAuction") AuctionDTO auctionDTO,
                                 Model model) {
        prepareModel(model);
        model.addAttribute("newAuction", auctionDTO);
        return "add-auction";
    }*/

    @PostMapping(params = {"uploadPhoto"})
    public String addPhoto(AuctionDTO auctionDTO,
                           @RequestParam("file") MultipartFile file,
                           Model model) throws IOException {
        FileDTO fileDTO = new FileDTO();
        fileDTO.setContentType(file.getContentType());
        fileDTO.setFileName(file.getOriginalFilename());
        fileDTO.setDataAsString(new String(file.getBytes()));
        prepareModel(model);
        model.addAttribute("newAuction", auctionDTO);
        return "add-auction";
    }

    @PostMapping(params = {"save"})
    public String saveNewAuction(@Param(value = "newAuction") AuctionDTO auctionDTO) throws IOException {
        return "redirect:/auction/" + auctionService.addAuction(auctionDTO);
    }

    private void prepareModel(Model model) {
        model.addAttribute("isUserPromo", userService.isUserPromo());
        model.addAttribute("categories", categoryService.findAllCategory());
        model.addAttribute("mainCategories", categoryService.findMainCategories());
        model.addAttribute("daysList", getDaysList(7));
    }

    private List<Integer> getDaysList(Integer days) {
        List<Integer> daysList = new ArrayList<>();
        for (Integer i = 1; i <= days; i++) {
            daysList.add(i);
        }
        return daysList;
    }
}
