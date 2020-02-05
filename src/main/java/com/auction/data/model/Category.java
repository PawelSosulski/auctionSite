package com.auction.data.model;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "categories")
@Data
public class Category {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "category")
    private List<Auction> auctions;

    @Column(unique = true, nullable = false)
    private String name;

    @Column(nullable = false)
    private String description;
}
