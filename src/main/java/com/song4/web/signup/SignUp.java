package com.song4.web.signup;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.song4.web.db.ElevatorDAO;

@MultipartConfig(
		fileSizeThreshold=1024*1024,
		maxFileSize=1024*1024*100,
		maxRequestSize=1024*1024*100*5
		)
@WebServlet("/sign_up")
public class SignUp extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String uname = req.getParameter("uname");
		String floor = req.getParameter("floor");
		String pwd = req.getParameter("pwd");
		System.out.println(uname);
		System.out.println(floor);
		System.out.println(pwd);
		
		Part filePart = req.getPart("file");
		String fileName = filePart.getSubmittedFileName();
		InputStream fis = filePart.getInputStream();
		
		String realPath = req.getServletContext().getRealPath("/upload");
		
		String filePath = realPath + File.separator + fileName;
		FileOutputStream fos = new FileOutputStream(filePath);
				
		byte[] buf = new byte[1024];
		int size = 0;
		while((size=fis.read(buf)) != -1) {
			fos.write(buf,0,size);
		}
		fos.close();
		fis.close();
		
		ElevatorDAO dao = new ElevatorDAO();
		dao.signUpToDB(uname, floor, fileName, pwd);
		
		resp.sendRedirect("end.jsp");
	
	}
}