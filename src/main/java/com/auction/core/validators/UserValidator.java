package com.auction.core.validators;

import com.auction.core.services.UserService;
import com.auction.data.model.UserAccount;
import com.auction.data.repositories.UserAccountRepository;
import com.auction.dto.NewUserDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class UserValidator implements Validator {
    public final String emailRegex = "(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])";
    private UserService userService;

    @Autowired
    public UserValidator(UserService userService) {
        this.userService = userService;
    }

    @Override
    public boolean supports(Class<?> aClass) {
        return NewUserDTO.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        NewUserDTO newUserDTO = (NewUserDTO) o;

        ValidationUtils.rejectIfEmptyOrWhitespace(errors,"email","NotEmpty");
        if (!newUserDTO.getEmail().matches(emailRegex)) {
            errors.rejectValue("email","Email.newUser");
        }
        if (userService.getAllEmails().contains(newUserDTO.getEmail())) {
            errors.rejectValue("email","Duplicate.newUser.email");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors,"login","NotEmpty");
        if (newUserDTO.getLogin().length()<6 || newUserDTO.getLogin().length()>32) {
            errors.rejectValue("login","Size.newUser.login");
        }
        if (userService.checkIfAlreadyExists(newUserDTO)) {
            errors.rejectValue("login","Duplicate.newUser.login");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors,"password","NotEmpty");
        if (newUserDTO.getPassword().length()<4 || newUserDTO.getPassword().length()>32) {
            errors.rejectValue("password","Size.newUser.password");
        }

        if (!newUserDTO.getPasswordConfirm().equals(newUserDTO.getPassword())) {
            errors.rejectValue("passwordConfirm","Diff.newUser.passwordConfirm");
        }



    }
}
