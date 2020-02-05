package com.auction.data.model;

import com.auction.utils.enums.AccountStatus;
import com.auction.utils.enums.AccountType;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "users")
@Data
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

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "buyerUser")
    private List<Purchase> purchases;

    @ManyToMany
    @JoinTable(name = "observe_auction", // Wskazujemy wprost nazwę tabeli mapująej
            joinColumns = @JoinColumn(name = "user_id"), // nazwę pola referencji do encji UserAccount
            inverseJoinColumns = @JoinColumn(name = "auction_id") // oraz nazwę pola referencji do encji Auction
    )
    private Set<Auction> observeAuction = new HashSet<>();



}
