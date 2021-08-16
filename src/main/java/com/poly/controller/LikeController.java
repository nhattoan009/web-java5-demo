package com.poly.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.poly.entity.CartItem;
import com.poly.entity.LikeItem;
import com.poly.entity.Product;
import com.poly.service.LikeService;
import com.poly.service.ShoppingCartService;
import com.poly.service.Impl.ProductService;

@Controller
public class LikeController {
	
	@Autowired
	LikeService likeService;
	@Autowired
	ProductService productService;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	ShoppingCartService cartService;
	

	@GetMapping("shopinglike")
	public void list(Model model) {
		model.addAttribute("totalLike", likeService.getCount());
		model.addAttribute("like", likeService.getAllItems());
		model.addAttribute("totalCart", cartService.getCountCart());
	}
	
	@GetMapping("addLike/{id}")
	public String addLike(@PathVariable("id") Integer id) {
		Product product = productService.getById(id);
		if (product != null) {
			LikeItem item = new LikeItem();
			item.setId(product.getId());
			item.setName(product.getName());
			item.setPrice(product.getPrice());
			item.setQuantity(1);
			item.setDiscount(product.getDiscount());
			likeService.add(item);
		}
		
		return "redirect:/shopinglike";
	}
	@GetMapping("deleteAllLike")
	public String deleteAllLike() {
		likeService.clear();
		return "redirect:/shopinglike";
	}
	
	@GetMapping("deleteLike/{id}")
	public String deleteLike(@PathVariable("id") Integer id) {
		likeService.remove(id);
		return "redirect:/shopinglike";
	}
}
