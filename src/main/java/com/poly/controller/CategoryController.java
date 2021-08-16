package com.poly.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import com.poly.dao.CategoryDAO;

@Controller
public class CategoryController {
	
	@Autowired
	CategoryDAO categoryDAO;
	
}
