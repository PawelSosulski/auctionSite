package com.auction.dto;

import com.auction.utils.enums.AuctionStatus;
import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Data
public class MyBiddingsDTO {

    private Long auctionId;

    private String auctionTitle;

    private LocalDateTime dateEnded;

    private Long categoryId;

    private String categoryName;

    private BigDecimal actualPrice;

    private Integer bidsNumber;

    private Boolean isUserBidHighest;
}
