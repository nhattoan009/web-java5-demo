package com.poly.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import com.poly.entity.CartItem;

@SessionScope
@Service
public class ShoppingCartServiceImpl implements ShoppingCartService {

	@Autowired
	HttpSession session;
	
	Map<Integer, CartItem> map = new HashMap<>();

	@Override
	public void add(CartItem item) {
		CartItem cartItem = map.get(item.getId());
		if (cartItem == null) {
			map.put(item.getId(), item);
		} else {
			cartItem.setQuantity(cartItem.getQuantity() + 1);
			session.setAttribute("cartItem", cartItem);
		}
	}

	@Override
	public void remove(int productId) {
		map.remove(productId);
	}

	@Override
	public CartItem update(int productId, int qty) {
		CartItem cartItem = map.get(productId);
		cartItem.setQuantity(qty);
		return cartItem;
	}

	@Override
	public void clear() {
		map.clear();
	}

	@Override
	public Collection<CartItem> getAllItems() {
		return map.values();
	}
	
	@Override
	public List<CartItem> getItems() {
		ArrayList<CartItem> list = new ArrayList<CartItem>();
		for (Integer i : map.keySet()) {
			list.add(map.get(i));
		}
		return list;
	}

	@Override
	public int getCount() {
		if (map.isEmpty()) {
			return 1;
		}
		return map.values().size();
	}
	
	@Override
	public int getCountCart() {
		int tong = 0;
		CartItem cartItem = null;
		for (Integer id : map.keySet()) {
			cartItem = map.get(id);
			tong = tong + cartItem.getQuantity();
		}
		return tong;
	}

	@Override
	public double getAmount() {
		return map.values().stream().mapToDouble(item -> item.getQuantity() * item.getPrice()).sum();
	}

	@Override
	public double getAmountDiscount() {
		return map.values().stream()
				.mapToDouble(
						item -> item.getQuantity() * (item.getPrice() - item.getPrice() * (item.getDiscount() / 100)))
				.sum();
	}

}
