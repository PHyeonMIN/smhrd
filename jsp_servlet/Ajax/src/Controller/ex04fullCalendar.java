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

import Model.CalendarDTO;

@WebServlet("/ex04fullCalendar")
public class ex04fullCalendar extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		CalendarDTO cal1 = new CalendarDTO("제목1", "2021-12-01", "2021-12-03");
		CalendarDTO cal2 = new CalendarDTO("제목2", "2021-12-05", "2021-12-10");
		CalendarDTO cal3 = new CalendarDTO("제목3", "2021-12-14", "2021-12-24");
		
		ArrayList<CalendarDTO> list = new ArrayList<CalendarDTO>();
		list.add(cal1);
		list.add(cal2);
		list.add(cal3);
		
		// 응답
		response.setCharacterEncoding("utf-8");
		PrintWriter out= response.getWriter();
		
		// Gson으로 json으로 변환해서 응답
		Gson gson = new Gson();
		out.print(gson.toJson(list));
	
	
	
	
	
	
	
	}

}
