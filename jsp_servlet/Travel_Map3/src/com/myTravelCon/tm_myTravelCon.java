package com.myTravelCon;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.memberDTO.tm_memberDTO;
import com.myTravelDAO.tm_myTravelDAO;
import com.myTravelDTO.tm_myTravelDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/tm_myTravelCon")
public class tm_myTravelCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");

		ServletContext context = getServletContext();
		String saveDir = context.getRealPath("fileUpload");
		int maxSize = 50 * 1024 * 1024;

		System.out.println(saveDir);

		MultipartRequest multi = new MultipartRequest(request, saveDir, maxSize, "utf-8",
				new DefaultFileRenamePolicy());

		HttpSession session = request.getSession();
		tm_memberDTO sessiondto = (tm_memberDTO) session.getAttribute("dto");

//		do {}
//			while();

//		for

//		while

		String count = multi.getParameter("count");
		int map_seq = Integer.parseInt(multi.getParameter("map_seq"));
		String travel_memo = (String) multi.getParameter("travel_memo");
		String travel_character = (String) multi.getParameter("travel_character");
		String travel_fileO = multi.getFilesystemName("travel_fileO");
		String travel_fileT = multi.getFilesystemName("travel_fileT");
		String mb_id = sessiondto.getMb_id();
		int travel_order = Integer.parseInt(multi.getParameter("travel_order"));

		System.out.println(map_seq + travel_memo + travel_character + travel_fileO + travel_fileT + mb_id + travel_order
				+ "마이 트래블컨");

		tm_myTravelDAO dao = new tm_myTravelDAO();
		tm_myTravelDTO dto = new tm_myTravelDTO(map_seq, travel_memo, travel_fileO, travel_fileT, travel_character,
				mb_id, travel_order);

		int cnt = dao.myTravelInsert(dto);
		if (cnt > 0) {
			System.out.println("입력성공");
		}
	}
}
