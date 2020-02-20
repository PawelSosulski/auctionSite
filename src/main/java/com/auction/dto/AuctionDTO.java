package com.auction.dto;

import com.auction.data.model.Category;
import com.auction.data.model.UserAccount;
import com.auction.utils.enums.AuctionStatus;
import lombok.Data;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.time.LocalDateTime;
import java.util.Date;


@Data
public class AuctionDTO {

    public AuctionDTO() {
    }

    private Long id;

    private String title;

    private String description;

    private BigDecimal startPrice;

    private BigDecimal buyNowPrice;

    private LocalDateTime dateCreated;

    private LocalDateTime dateEnded;

    private Long categoryId;

    private Long sellerId;

    private String categoryName;

    private AuctionStatus status;

    private BigDecimal actualPrice;

    private Integer days;

    private Integer bidsNumber;
}
