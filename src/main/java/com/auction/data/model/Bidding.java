package com.auction.data.model;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name="biddings")
@Data
public class Bidding {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;


    private UserAccount userAccount;

}
