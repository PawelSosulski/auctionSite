package com.auction.dto;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class BidDTO {

    private BigDecimal value;

    private Long auctionId;

}
