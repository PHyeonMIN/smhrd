package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import Model.memberDTO;

@WebServlet("/ex02Gson")
public class ex02Gson extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// VO(DTO) 객체를 ArrayList에 담고 --> JSON으로 변환
		
		// 1. 1개만 보내기
		memberDTO member1 = new memberDTO("email1", "010-1111-1111", "광주 서구");
		memberDTO member2 = new memberDTO("email2", "010-2111-1111", "광주 동구");
		memberDTO member3 = new memberDTO("email3", "010-3111-1111", "광주 남구");
		memberDTO member4 = new memberDTO("email4", "010-4111-1111", "광주 북구");
	
		ArrayList<memberDTO> list = new ArrayList<memberDTO>();
		list.add(member1);
		list.add(member2);
		list.add(member3);
		list.add(member4);
		// 2. 데이터 보내기
		// Gson 객체 생성
		Gson gson = new Gson();
		
		// java -> json(문자열)
		// gson의 toJson(객체) --> String 타입의 json
		String json = gson.toJson(list);
	
		// 인코딩
		response.setCharacterEncoding("utf-8");
		
		// 출력해줄 PrintWriter객체 생성
		PrintWriter out = response.getWriter();
		
		// 응답
		out.print(json);
	}

}
