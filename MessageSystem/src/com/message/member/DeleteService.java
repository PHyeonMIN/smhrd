package com.message.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inter.Command;
import com.message.DAO.memberDAO;

public class DeleteService implements Command {	

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String email = request.getParameter("delete_email");

		// member_message 테이블에서 위 email값을 삭제 후
		// 다시 'selectMember.jsp'로 이동하시오
		memberDAO dao = new memberDAO();
		int cnt = dao.Delete(email);
		
		return "selectMember.jsp";
		
	}
	
}
