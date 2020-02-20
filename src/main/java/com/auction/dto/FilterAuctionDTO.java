package com.auction.dto;

import com.auction.utils.enums.SortOptions;
import lombok.Data;

import java.util.List;

@Data
public class FilterAuctionDTO {


    private List<Long> categoryId;

    SortOptions sort;

    private Boolean onlyBuyNow;

}
