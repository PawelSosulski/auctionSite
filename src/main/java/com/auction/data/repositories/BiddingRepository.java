package com.auction.data.repositories;

import com.auction.data.model.Bidding;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.List;

@Repository
public interface BiddingRepository extends JpaRepository<Bidding, Long> {
    @Query(value = "Select b.amount FROM Bidding b WHERE b.auction.id = ?1 ORDER BY b.amount DESC")
    List<BigDecimal> findBiggestValue(Long id);

    @Query(value="Select b.amount FROM Bidding b WHERE b.auction.id = ?1 ORDER BY b.amount DESC")
    List<BigDecimal> findBiggestBid(Long auctionId, Pageable pageable);


}
