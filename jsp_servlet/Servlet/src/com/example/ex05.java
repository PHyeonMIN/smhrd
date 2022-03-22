package com.example;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.xml.internal.bind.v2.runtime.unmarshaller.XsiNilLoader.Array;

@WebServlet("/ex05")
public class ex05 extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");	
		String[] hobby = request.getParameterValues("hobby");
		//System.out.println(Arrays.toString(hobby));
		String hobby_res ="";
		for (int i = 0; i < hobby.length; i++) {
			hobby_res+=hobby[i]+" ";
		}
		String gender = request.getParameter("gender");
		
		System.out.println(hobby_res);
		System.out.println(gender);
	}

}
