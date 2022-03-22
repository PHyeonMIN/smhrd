package com.snsCon;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.memberDTO.tm_memberDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.snsDAO.tm_snsDAO;
import com.snsDTO.tm_snsDTO;

@WebServlet("/tm_snsCon")
public class tm_snsCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setCharacterEncoding("utf-8");
		ServletContext context = getServletContext();
		HttpSession session = request.getSession();
		tm_memberDTO sessiondto = (tm_memberDTO) session.getAttribute("dto");
		String saveDir = context.getRealPath("tm_upload");
		String url = "";
		int maxSize = 50 * 1024 * 1024;

		System.out.println(saveDir);

		MultipartRequest multi = new MultipartRequest(request, saveDir, maxSize, "utf-8",
				new DefaultFileRenamePolicy());

		boolean isMulti = ServletFileUpload.isMultipartContent(request);
		if (isMulti) {
			tm_snsDAO dao = new tm_snsDAO();
			tm_snsDTO dto = new tm_snsDTO();
			String tb_title = multi.getParameter("tb_title");
			String tb_content = multi.getParameter("tb_content");
			String tb_file = multi.getFilesystemName("file");
			String mb_id = sessiondto.getMb_id();
			dto = new tm_snsDTO(tb_title, tb_content, tb_file, mb_id);

			System.out.println(tb_file + "눈 컨");

			try {
				int result = dao.uploadFile(dto);
				if (result > 0) {
					System.out.println("저장완료");
					url = "tm_imgSelect";
				} else {
					System.out.println("저장실패");
					url = "tm_UploadMain.jsp";
				}
				response.sendRedirect(url);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
		}
	}

}
