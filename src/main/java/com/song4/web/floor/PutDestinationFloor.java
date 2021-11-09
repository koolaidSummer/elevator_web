package com.song4.web.floor;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.song4.web.db.ElevatorDAO;
import com.song4.web.db.FloorDTO;

@WebServlet("/floor_ctl")
public class PutDestinationFloor extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String floor_ctl = req.getParameter("floor_ctl");

		ElevatorDAO dao = new ElevatorDAO();
		dao.putDestinationFloor(floor_ctl);
		
		resp.sendRedirect("/floor_info.jsp");
	}

}
