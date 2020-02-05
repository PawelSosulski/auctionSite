package com.auction.data.model;

import com.auction.utils.enums.AccountStatus;
import com.auction.utils.enums.AccountType;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "users")
@Getter @Setter
public class UserAccount {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(unique = true, nullable = false)
    private String login;

    @Column(nullable = false)
    private String password;

    @Column(unique = true, nullable = false)
    private String username;

    @Column(nullable = false)
    private String city;

    @Column(nullable = false)
    private String street;

    @Column(name = "zip_code", nullable = false)
    private String zipCode;

    @Column(nullable = false)
    private String province;

    @Column(name = "created_at", nullable = false)
    private Date createdAt;

    @Column(nullable = false)
    private AccountStatus status;

    @Column(nullable = false)
    private AccountType type;

}
