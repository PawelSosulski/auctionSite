package com.auction.data.repositories;

import com.auction.data.model.Auction;
import com.auction.data.model.UserAccount;
import com.auction.dto.AuctionDTO;
import com.auction.utils.enums.AuctionStatus;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.math.BigInteger;
import java.util.List;

public interface AuctionRepository extends JpaRepository<Auction, Long> {


    @Query(value = "Select a FROM Auction a JOIN FETCH a.category JOIN FETCH a.seller")
    List<Auction> findAllByJoinCategoryJoinUser();

    List<Auction> findAllById(Long auctionId);

    List<Auction> findAllByStatus(AuctionStatus status);

   /* @Query(value = "Select new com.auction.dto.AuctionDTO(a.id, a.title, a.description, "+
            "a.startPrice, a.buyNowPrice, c.id, u.id) "+
            "FROM Auction a JOIN FETCH a.category c JOIN FETCH a.seller u")
    List<AuctionDTO> findAllByJoinCategoryJoinUser2();*/

}

// new com.auction.dto.AuctionDTO(a.id, a.title, a.description, " +
//            "a.startPrice, a.buyNowPrice, a.category, a.seller)
