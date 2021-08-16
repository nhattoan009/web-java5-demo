package com.poly.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.dao.ProductDAO;
import com.poly.entity.CartItem;
import com.poly.entity.Product;
import com.poly.service.LikeService;
import com.poly.service.ShoppingCartService;
import com.poly.service.Impl.ProductService;

@Controller
public class CartController {
	
	@Autowired
	ProductDAO productDAO;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	ShoppingCartService cartService;
	
	@Autowired LikeService likeService;
	
	@GetMapping("shopingcart")
	public void list(Model model) {
//		Collection<OrderDetails> orderDetails = orderDetailService.getCart();
		model.addAttribute("cart", cartService.getAllItems());
		model.addAttribute("total", cartService.getAmount());
		model.addAttribute("totalCart", cartService.getCountCart());
		model.addAttribute("totalLike", likeService.getCount());
		model.addAttribute("totaldiscount", cartService.getAmountDiscount());
		
	}
	@GetMapping("addCart/{id}")
	public String addCart(@PathVariable("id") Integer id) {
		Product product = productService.getById(id);
		if (product != null) {
			CartItem item = new CartItem();
			item.setId(product.getId());
			item.setName(product.getName());
			item.setPrice(product.getPrice());
			item.setQuantity(1);
			item.setDiscount(product.getDiscount());
			cartService.add(item);
		}
		
		return "redirect:/shopingcart";
	}
	@GetMapping("deleteAll")
	public String deleteAll() {
		cartService.clear();
		return "redirect:/shopingcart";
	}
	
	@GetMapping("delete/{id}")
	public String delete(@PathVariable("id") Integer id) {
		cartService.remove(id);
		return "redirect:/shopingcart";
	}
	
	@PostMapping("update")
	public String update(@RequestParam("id") Integer id,
							@RequestParam("qty") Integer qty) {
		cartService.update(id, qty);
		return "redirect:/shopingcart";
	}
}