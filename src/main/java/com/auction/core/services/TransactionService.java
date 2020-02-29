package com.auction.core.services;

import com.auction.data.model.Auction;
import com.auction.data.model.Purchase;
import com.auction.data.model.TransactionAssessment;
import com.auction.data.model.UserAccount;
import com.auction.data.repositories.PurchaseRepository;
import com.auction.data.repositories.TransactionAssessmentRepository;
import com.auction.data.repositories.UserAccountRepository;
import com.auction.dto.*;
import com.auction.utils.enums.TransactionRole;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.dozer.Mapper;

import javax.transaction.Transactional;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.DecimalFormat;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import static java.util.Comparator.reverseOrder;

@Service
@Transactional
public class TransactionService {

    private Mapper mapper;
    private PurchaseRepository purchaseRepository;
    private TransactionAssessmentRepository transactionAssessmentRepository;
    private UserAccountRepository userAccountRepository;

    @Autowired
    public TransactionService(Mapper mapper, PurchaseRepository purchaseRepository, TransactionAssessmentRepository transactionAssessmentRepository, UserAccountRepository userAccountRepository) {
        this.mapper = mapper;
        this.purchaseRepository = purchaseRepository;
        this.transactionAssessmentRepository = transactionAssessmentRepository;
        this.userAccountRepository = userAccountRepository;
    }

    public TransactionDTO getPurchase(Long purchaseId) {
        Purchase purchase = purchaseRepository.getOne(purchaseId);
        TransactionDTO transaction = new TransactionDTO();
        transaction.setPurchaseId(purchaseId);
        transaction.setAmount(purchase.getAmount());
        transaction.setAuction(mapper.map(purchase.getAuction(), AuctionDTO.class));
        transaction.setBuyerUser(mapper.map(purchase.getBuyerUser(), TransactionUserDTO.class));
        transaction.setSellerUser(mapper.map(purchase.getAuction().getSeller(), TransactionUserDTO.class));
        transaction.setTransactionAssessment(mapper.map(purchase.getTransactionAssessment(), TransactionAssessmentDTO.class));

        return transaction;
    }

    public List<TransactionDTO> findUserTransactions(TransactionRole role) {
        String login = SecurityContextHolder.getContext().getAuthentication().getName();
        List<TransactionDTO> transactionsDTO = new ArrayList<>();
        Optional<UserAccount> oneByLogin = userAccountRepository.getOneByLogin(login);
        if (oneByLogin.isPresent()) {
            UserAccount user = oneByLogin.get();
            List<Purchase> transactions;
            if (role == TransactionRole.Buyer) {
                transactions = user.getPurchases().stream()
                        .filter(a -> a.getBuyerUser().getLogin().equalsIgnoreCase(login))
                        .sorted(Comparator.comparing((Purchase f) -> f.getAuction().getDateEnded()).reversed())
                        .collect(Collectors.toList());
            } else {
                List<Long> auctionIdList = user.getMyAuctions().stream()
                        .map(Auction::getId)
                        .collect(Collectors.toList());
                transactions = purchaseRepository.findAllByAuctionIds(auctionIdList);
            }
            transactions.forEach(a -> {
                TransactionDTO transaction = new TransactionDTO();
                transaction.setPurchaseId(a.getId());
                transaction.setAmount(a.getAmount());
                transaction.setTransactionAssessment(
                        mapper.map(a.getTransactionAssessment(), TransactionAssessmentDTO.class));
                transaction.setAuction(mapper.map(a.getAuction(), AuctionDTO.class));
                transaction.setSellerUser(mapper.map(a.getAuction().getSeller(), TransactionUserDTO.class));
                transaction.setBuyerUser(mapper.map(a.getBuyerUser(), TransactionUserDTO.class));
                transactionsDTO.add(transaction);
            });
        }
        return transactionsDTO;
    }


    public List<TransactionDTO> findUserTransactionsByLogin(TransactionRole role, String login) {
        List<TransactionDTO> transactionsDTO = new ArrayList<>();
        Optional<UserAccount> oneByLogin = userAccountRepository.getOneByLogin(login);
        if (oneByLogin.isPresent()) {
            UserAccount user = oneByLogin.get();
            List<Purchase> transactions;
            if (role == TransactionRole.Buyer) {
                transactions = user.getPurchases().stream()
                        .filter(a -> a.getBuyerUser().getLogin().equalsIgnoreCase(login))
                        .sorted(Comparator.comparing((Purchase f) -> f.getAuction().getDateEnded()).reversed())
                        .collect(Collectors.toList());
            } else {
                List<Long> auctionIdList = user.getMyAuctions().stream()
                        .map(Auction::getId)
                        .collect(Collectors.toList());
                transactions = purchaseRepository.findAllByAuctionIds(auctionIdList);
            }
            transactions.forEach(a -> {
                TransactionDTO transaction = new TransactionDTO();
                transaction.setPurchaseId(a.getId());
                transaction.setAmount(a.getAmount());
                transaction.setTransactionAssessment(
                        mapper.map(a.getTransactionAssessment(), TransactionAssessmentDTO.class));
                transaction.setAuction(mapper.map(a.getAuction(), AuctionDTO.class));
                transaction.setSellerUser(mapper.map(a.getAuction().getSeller(), TransactionUserDTO.class));
                transaction.setBuyerUser(mapper.map(a.getBuyerUser(), TransactionUserDTO.class));
                transactionsDTO.add(transaction);
            });
        }
        return transactionsDTO;
    }

    public AverageRateDTO getAverageRates(List<TransactionDTO> purchases, List<TransactionDTO> sales) {
        AverageRateDTO averageRateDTO = new AverageRateDTO();
        averageRateDTO.setNumberOfRates(0L);
        averageRateDTO.setSumOfRates(0L);
        averageRateDTO.setAverageRate(new BigDecimal(0));
        purchases.forEach(a -> {
            if (a.getTransactionAssessment().getBuyerRating() != null) {
                averageRateDTO.setNumberOfRates(averageRateDTO.getNumberOfRates() + 1L);
                averageRateDTO.setSumOfRates(averageRateDTO.getSumOfRates() + a.getTransactionAssessment().getBuyerRating());
            }
        });

        sales.forEach(a -> {
            if (a.getTransactionAssessment().getSellerRating() != null) {
                averageRateDTO.setNumberOfRates(averageRateDTO.getNumberOfRates() + 1L);
                averageRateDTO.setSumOfRates(averageRateDTO.getSumOfRates() + a.getTransactionAssessment().getSellerRating());
            }
        });

        if (averageRateDTO.getSumOfRates() != 0) {
            Double average = ((double) averageRateDTO.getSumOfRates() / averageRateDTO.getNumberOfRates());
            BigDecimal bd = new BigDecimal(average).setScale(2, RoundingMode.UP);
            averageRateDTO.setAverageRate(bd);
        }

        return averageRateDTO;
    }


    public void fillTransaction(RateDTO rate) {
        TransactionAssessment transactionAssessment = purchaseRepository.getOne(rate.getPurchaseId()).getTransactionAssessment();
        if (rate.getRole() == TransactionRole.Buyer) {
            transactionAssessment.setSellerNote(rate.getRateDescription());
            transactionAssessment.setSellerRating(rate.getRateValue());
        } else {
            transactionAssessment.setBuyerNote(rate.getRateDescription());
            transactionAssessment.setBuyerRating(rate.getRateValue());
        }
        transactionAssessmentRepository.save(transactionAssessment);

    }
}
