package com.poly.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.dao.AccountDAO;
import com.poly.entity.Account;
import com.poly.service.CookieService;
import com.poly.service.SessionService;

@Controller
public class LoginController {

	@Autowired
	AccountDAO accountDAO;
	@Autowired
	SessionService session;
	@Autowired
	CookieService cookie;

	@GetMapping("register")
	public void register() {
	}

	@PostMapping("/register")
	public String register(@ModelAttribute("register") Account account, Model model) {
		account.setAdmin(false);
		accountDAO.save(account);
		return "redirect:/login";
	}

	@RequestMapping("/logout")
	public String logout() {
		session.removeAttribute("username");
		session.setAttribute("username", null);
		session.setAttribute("isLogin", false);
		session.setAttribute("isAdmin", false);
		return "redirect:/index";
	}

	@GetMapping("/login")
	public String login(Model model) {
		Account account = new Account();
		model.addAttribute("account", account);
		return "login";
	}

	@PostMapping("/login")
	public String login(@Validated @ModelAttribute("account") Account acc, BindingResult result, Model model,
			@RequestParam("username") String username, @RequestParam("password") String password,
			@RequestParam(name = "remember", defaultValue = "true") Boolean remember) {
		
		try {
			Account account = accountDAO.findById(username).get();
			if (username.equals(account.getUsername()) && password.equals(account.getPassword())) {
				if (remember == true) {
					cookie.create("username", password, 10);
					if (account.getAdmin() == true) {
						session.setAttribute("isAdmin", true);
					} else {
						session.setAttribute("isAdmin", false);
					}
				}
				session.setAttribute("account", account);
				session.setAttribute("isLogin", true);
				
						session.setAttribute("username", account.getUsername());
						Object uri = session.getAttribute("uri");
						if (uri != null) {
							session.removeAttribute("uri");
							return "redirect:"+ uri;
						}
						return "redirect:/index";
				
			} else {
				session.setAttribute("isLogin", false);
				return "login";
			}
		} catch (Exception e) {
			session.setAttribute("isLogin", false);
			return "login";
		}
		
		
	}

}
