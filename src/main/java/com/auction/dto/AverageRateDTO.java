package com.auction.dto;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class AverageRateDTO {

    public AverageRateDTO(){
    }

    private BigDecimal averageRate;

    private Long numberOfRates;

    private Long sumOfRates;
}
