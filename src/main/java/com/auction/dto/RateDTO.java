package com.auction.dto;

import com.auction.utils.enums.TransactionRole;
import lombok.Data;

@Data
public class RateDTO {

    private TransactionRole role;
    private Long purchaseId;
    private Integer rateValue;
    private String rateDescription;
    private String auctionTitle;

}
