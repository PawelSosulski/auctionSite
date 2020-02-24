package com.auction.data.model;


import com.auction.utils.enums.AccountType;
import com.auction.utils.enums.AuctionStatus;
import com.auction.utils.enums.AuctionType;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.time.LocalDateTime;

import java.util.List;


@Entity
@Table(name = "auctions")
@EqualsAndHashCode(of = "id")
@Getter
@Setter
public class Auction {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String title;

    @Column(nullable = false)
    private String description;

    @Column(name = "start_price", nullable = false)
    private BigDecimal startPrice;

    @Column(name = "actual_price", nullable = false)
    private BigDecimal actualPrice;

    @Column(name = "buy_now_price", nullable = false)
    private BigDecimal buyNowPrice;

    @Column(name = "date_created")
    private LocalDateTime dateCreated;

    @Column(name = "date_ended")
    private LocalDateTime dateEnded;

    @Column(nullable = false)
    private AuctionType auctionType;

    @ManyToOne
    @JoinColumn(name = "category_id")
    private Category category;

    @ManyToOne
    @JoinColumn(name = "seller_id")
    private UserAccount seller;

    @Column(name = "status")
    private AuctionStatus status;

    @OneToMany(mappedBy = "auction")
    List<Bidding> biddingList;


    @Override
    public String toString() {
        return "Auction{" +
                "id=" + id +
                ", auctionTitle='" + title + '\'' +
                ", description='" + description + '\'' +
                ", startPrice=" + startPrice +
                ", buyNowPrice=" + buyNowPrice +
                ", dateCreated=" + dateCreated +
                ", dateEnded=" + dateEnded +
                '}';
    }
}
