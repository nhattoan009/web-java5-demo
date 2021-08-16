package com.poly.service.Impl;

import java.util.List;
import java.util.Optional;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import com.poly.entity.Product;

public interface ProductService{

	Product getById(Integer id);

	void delete(Product entity);

	long count();

	List<Product> findAll();

	Page<Product> findAll(Pageable pageable);

	Page<Product> findAllByNameLike(String keywords, Pageable pageable);

	List<Product> findByPriceBetween(double minPrice, double maxPrice);

	Page<Product> findByKeywords(String keywords, Pageable pageable);

	List<Product> findByPrice(double min, double max);

//	Product findById(Integer id);

	Product getOne(Integer id);

}
