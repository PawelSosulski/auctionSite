package com.auction.dto;


import lombok.Data;

import java.math.BigDecimal;

@Data
public class TransactionDTO {

    private Long purchaseId;

    private AuctionDTO auction;

    private TransactionUserDTO sellerUser;

    private TransactionUserDTO buyerUser;

    private BigDecimal amount;

    private TransactionAssessmentDTO transactionAssessment;

}
