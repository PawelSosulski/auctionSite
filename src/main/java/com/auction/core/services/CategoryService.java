package com.auction.core.services;

import com.auction.data.model.Category;
import com.auction.data.repositories.CategoryRepository;
import com.auction.dto.CategoryDTO;
import org.dozer.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
@Transactional
public class CategoryService {

    private CategoryRepository categoryRepository;
    private Mapper mapper;

    @Autowired
    public CategoryService(CategoryRepository categoryRepository, Mapper mapper) {
        this.categoryRepository = categoryRepository;
        this.mapper = mapper;
    }


//    public List<CategoryDTO> findAllCategory() {
//
//        List<CategoryDTO> categoryDTOList = new ArrayList<>();
//
//        categoryRepository.findAll().forEach(a -> {
//            CategoryDTO categoryDTO = mapper.map(a, CategoryDTO.class);
//            categoryDTO.setId(a.getId());
//            categoryDTO.setName(a.getName());
//            categoryDTO.setDescription(a.getDescription());
//            categoryDTO.setParentId(a.getParentId());
//            categoryDTOList.add(categoryDTO);
//        });
//        return categoryDTOList;
//    }

    public List<CategoryDTO> findAllCategory() {
        List<CategoryDTO> categoryDTOList = new ArrayList<>();
        categoryRepository.findAll().forEach(a -> {
            CategoryDTO categoryDTO = mapper.map(a, CategoryDTO.class);
            categoryDTOList.add(categoryDTO);
        });
        return categoryDTOList;
    }

    public List<CategoryDTO> findMainCategories() {
        Long mainId = new Long(0);
        List<CategoryDTO> categoryDTOList = new ArrayList<>();

        categoryRepository.findAllByParentId(mainId).forEach(a -> {
            CategoryDTO categoryDTO = mapper.map(a, CategoryDTO.class);
//            categoryDTO.setId(a.getId());
//            categoryDTO.setName(a.getName());
//            categoryDTO.setDescription(a.getDescription());
//            categoryDTO.setParentId(a.getParentId());
            categoryDTOList.add(categoryDTO);
        });
        return categoryDTOList;
    }

    public CategoryDTO findCategoryById(Long id) {
        List<Category> allById = categoryRepository.findAllById(id);
        if (allById.size()==1) {
            return mapper.map(allById.get(0),CategoryDTO.class);
        }
        return new CategoryDTO();

    }

    public Map<Long, String> getCategoriesMap() {
        List<Category> allMainCategories = categoryRepository.findAllByParentId(0L);
        return allMainCategories.stream().collect(Collectors.toMap(Category::getId, Category::getName));
    }
}
