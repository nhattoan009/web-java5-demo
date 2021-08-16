package com.poly.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.poly.entity.Product;
import com.poly.entity.Report;

public interface ProductDAO extends JpaRepository<Product, Integer> {

	@Query("SELECT p FROM Product p WHERE p.price BETWEEN ?1 AND ?2")
	List<Product> findByPrice(double min, double max);

	@Query("SELECT p FROM Product p WHERE p.name LIKE ?1")
	Page<Product> findByKeywords(String keywords, Pageable pageable);

	@Query("SELECT new Report(o.category, sum(o.price), count(o)) FROM Product o GROUP BY o.category ORDER BY sum(o.price) DESC" )
			List<Report> getInventoryByCategory();
	
	
	List<Product> findByPriceBetween(double minPrice, double maxPrice);

	Page<Product> findAllByNameLike(String keywords, Pageable pageable);
	
	
	
	@Query("SELECT count(id) FROM Product p")
	Integer findCountProduct();
	
	@Query("SELECT p FROM Product p WHERE p.discount > 0")
	List<Product> findProductDiscount();
}
