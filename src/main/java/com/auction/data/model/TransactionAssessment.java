package com.auction.data.model;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "transaction_assesment")
@EqualsAndHashCode(of = "id")
@Getter
@Setter
public class TransactionAssessment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToOne
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
