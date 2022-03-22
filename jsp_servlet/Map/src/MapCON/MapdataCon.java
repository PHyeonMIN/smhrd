package MapCON;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import MapDAO.MapDAO;
import MapDTO.MapVO;

@WebServlet("/MapdataCon")
public class MapdataCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		MapDAO dao = new MapDAO();
		ArrayList<MapVO> arr = dao.MapData();
	
		Gson gson = new Gson();
		String json = gson.toJson(arr);
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.print(json);
	
	
	
	}

}
