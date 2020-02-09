package com.auction.dto;

import com.auction.data.model.Category;
import com.auction.data.model.UserAccount;
import lombok.Data;

import java.math.BigInteger;


@Data
public class AuctionDTO {

    public AuctionDTO() {
    }

    public AuctionDTO(Long id, String title,
                      String description, BigInteger startPrice,
                      BigInteger buyNowPrice, Long categoryId, Long sellerId) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.startPrice = startPrice;
        this.buyNowPrice = buyNowPrice;
        this.sellerId=sellerId;
        this.categoryId=categoryId;
    }



    private Long id;

    private String title;

    private String description;

    private BigInteger startPrice;

    private BigInteger buyNowPrice;

    private Long categoryId;

    private Long sellerId;

    private String categoryName;





}
