package com.auction.data.repositories;

import com.auction.data.model.Auction;
import com.auction.data.model.UserAccount;
import com.auction.dto.AuctionDTO;
import com.auction.utils.enums.AuctionStatus;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.List;
import java.util.Optional;

public interface AuctionRepository extends JpaRepository<Auction, Long> {


    @Query(value = "Select a FROM Auction a JOIN FETCH a.category JOIN FETCH a.seller")
    List<Auction> findAllByJoinCategoryJoinUser();

    List<Auction> findAllById(Long auctionId);

    List<Auction> findAllBySellerId(Long sellerId);

    List<Auction> findAllByStatus(AuctionStatus status);

    Optional<Auction> getOneById(Long auctionId);
}