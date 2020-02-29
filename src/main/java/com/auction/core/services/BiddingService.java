package com.auction.core.services;

import com.auction.data.model.Auction;
import com.auction.data.model.Bidding;
import com.auction.data.repositories.BiddingRepository;
import com.auction.dto.MyBiddingsDTO;
import com.auction.utils.enums.AuctionStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Service
@Transactional
public class BiddingService {

    @Autowired
private BiddingRepository biddingRepository;


    public List<MyBiddingsDTO> getBiddingsByLogin(String login) {
        List<Bidding> allUserBiddings = biddingRepository
                .findAllByBiddingUserLoginAndAuctionStatusOrderByAuctionId(
                        login, AuctionStatus.PENDING);
        Set<Auction> biddingsAuctions = allUserBiddings.stream()
                .map(Bidding::getAuction).collect(Collectors.toSet());
        List<MyBiddingsDTO> myBiddings = new ArrayList<>();

        biddingsAuctions.forEach(a -> {
            MyBiddingsDTO myBidding = new MyBiddingsDTO();
            myBidding.setActualPrice(a.getActualPrice());
            myBidding.setAuctionId(a.getId());
            myBidding.setBidsNumber(a.getBiddingList().size());
            myBidding.setCategoryId(a.getCategory().getId());
            myBidding.setCategoryName(a.getCategory().getName());
            myBidding.setDateEnded(a.getDateEnded());
            myBidding.setAuctionTitle(a.getTitle());
            Bidding bid = biddingRepository
                    .findBiggestBid(a.getId(), PageRequest.of(0, 1)).get(0);
            if (bid.getBiddingUser().getLogin().equalsIgnoreCase(login)) {
                myBidding.setIsUserBidHighest(true);
            } else {
                myBidding.setIsUserBidHighest(false);
            }
            myBiddings.add(myBidding);
        });

        return myBiddings;
    }

}
