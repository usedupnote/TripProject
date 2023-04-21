package com.tripback.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tripback.dto.Att;
import com.tripback.dto.AttDetail;
import com.tripback.service.AttService;
import com.tripback.service.AttServicempl;

@WebServlet("/att")
public class AttServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private AttService as = AttServicempl.getInstance();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		process(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		process(request, response);
	}

	private void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String action = request.getParameter("action");
			switch (action) {
			case "search":
				search(request, response);
				break;
			case "view":
				view(request, response);
				break;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			request.setAttribute("msg", "잘못된 입력입니다");
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		}
	}

	private void search(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		int sido = Integer.parseInt(request.getParameter("sido"));
		int type = Integer.parseInt(request.getParameter("type"));
		String word = request.getParameter("word");
		List<Att> atts = as.selectAllBySidoAndContentTypeIdAndWord(sido, type, word);
//		for (Att att : atts) {
//			System.out.println(att);
//		}
		request.setAttribute("atts", atts);
		request.getRequestDispatcher("/tripsearch.jsp").forward(request, response);
	}

	private void view(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
		int contentId = Integer.parseInt(request.getParameter("contentId"));
		AttDetail att = as.selectByContentId(contentId);
		request.setAttribute("att", att);
		request.getRequestDispatcher("/view.jsp").forward(request, response);
	}
}
