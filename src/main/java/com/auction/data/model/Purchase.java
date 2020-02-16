package com.auction.data.model;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.math.BigDecimal;
import java.math.BigInteger;

@Entity
@Table(name = "purchases")
@EqualsAndHashCode(of = "id")
@Getter
@Setter
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
    private BigDecimal amount;

    @OneToOne(fetch = FetchType.LAZY, mappedBy = "purchase")
    @JoinColumn(name ="transaction_id")
    private TransactionAssessment transactionAssessment;
}
