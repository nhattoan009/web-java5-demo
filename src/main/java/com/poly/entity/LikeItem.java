package com.poly.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class LikeItem {
	private Integer id;
	private String name;
	private double price;
	private double discount = 0;
	private int quantity = 1;
	private Product product;
}
