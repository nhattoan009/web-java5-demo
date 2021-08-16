package com.poly.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class CartItem {
	private Integer id;
	private String name;
	private double price;
	private int quantity = 1;
	private double discount = 0;
	private Product product;
}
