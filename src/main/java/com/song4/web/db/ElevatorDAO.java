package com.song4.web.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class ElevatorDAO {
	private Connection con = null;
	private PreparedStatement prst = null;
	private Statement st = null;
	private ResultSet rs = null;

	private String url = "jdbc:mysql://elevator-db.cdpfvc1hzmbi.ap-northeast-2.rds.amazonaws.com:3306/elevator?serverTimezone=UTC";
	private String dbId = "admin";
	private String dbPwd = "kongys11";

	public void signUpToDB(String uname, String floor, String fileName, String pwd) {
		String sql = "INSERT INTO INFO (UNAME,FLOOR,FILENAME,PWD) VALUES (?,?,?,?)";

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url, dbId, dbPwd);
			prst = con.prepareStatement(sql);
			prst.setString(1, uname);
			prst.setString(2, floor);
			prst.setString(3, fileName);
			prst.setString(4, pwd);
			prst.executeUpdate();

			prst.close();
			con.close();
		} catch (ClassNotFoundException e) {
			System.out.println("db 드라이버 로딩 실패");
		} catch (SQLException e) {
			System.out.println("sql구문 오류");
		}
	}


	public void putDestinationFloor(String floor) {
		String sql = "INSERT INTO CTL_FLOOR_WEB (CTL_FLOOR_WEB) VALUES (?)";

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url, dbId, dbPwd);
			prst = con.prepareStatement(sql);
			prst.setString(1, floor);
			prst.executeUpdate();

			prst.close();
			con.close();
		} catch (ClassNotFoundException e) {
			System.out.println("db 드라이버 로딩 실패");
		} catch (SQLException e) {
			System.out.println("sql구문 오류");
		}
	}

	
}
