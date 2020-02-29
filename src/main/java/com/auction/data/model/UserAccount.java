package com.auction.data.model;

import com.auction.utils.enums.AccountStatus;
import com.auction.utils.enums.AccountType;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "users")
@EqualsAndHashCode(of = "id")
@Getter
@Setter
public class UserAccount {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(unique = true, nullable = false)
    private String login;

    @Column(nullable = false)
    private String password;

    @Column(unique = true, nullable = false)
    private String email;

    @Column(nullable = false)
    private String city;

    @Column(nullable = false)
    private String street;

    @Column(nullable = false)
    private Long streetNumber;

    @Column(name = "zip_code", nullable = false)
    private String zipCode;

    @Column(nullable = false)
    private String province;

    @Column(nullable = false)
    private String name;

    @Column(nullable = false)
    private String lastName;

    @Column(name = "created_at", nullable = false)
    private LocalDateTime createdAt;

    @Column(nullable = false)
    private AccountStatus status;

    @Column(nullable = false)
    private AccountType type;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "buyerUser")
    private List<Purchase> purchases;

    @ManyToMany
    @JoinTable(name = "observe_auctions", // Wskazujemy wprost nazwę tabeli mapującej
            joinColumns = @JoinColumn(name = "user_id"), // nazwę pola referencji do encji UserAccount
            inverseJoinColumns = @JoinColumn(name = "auction_id") // oraz nazwę pola referencji do encji Auction
    )
    private Set<Auction> observeAuctions = new HashSet<>();

    @OneToMany(mappedBy = "seller")
    private Set<Auction> myAuctions = new HashSet<>();

    @OneToOne
    private FileEntity avatar;

    @Override
    public String toString() {
        return "UserAccount{" +
                "id=" + id +
                ", login='" + login + '\'' +
                ", email='" + email + '\'' +
                ", city='" + city + '\'' +
                ", street='" + street + '\'' +
                ", streetNumber=" + streetNumber +
                ", zipCode='" + zipCode + '\'' +
                ", province='" + province + '\'' +
                ", name='" + name + '\'' +
                ", lastName='" + lastName + '\'' +
                ", createdAt=" + createdAt +
                ", status=" + status +
                ", type=" + type +
                '}';
    }



}
