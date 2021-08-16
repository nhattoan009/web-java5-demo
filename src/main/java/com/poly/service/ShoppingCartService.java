package com.poly.service;

import java.util.Collection;
import java.util.List;

import com.poly.entity.CartItem;

public interface ShoppingCartService {

	double getAmount();

	int getCount();

	Collection<CartItem> getAllItems();

	void clear();

	CartItem update(int productId, int qty);

	void remove(int productId);

	void add(CartItem item);

	double getAmountDiscount();

	int getCountCart();

	List<CartItem> getItems();

}
