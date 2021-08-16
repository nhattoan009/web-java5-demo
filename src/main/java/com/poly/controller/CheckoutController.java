package com.poly.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.dao.AccountDAO;
import com.poly.dao.OrderDAO;
import com.poly.dao.OrderDetailDAO;
import com.poly.entity.CartItem;
import com.poly.entity.Order;
import com.poly.entity.OrderDetails;
import com.poly.service.SessionService;
import com.poly.service.ShoppingCartService;

@Controller
public class CheckoutController {
	
	@Autowired OrderDAO orderDAO;
	@Autowired	OrderDetailDAO orderDetailDAO;
	@Autowired	HttpSession session;
	@Autowired	SessionService sessionService;
	@Autowired	ShoppingCartService cartService;
	@Autowired	AccountDAO accountDAO;

	@GetMapping("checkout")
	public String checkoutGet(Model model) {
		model.addAttribute("cart", cartService.getAllItems());
		model.addAttribute("total", cartService.getAmount());
		model.addAttribute("totalCart", cartService.getCountCart());
		model.addAttribute("totaldiscount", cartService.getAmountDiscount());

		if (session.getAttribute("username") != null) {
			Order order = new Order();
			sessionService.setAttribute("mail", session.getAttribute("username"));

			model.addAttribute("order", order);
			model.addAttribute("cartOrder", session.getAttribute("cart"));
		}
		return "checkout";
	}


	@PostMapping("checkout")
	public String checkoutPost(@RequestParam("address") String address,
								@RequestParam("phone") String phone, Model model) {
		
		try {
			Order order = new Order();
//			order.setAccount((Account) session.getAttribute("username"));
			order.setCreatedate(new Date());
			order.setAddress(address);
			order.setPhone(phone);

			List<CartItem> cartItems = cartService.getItems();
			
			List<OrderDetails> listOrderDt = new ArrayList<>();
			for (CartItem i : cartItems) {
				
				OrderDetails details = new OrderDetails();
				details.setOrder(order);
				details.setPrice(i.getPrice());
//				details.setProduct(i.getProduct().getId());
				details.setQuantity(i.getQuantity());
				listOrderDt.add(details);
			}
			order.setOrderdetails(listOrderDt);
			
			orderDAO.save(order);
			orderDetailDAO.saveAll(listOrderDt);
			cartService.clear();
			
			return "redirect:/index";
		} catch (Exception e) {
			return "redirect:/index";
		}
	}

}
