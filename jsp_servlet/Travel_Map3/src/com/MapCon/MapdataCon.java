package com.MapCon;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.MapDAO.MapDAO;
import com.MapDTO.MapDTO;
import com.google.gson.Gson;


@WebServlet("/MapdataCon")
public class MapdataCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String type = request.getParameter("type");
		String division = null;
		
		if(type.equals("restaurant")) {
			division = "맛집";
		}else if(type.equals("tour")) {
			division = "관광지";
		}else if(type.equals("cafe")) {
			division = "카페";
		}else if(type.equals("accomodation")) {
			division = "숙박시설";
		}
		
		
		
		MapDAO dao = new MapDAO();
		ArrayList<MapDTO> arr = dao.MapData(division);
	
		Gson gson = new Gson();
		String json = gson.toJson(arr);
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.print(json);
	
	
	
	}

}
