package com.auction.core.schedule;

import com.auction.core.services.AuctionService;
import com.auction.data.model.Auction;
import com.auction.data.repositories.AuctionRepository;
import com.auction.utils.enums.AuctionStatus;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.util.List;

@Component
@Slf4j
public class ScheduledTask {

    @Autowired
    private AuctionService auctionService;


    @Scheduled(fixedDelay = 1000)
    public void scheduleCheckAuctionsEnds(){
        //log.info("Working- " + System.currentTimeMillis() / 1000);
        auctionService.finishedAuctions();
    }

}
