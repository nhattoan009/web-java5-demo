package com.poly.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poly.dao.CategoryDAO;
import com.poly.dao.ProductDAO;
import com.poly.entity.Product;

@Controller

public class ProductAdminController {

	@Autowired
	CategoryDAO categoryDAO;

	@Autowired
	ProductDAO productDAO;

	@Autowired
	ServletContext context;

	@RequestMapping("qlproduct")
	public void add(Model model) {
		model.addAttribute("product", new Product());
		List<Product> products = productDAO.findAll();
		model.addAttribute("products", products);

		if (categoryDAO.findAll() != null && categoryDAO.findAll().size() != 0) {
			model.addAttribute("category", categoryDAO.findAll());
		}
	}

	@RequestMapping("createproduct")
	public String createProduct(@ModelAttribute("product") Product product,
//			@RequestParam("image") MultipartFile image,
			Model model){

//		if (!image.isEmpty()) {
//			String filename = image.getOriginalFilename();
//			File file = new File(context.getRealPath("/img/" + filename));
//			image.transferTo(file);
//
//			product.setImage(filename);
//		}
		product.setImage("1");
		product.setAvailable(true);
		product.setCreatedate(new Date());

		productDAO.save(product);
		return "redirect:/qlproduct";
	}
	
	@RequestMapping("deleteProduct/{id}")
	public String create(@PathVariable("id") Integer id) {
		productDAO.deleteById(id);
		return "redirect:/qlproduct";
	}
	
	@RequestMapping("/editProduct/{id}")
	public String edit(Model model, @PathVariable("id") Integer id) {
		Product product = productDAO.findById(id).get();
		model.addAttribute("product", product);
		
		List<Product> products = productDAO.findAll();
		model.addAttribute("products", products);
		return "redirect:/qlproduct";
	}
}
