package com.auction.dto;

import com.auction.utils.enums.AccountStatus;
import com.auction.utils.enums.AccountType;
import lombok.Data;


@Data
public class SellerUserDTO {

    private String username;

    private String city;

    private String street;

    private Long streetNumber;

    private String zipCode;

    private String province;

    private String name;

    private String lastName;

}
