package com.poly.service;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import com.poly.entity.LikeItem;

@SessionScope
@Service
public class LikeServiceImpl implements LikeService {

	@Autowired
	HttpSession session;

	Map<Integer, LikeItem> map = new HashMap<>();

	@Override
	public void add(LikeItem item) {
		LikeItem likeItem = map.get(item.getId());
		if (likeItem == null) {
			map.put(item.getId(), item);
		} else {
			session.setAttribute("likeItem", likeItem);
		}
	}

	@Override
	public void remove(int productId) {
		map.remove(productId);
	}

	@Override
	public void clear() {
		map.clear();
	}

	@Override
	public Collection<LikeItem> getAllItems() {
		return map.values();
	}

	@Override
	public int getCount() {
		int tong = 0;
		LikeItem likeItem = null;
		for (Integer id : map.keySet()) {
			likeItem = map.get(id);
			tong = tong + likeItem.getQuantity();
		}
		return tong;
	}

}
