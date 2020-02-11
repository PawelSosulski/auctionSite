package com.auction.mvc.controllers;

import com.auction.core.services.CategoryService;
import com.auction.dto.CategoryDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/category-list")
public class CategoryListController {

    private CategoryService categoryService;

    @Autowired
    public CategoryListController(CategoryService categoryService) {
        this.categoryService = categoryService;
    }

    @GetMapping
    public String categoryListInit(Model model) {
        List<CategoryDTO> allCategories = categoryService.findAllCategory();
        List<CategoryDTO> mainCategories = categoryService.findMainCategories();
        model.addAttribute("categories", allCategories);
        model.addAttribute("mainCategories", mainCategories);
        return "/fragments/category-list";
    }
}
