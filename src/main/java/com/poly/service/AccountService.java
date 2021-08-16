package com.poly.service;

import java.util.List;
import java.util.Optional;

import com.poly.entity.Account;

public interface AccountService {

	void deleteAll();

	void deleteAll(List<Account> entities);

	void deleteAllById(List<String> ids);

	void delete(Account entity);

	void deleteById(String id);

	long count();

	List<Account> findAllById(List<String> ids);

	List<Account> findAll();

	boolean existsById(String id);

	Optional<Account> findById(String id);

	List<Account> saveAll(List<Account> entities);

	Account save(Account entity);
	
}
