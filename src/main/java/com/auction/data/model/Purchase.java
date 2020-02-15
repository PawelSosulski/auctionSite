package com.auction.data.model;

import lombok.Data;

import javax.persistence.*;
import java.math.BigInteger;

@Entity
@Table(name = "purchases")
@Data
public class Purchase {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "auction_id")
    private Auction auction;


    @ManyToOne
    @JoinColumn(name = "user_id")
    private UserAccount buyerUser;

    @Column(name = "amount")
    private BigInteger amount;

    @OneToOne(fetch = FetchType.LAZY, mappedBy = "purchase")
    @JoinColumn(name ="transaction_id")
    private TransactionAssessment transactionAssessment;
}
