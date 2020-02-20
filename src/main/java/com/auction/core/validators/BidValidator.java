package com.auction.core.validators;

import com.auction.core.services.AuctionService;
import com.auction.dto.BidDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import javax.validation.Validation;

@Component
public class BidValidator implements Validator {

    private AuctionService auctionService;

    @Autowired
    public BidValidator(AuctionService auctionService) {
        this.auctionService = auctionService;
    }

    @Override
    public boolean supports(Class<?> aClass) {
        return BidDTO.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        BidDTO bid = (BidDTO) o;
        ValidationUtils.rejectIfEmptyOrWhitespace(errors,"value","NotEmpty");
        if (auctionService.isAnyBids(bid.getAuctionId())){
            if (bid.getValue().compareTo(auctionService.getBiggestBid(bid.getAuctionId()))<1)
                errors.rejectValue("value","Bid.Auction.Poverty");
        } else {
            if (bid.getValue().compareTo(auctionService.getStartBid(bid.getAuctionId()))<0)
                errors.rejectValue("value","Bid.Auction.Poverty");
        }


    }
}
