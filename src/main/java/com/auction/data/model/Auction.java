package com.auction.data.model;


import com.auction.utils.enums.AuctionStatus;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.math.BigInteger;
import java.util.Set;

@Entity
@Table(name = "auctions")
@Data
public class Auction {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String title;

    @Column(nullable = false)
    private String description;

    @Column(name = "start_price", nullable = false)
    private BigInteger startPrice;

    @Column(name = "buy_now_price", nullable = false)
    private BigInteger buyNowPrice;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "category_id")
    private Category category;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "seller_id")
    private UserAccount seller;

    @Column(name = "status")
    private AuctionStatus status;



}
