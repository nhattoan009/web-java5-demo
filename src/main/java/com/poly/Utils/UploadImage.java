package com.poly.Utils;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

public class UploadImage {
	@Autowired
	ServletContext context;

	@PostMapping("/send")
	public String sand(@RequestParam("img") MultipartFile attach) throws IllegalStateException, IOException {

		if (!attach.isEmpty()) {
			String filename = attach.getOriginalFilename();
			File file = new File(context.getRealPath(filename) + "/img/");
			attach.transferTo(file);
		}
		return "uploafFile";
	}
}
