package com.poly.service.Impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import com.poly.dao.ProductDAO;
import com.poly.entity.Product;

@Service
@SessionScope
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	ProductDAO productDAO;

	@Override
	public List<Product> findByPrice(double min, double max) {
		return productDAO.findByPrice(min, max);
	}

	@Override
	public Page<Product> findByKeywords(String keywords, Pageable pageable) {
		return productDAO.findByKeywords(keywords, pageable);
	}

	@Override
	public List<Product> findByPriceBetween(double minPrice, double maxPrice) {
		return productDAO.findByPriceBetween(minPrice, maxPrice);
	}

	@Override
	public Page<Product> findAllByNameLike(String keywords, Pageable pageable) {
		return productDAO.findAllByNameLike(keywords, pageable);
	}

	@Override
	public Page<Product> findAll(Pageable pageable) {
		return productDAO.findAll(pageable);
	}

	@Override
	public List<Product> findAll() {
		return productDAO.findAll();
	}


//	@Override
//	public Product findById(Integer id) {
//		return productDAO.findById(id);
//	}

	@Override
	public Product getOne(Integer id) {
		return productDAO.getOne(id);
	}

	@Override
	public long count() {
		return productDAO.count();
	}

	@Override
	public void delete(Product entity) {
		productDAO.delete(entity);
	}

	@Override
	public Product getById(Integer id) {
		return productDAO.getById(id);
	}
	
	
}
