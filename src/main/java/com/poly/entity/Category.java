package com.poly.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;

@SuppressWarnings("serial")
@Data
@Entity
@Table(name = "Categories")
public class Category implements Serializable {

	@Id
	@Column(name = "Id")
	private String id;

	@Column(name = "Name")
	private String name;

	private String image;

	@JsonIgnore
	@OneToMany(mappedBy = "category")
	List<Product> products;

}
