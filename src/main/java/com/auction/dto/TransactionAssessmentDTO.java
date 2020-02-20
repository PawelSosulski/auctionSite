package com.auction.dto;


import lombok.Data;

@Data
public class TransactionAssessmentDTO {

    private Integer sellerRating;

    private String sellerNote;

    private Integer buyerRating;

    private String buyerNote;

}
