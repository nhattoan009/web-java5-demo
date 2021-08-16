package com.poly.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import com.poly.dao.CategoryDAO;
import com.poly.entity.Category;

@Controller
public class CategoryAdminController {
	@Autowired
	CategoryDAO categoryDAO;

	@RequestMapping("qlcategory")
	public void qlCategory(Model model) {
		Category category = new Category();
		model.addAttribute("category", category);
		List<Category> categorys = categoryDAO.findAll();
		model.addAttribute("categorys", categorys);
	}

	@RequestMapping("/edit/{id}")
	public String edit(Model model, @PathVariable("id") String id) {
		Category category = categoryDAO.findById(id).get();
		model.addAttribute("category", category);
		List<Category> categorys = categoryDAO.findAll();
		model.addAttribute("categorys", categorys);
		return "redirect:/qlcategory";
	}
//
	@RequestMapping("/create")
	public String create(Category category) {
		categoryDAO.save(category);
		return "redirect:/qlcategory";
	}
//
	@RequestMapping("/update")
	public String update(Category category) {
		categoryDAO.save(category);
		return "redirect:/edit/" + category.getId();
	}
//
	@RequestMapping("/delete/{id}")
	public String delete(@PathVariable("id") String id) {
		categoryDAO.deleteById(id);
		return "redirect:/qlcategory";
	}
}
