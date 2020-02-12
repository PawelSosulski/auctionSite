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

        ValidationUtils.rejectIfEmptyOrWhitespace(errors,"username","NotEmpty");
        if (newUserDTO.getUsername().length()<6 || newUserDTO.getUsername().length()>32) {
            errors.rejectValue("username","Size.newUser.username");
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
