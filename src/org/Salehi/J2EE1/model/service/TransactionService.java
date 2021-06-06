package org.Salehi.J2EE1.model.service;

import org.Salehi.J2EE1.model.entity.Product;
import org.Salehi.J2EE1.model.entity.Transaction;
import org.Salehi.J2EE1.model.repository.JpaRepository;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;

@Service
public class TransactionService {
    @Inject
    private JpaRepository<Transaction, Long> repository;

    public void save(Transaction transaction) {
        repository.save(transaction);
    }

    public void update(Transaction transaction) {
        repository.update(transaction);
    }

    public List<Transaction> findAllByTransactionState(String transactionState) {
        return repository.findAllByFieldName(Transaction.class, "stateOfTransaction", transactionState);
    }

    public List<Transaction> findAllUserTransactions(long userID) {
        return repository.findAllByChildId(Transaction.class, "users", userID);
    }

    public List<Transaction> findAll() {
        return repository.findAll(Transaction.class);
    }

    public Transaction findOneById(long transactionID) {
        return repository.findOneByIdWithChild(Transaction.class, "cartItems", transactionID);
    }

    public List<Transaction> transactionPaging(int pageNum) {
        return repository.pagination(Transaction.class, pageNum);
    }

    public List<Transaction> transactionPagingWithUserID(int pageNum, long id) {
        return repository.paginationWithChildID(Transaction.class, pageNum, "users", id);
    }
}
