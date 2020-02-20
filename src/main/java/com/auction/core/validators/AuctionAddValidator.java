package com.auction.core.validators;

import com.auction.data.model.Auction;
import com.auction.dto.AuctionDTO;
import com.auction.dto.NewUserDTO;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import java.math.BigDecimal;

@Component
public class AuctionAddValidator implements Validator {
    @Override
    public boolean supports(Class<?> aClass) {
        return AuctionDTO.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        AuctionDTO auction = (AuctionDTO) o;

        ValidationUtils.rejectIfEmpty(errors, "title", "NotEmpty");
        if (auction.getTitle().length() < 6 || auction.getTitle().length() > 32) {
            errors.rejectValue("title", "Size.Auction.Length");
        }
        ValidationUtils.rejectIfEmpty(errors, "description", "NotEmpty");
        ValidationUtils.rejectIfEmpty(errors, "startPrice", "NotEmpty");
        ValidationUtils.rejectIfEmpty(errors, "buyNowPrice", "NotEmpty");
        if (auction.getStartPrice() != null && auction.getBuyNowPrice() != null) {
            if (auction.getStartPrice().compareTo(auction.getBuyNowPrice()) > 0) {
                errors.rejectValue("buyNowPrice", "Price.Auction.BuyNow");
            }
            if (auction.getStartPrice().compareTo(BigDecimal.valueOf(0)) < 1) {
                errors.rejectValue("startPrice", "Price.Auction.LessThen1");
            }

        }
    }
}