package com.auction.data.repositories;

import com.auction.data.model.TransactionAssessment;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TransactionAssessmentRepository extends JpaRepository<TransactionAssessment, Long> {
}
