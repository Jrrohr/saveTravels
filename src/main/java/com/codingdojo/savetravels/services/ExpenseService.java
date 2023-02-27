package com.codingdojo.savetravels.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.savetravels.models.Expense;
import com.codingdojo.savetravels.repositories.ExpenseRepository;

@Service
public class ExpenseService {
	@Autowired
	ExpenseRepository expenseRepo;
	
	public List<Expense> allExpenses(){
		return expenseRepo.findAll();
	}
	
	public Expense createExpense(Expense expense) {
		return expenseRepo.save(expense);
	}
	
	public Expense findExpense(Long id) {
        Optional<Expense> optionalExpense = expenseRepo.findById(id);
        if(optionalExpense.isPresent()) {
            return optionalExpense.get();
        } else {
            return null;
        }
    }
    
    public Expense updateExpense(Expense expense) {
    	return expenseRepo.save(expense);
    }
    
    public void deleteExpense(Long id) {
    	expenseRepo.deleteById(id);
    }
}
