package com.auction.dto;


import lombok.Data;


@Data
public class TransactionUserDTO {

    private String username;

    private String city;

    private String street;

    private Long streetNumber;

    private String zipCode;

    private String province;

    private String name;

    private String lastName;

}
