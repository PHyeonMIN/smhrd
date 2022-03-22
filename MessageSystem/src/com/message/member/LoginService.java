package com.message.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.inter.Command;
import com.message.DAO.memberDAO;
import com.message.DTO.memberDTO;

public class LoginService implements Command {

	public String execute(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		// throws : 메소드 안에 전체 예외처리
		HttpSession session = request.getSession();
		request.setCharacterEncoding("utf-8");
		String email = request.getParameter("email");
		String pw = request.getParameter("pw");

		memberDAO dao = new memberDAO();
		memberDTO dto_up = new memberDTO(email, pw);
		// memberDAO에서 넘어오는 DTO값을 받아서
		// DTO가 null이 아니였을때는 로그인처리를 하고
		// DTO가 null이였을떄는 'LoginFalse.jsp'로 이동하게 하시오
		memberDTO dto = dao.Login(dto_up);
		
		String nextpage="";
		if (dto != null) {
			session.setAttribute("dto", dto);

			nextpage = "main.jsp";
		} else {
			nextpage = "LoginFalse.jsp";
		}
		return nextpage;
	}
	
	
}
