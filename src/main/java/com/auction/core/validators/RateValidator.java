package com.auction.core.validators;

import com.auction.dto.RateDTO;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class RateValidator implements Validator {

    @Override
    public boolean supports(Class<?> aClass) {
        return RateDTO.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        RateDTO rate = (RateDTO) o;
//        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "rateValue", "NotEmpty");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "rateDescription", "NotEmpty");
        if (rate.getRateDescription()==null) {
            errors.rejectValue("rateDescription", "NotEmpty");
        }
        if (rate.getRateValue() == null) {
            errors.rejectValue("rateValue", "NotEmpty");
        } else if (rate.getRateValue() < 1 || rate.getRateValue() > 5) {
            errors.rejectValue("rateValue", "Rage.Range");
        }
    }
}
