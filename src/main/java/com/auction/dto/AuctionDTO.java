package com.auction.dto;

import com.auction.data.model.Category;
import com.auction.data.model.UserAccount;
import com.auction.utils.enums.AuctionStatus;
import lombok.Data;

import java.math.BigInteger;
import java.time.LocalDateTime;
import java.util.Date;


@Data
public class AuctionDTO {

    public AuctionDTO() {
    }

    public AuctionDTO(Long id, String title,
                      String description, BigInteger startPrice,
                      BigInteger buyNowPrice, LocalDateTime dateCreated,
                      LocalDateTime dateEnded, Long categoryId, Long sellerId) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.startPrice = startPrice;
        this.buyNowPrice = buyNowPrice;
        this.dateCreated = dateCreated;
        this.dateEnded = dateEnded;
        this.sellerId=sellerId;
        this.categoryId=categoryId;
    }



    private Long id;

    private String title;

    private String description;

    private BigInteger startPrice;

    private BigInteger buyNowPrice;

    private LocalDateTime dateCreated;

    private LocalDateTime dateEnded;

    private Long categoryId;

    private Long sellerId;

    private String categoryName;

    private AuctionStatus status;

    private BigInteger actualPrice;

    private Integer days;
}
