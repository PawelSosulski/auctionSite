package com.auction.data.repositories;

import com.auction.data.model.Bidding;
import com.auction.utils.enums.AuctionStatus;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.List;

@Repository
public interface BiddingRepository extends JpaRepository<Bidding, Long> {

    @Query(value="Select b FROM Bidding b WHERE b.auction.id = ?1 ORDER BY b.amount DESC")
    List<Bidding> findBiggestBid(Long auctionId, Pageable pageable);


    List<Bidding> findAllByBiddingUserLoginAndAuctionStatusOrderByAuctionId(String login, AuctionStatus status);
}
