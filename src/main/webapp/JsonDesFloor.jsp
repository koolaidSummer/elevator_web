<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%	
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		
		String url = "jdbc:mysql://elevator-db.cdpfvc1hzmbi.ap-northeast-2.rds.amazonaws.com:3306/elevator?serverTimezone=UTC";
		String dbId = "admin";
		String dbPwd = "kongys11";
		
		String desFloor = "";
		String sql = "SELECT DISTINCT * FROM (CTL_FLOOR_WEB)";
		
		JSONArray arr = new JSONArray();
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url, dbId, dbPwd);
			st = con.createStatement();
			rs = st.executeQuery(sql);
	
			while (rs.next()) {
				desFloor = rs.getString("CTL_FLOOR_WEB");
				JSONObject obj = new JSONObject();
				obj.put("desFloor", desFloor);
				if(obj != null){
					arr.add(obj);
				}
			}
	
			rs.close();
			st.close();
			con.close();
		} catch (ClassNotFoundException e) {
			System.out.println("db 드라이버 로딩 실패");
		} catch (SQLException e1) {
			System.out.println("sql구문 오류");
		}

		/* ----------------------------------------------------------------------------------------------------------- */
		
		sql = "SELECT DISTINCT * FROM (CTL_FLOOR_JETSON)";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url, dbId, dbPwd);
			st = con.createStatement();
			rs = st.executeQuery(sql);
	
			while (rs.next()) {
				desFloor = rs.getString("CTL_FLOOR_JETSON");
				JSONObject obj = new JSONObject();
				obj.put("desFloor", desFloor);
				if(obj != null){
					arr.add(obj);
				}
			}
			response.getWriter().write(arr.toString());
	
			rs.close();
			st.close();
			con.close();
		} catch (ClassNotFoundException e) {
			System.out.println("db 드라이버 로딩 실패");
		} catch (SQLException e1) {
			System.out.println("sql구문 오류");
		}

%>