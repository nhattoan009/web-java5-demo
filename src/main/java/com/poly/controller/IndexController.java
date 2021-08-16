package com.poly.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poly.dao.CategoryDAO;
import com.poly.dao.ProductDAO;
import com.poly.entity.Category;
import com.poly.entity.Product;
import com.poly.service.LikeService;
import com.poly.service.ShoppingCartService;

@Controller
public class IndexController {
	@Autowired
	CategoryDAO categoryDAO;

	@Autowired
	ProductDAO productDAO;
	
	@Autowired
	ShoppingCartService cartService;
	
	@Autowired
	LikeService likeService;
	
	
	@RequestMapping("/index")
	public String index(Model model) {
		List<Category> list = categoryDAO.findAll();	
		model.addAttribute("list", list);
		
		List<Product> product = productDAO.findAll();	
		model.addAttribute("product", product);
		
		model.addAttribute("totalCart", cartService.getCountCart());
		model.addAttribute("totalLike", likeService.getCount());
		return "/index";
	}

	@RequestMapping("contact")
	public String contact() {
		return "contact";
	}

	@RequestMapping("productdetail")
	public String productdetail() {
		return "productdetail";
	}
	
	@ModelAttribute("ProductNew")
	public List<Product> getProductIndex(){
		Page<Product> page = productDAO.findAll(PageRequest.of(0, 8, Sort.by(Direction.DESC, "createdate")));
		return page.getContent();
	}
	
}
