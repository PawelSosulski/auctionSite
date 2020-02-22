package com.auction.data.repositories;

import com.auction.data.model.Purchase;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PurchaseRepository extends JpaRepository<Purchase,Long> {

    @Query(value = "SELECT p FROM Purchase p WHERE p.auction.id IN ?1 ORDER BY p.auction.dateEnded DESC")
    List<Purchase> findAllByAuctionIds(List<Long> auctionIdList);

}
