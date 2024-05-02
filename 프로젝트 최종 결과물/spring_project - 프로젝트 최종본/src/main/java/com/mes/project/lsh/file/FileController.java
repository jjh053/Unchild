package com.mes.project.lsh.file;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class FileController {
	
	private FileDownload fileDownload;
	
	@Autowired
	public FileController(FileDownload fileDownload) {
		
		this.fileDownload = fileDownload;
	}
	
	@RequestMapping("/fileDownload")
	public void downloadFileController(@RequestParam("fileName") String fileName, HttpServletResponse response) {

		fileDownload.download(fileName, response);
	}
}
