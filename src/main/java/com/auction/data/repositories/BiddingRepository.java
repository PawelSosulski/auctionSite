package com.auction.data.repositories;

import com.auction.data.model.Bidding;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.math.BigInteger;
import java.util.List;

@Repository
public interface BiddingRepository extends JpaRepository<Bidding, Long> {
    @Query(value = "Select b.amount FROM Bidding b WHERE b.auction.id = ?1 ORDER BY b.amount DESC")
    List<BigInteger> findBiggestValue(Long id);
}
