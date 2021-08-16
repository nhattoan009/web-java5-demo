package com.poly.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor @NoArgsConstructor
@Entity
@Table(name="Accounts")
public class Account implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name="Username")
	@NotBlank(message = "{NotBlank.account.username}")
	private String username;
	
	@Column(name="Password")
	@NotBlank(message = "{NotBlank.account.password}")
	private String password;
	
	@Column(name="Fullname")
	private String fullname;
	@NotBlank(message = "{NotBlank.account.fullname}")
	
	@Column(name="Email")
	@NotBlank @Email(message = "{Email.account.email}")
	private String email;
	
	@Column(name="Activated") private Boolean activated = true;
	@Column(name="Admin") private Boolean admin = true;
	
	@JsonIgnore
	@OneToMany(mappedBy = "account") List<Order> orders;
	
}
