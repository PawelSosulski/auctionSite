package com.auction.dto;

import com.auction.utils.enums.AccountStatus;
import com.auction.utils.enums.AccountType;
import lombok.Data;

import java.time.LocalDateTime;

@Data
public class NewUserDTO {

    private String login;

    private String password;

    private String passwordConfirm;

    private String username;

    private String city;

    private String street;

    private Long streetNumber;

    private String zipCode;

    private String province;

    private String name;

    private String lastName;

    private LocalDateTime createdAt = LocalDateTime.now();

    private AccountStatus status = AccountStatus.ACTIVE;

    private AccountType type = AccountType.NORMAL;

}
