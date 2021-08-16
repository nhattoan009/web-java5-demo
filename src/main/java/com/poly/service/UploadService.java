package com.poly.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class UploadService {
	@Autowired
	ServletContext app;

	public File save(MultipartFile file, String thuMuc) throws IOException {
		File tmFile = new File(app.getRealPath(thuMuc));
		if (!tmFile.exists())
			tmFile.mkdir();

		File convertFile = new File(tmFile, file.getOriginalFilename());
		convertFile.createNewFile();

		FileOutputStream fout = new FileOutputStream(convertFile);
		fout.write(file.getBytes());
		fout.close();

		return convertFile;
	}
}