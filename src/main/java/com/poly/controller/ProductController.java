package com.poly.controller;
import javax.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import com.poly.dao.CategoryDAO;
import com.poly.dao.ProductDAO;
import com.poly.service.UploadService;
import com.poly.service.Impl.ProductService;

@Controller
public class ProductController {
	@Autowired
	ProductDAO productDAO;
	@Autowired
	CategoryDAO categoryDAO;
	@Autowired
	CategoryAdminController categoryController;
	@Autowired
	ServletContext context;
	@Autowired
	UploadService upload;
	@Autowired
	ProductService product;

//	@RequestMapping("shop")
//	public String list(Model model) {
//		model.addAttribute("product", product.findAll());
//		return "shop";
//	}

}
