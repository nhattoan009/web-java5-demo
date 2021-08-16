package com.poly.service;

import java.util.Collection;

import com.poly.entity.LikeItem;

public interface LikeService {

	int getCount();

	Collection<LikeItem> getAllItems();

	void clear();

	void remove(int productId);

	void add(LikeItem item);

}
