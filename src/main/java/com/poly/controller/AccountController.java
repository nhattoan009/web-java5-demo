package com.poly.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poly.dao.AccountDAO;
import com.poly.entity.Account;
import com.poly.service.CookieService;
import com.poly.service.ParamService;
import com.poly.service.SessionService;

@Controller
public class AccountController {
	@Autowired
	CookieService cookie;
	@Autowired
	ParamService paramService;
	@Autowired
	AccountDAO accountDAO;
	@Autowired
	SessionService session;

	
	@RequestMapping("qlaccount")
	public void qlaccount(Model model) {
		Account account = new Account();
		model.addAttribute("account", account);
		List<Account> accounts = accountDAO.findAll();
		model.addAttribute("accounts", accounts);
	}

	@RequestMapping("/createAccount")
	public String createAccount(@ModelAttribute("account") Account account, Model model) {
		accountDAO.save(account);
		return "redirect:/qlaccount";
	}

	@RequestMapping("/deleteAccount/{id}")
	public String deleteAccount(@PathVariable("id") String id) {
		accountDAO.deleteById(id);
		return "redirect:/qlaccount";
	}

	@RequestMapping("/editAccount/{id}")
	public String editAccount(Model model, @PathVariable("id") String id) {
		Account account = accountDAO.findById(id).get();
		model.addAttribute("account", account);
		List<Account> accounts = accountDAO.findAll();
		model.addAttribute("accounts", accounts);
		return "redirect:/qlaccount";
	}

	@RequestMapping("/updateAccount")
	public String update(Account account) {
		accountDAO.save(account);
		return "redirect:/edit/" + account.getUsername();
	}

}
