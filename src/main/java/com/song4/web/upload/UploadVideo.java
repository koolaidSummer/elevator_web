package com.song4.web.upload;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig(
		fileSizeThreshold=1024*1024,
		maxFileSize=1024*1024*100,
		maxRequestSize=1024*1024*100*5
		)
@WebServlet("/upload")
public class UploadVideo extends HttpServlet{
	
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException ,IOException {
		
		String uname = req.getParameter("uname");
		String floor = req.getParameter("floor");
		
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
		
		String sql = "INSERT INTO infoma(UNAME,FLOOR,FILENAME) VALUES(?,?,?)";
		String url = "jdbc:mysql://elevator-db.cdpfvc1hzmbi.ap-northeast-2.rds.amazonaws.com:3306/elevator?serverTimezone=UTC";
		String dbId = "admin";
        String dbPwd = "kongys11";
        
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url,dbId,dbPwd);
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, uname);
			st.setString(2, floor);
			st.setString(3, fileName);
			st.executeUpdate();
			
			
			st.close();
			con.close();
		} catch (ClassNotFoundException e) {
			System.out.println("db 드라이버 로딩 실패");
		} catch (SQLException e) {
			System.out.println("sql구문 오류");
		}
		
		resp.sendRedirect("index.jsp");
	};
}