package com.codingdojo.savetravels.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.codingdojo.savetravels.models.Expense;
import com.codingdojo.savetravels.services.ExpenseService;

@Controller
public class ExpenseController {
	@Autowired
	ExpenseService expenseService;
	
	@GetMapping("/")
	public String index(Model model, @ModelAttribute("expense") Expense expense) {
		List<Expense> allExpenses = expenseService.allExpenses();
		model.addAttribute("allExpenses", allExpenses);
		Double totalCost = 0.0;
		for(Expense oneExpense : allExpenses) {
			totalCost += oneExpense.getAmount();
		}
		model.addAttribute("total", totalCost);
		return "index.jsp";
	}
	
	@PostMapping("/")
	public String create(@Valid @ModelAttribute("expense") Expense expense, BindingResult result, Model model) {
		if (result.hasErrors()) {
			List<Expense> allExpenses = expenseService.allExpenses();
			model.addAttribute("allExpenses", allExpenses);
			return "index.jsp";
        } else {
            expenseService.createExpense(expense);
            return "redirect:/";
        }
	}
	
	@GetMapping("/expenses/edit/{id}")
	public String editForm(Model model, @PathVariable("id") Long id) {
		Expense expense = expenseService.findExpense(id);
		model.addAttribute("expense", expense);
		return "edit.jsp";
	}
	
	@PutMapping("/edit/{id}")
	public String edit(@Valid @ModelAttribute("expense") Expense expense, BindingResult result) {
		if (result.hasErrors()) {
			return "edit.jsp";
		} else {
			expenseService.updateExpense(expense);
			return "redirect:/";
		}
	}
	
	@GetMapping("/expenses/{id}")
	public String show(Model model, @PathVariable("id") Long id) {
		Expense expense = expenseService.findExpense(id);
		model.addAttribute("expense", expense);
		return "show.jsp";
	}
	
	@DeleteMapping("/expenses/delete/{id}")
	public String delete(@PathVariable("id") Long id) {
		expenseService.deleteExpense(id);
		return "redirect:/";
	}
}
