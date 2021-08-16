package com.poly.controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.dao.CategoryDAO;
import com.poly.dao.ProductDAO;
import com.poly.entity.Category;
import com.poly.entity.Product;
import com.poly.service.LikeService;
import com.poly.service.SessionService;
import com.poly.service.ShoppingCartService;

@Controller
public class ShopController {
	
	@Autowired	ProductDAO productDAO;
	
	@Autowired	ShoppingCartService cartService;
	
	@Autowired CategoryDAO categoryDAO;
	
	@Autowired LikeService likeService;
	@Autowired SessionService session;

	@RequestMapping("shop")
	public String index(Model model, @RequestParam("page") Optional<Integer> page) {
		model.addAttribute("count", productDAO.findCountProduct());
		model.addAttribute("discount", productDAO.findProductDiscount());
		model.addAttribute("totalCart", cartService.getCountCart());
		model.addAttribute("totalLike", likeService.getCount());
		
		List<Category> list = categoryDAO.findAll();	
		model.addAttribute("list", list);
		
		Pageable pageable = PageRequest.of(page.orElse(0), 6);
		Page<Product> pageProduct = productDAO.findAll(pageable);	
		model.addAttribute("pageProduct", pageProduct);
		
		return "shop";
	}
	
	@RequestMapping("productSearchPage")
	public String searchAndPage(Model model, @RequestParam("name") Optional<String> name,
			@RequestParam("p") Optional<Integer> p) {

		String kwords = name.orElse(session.getAttribute("keywords"));
		session.setAttribute("keyword", kwords);

		Pageable pageable = PageRequest.of(p.orElse(0), 6);

		Page<Product> page = productDAO.findAllByNameLike("%" + kwords + "%", pageable);
		model.addAttribute("pageProduct", page);
		return "shop";
	}
		
}
