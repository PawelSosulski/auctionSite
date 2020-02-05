package com.auction.data.model;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "transaction_assesment")
@Data
public class TransactionAssessment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "purchase_id")
    private Purchase purchase;

    @Column(name = "seller_rating")
    private Integer sellerRating;

    @Column(name = "seller_note")
    private String sellerNote;

    @Column(name = "buyer_rating")
    private Integer buyerRating;

    @Column(name = "buyer_note")
    private String buyerNote;

}
