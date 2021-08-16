package com.poly.service;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ParamService {

	@Autowired
	HttpServletRequest request;

	public String getString(String name, String defaultValue) {
		name = request.getParameter(name);
		if (name != null) {
			return name;
		} else {
			return defaultValue;
		}
	}

	public int getInt(String name, int defaultValue) {
		name = request.getParameter(name);
		if (name != null) {
			return Integer.parseInt(name);
		} else {
			return defaultValue;
		}
	}

	public double getDouble(String name, double defaultValue) {
		name = request.getParameter(name);
		if (name != null) {
			return Double.parseDouble(name);
		} else {
			return defaultValue;
		}
	}

	public boolean getBoolean(String name, boolean defaultValue) {
		name = request.getParameter(name);
		if (name != null) {
			return Boolean.parseBoolean(name);
		} else {
			return defaultValue;
		}
	}

	public Date getDate(Date name, String pattern) {
		return new Date();
	}

//	public File save(MultipartFile file, String path) {
//
//	}

}
