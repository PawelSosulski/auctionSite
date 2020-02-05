package com.auction.data.model;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;


@Entity
@Table(name = "observe_auctions")

public class ObserveAuction {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToMany
    @JoinColumn(name = "user_id")
    private Set<UserAccount> users = new HashSet<>();


    @ManyToMany
    @JoinColumn(name = "auction_id")
    private Set<Auction> observeAuction = new HashSet<>();



}
