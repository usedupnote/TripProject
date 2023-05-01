package servlet;

import java.io.IOException;
import java.sql.*;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dto.*;
import service.*;

@WebServlet("/sort")
public class SortServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private ReviewService rs = ReviewServiceImpl.getInstance();
	private NoticeService ns = NoticeServiceImpl.getInstance();
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sort = request.getParameter("sort");
		System.out.println("sort=["+sort+"]");
		
		try {
			switch(sort) {
				case "name"                :   sortingWithName(request, response); 					break;
				case "hits"                :   sortingWithHits(request, response); 					break;
				case "latestArticle"       :   sortingWithLatestArticle(request, response); 		break;
				case "noticeName"          :   sortingWithNoticeName(request, response); 			break;
				case "noticeHits"          :   sortingWithNoticeHits(request, response); 			break;
				case "noticeLatestArticle" :   sortingWithNoticeLatestArticle(request, response);   break;
			}
		}  catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect(request.getContextPath()+"/error/error.jsp");
		}
		
	}
	
	private void sortingWithNoticeLatestArticle(HttpServletRequest request, HttpServletResponse response) throws ServletException, SQLException, IOException {
		List<Notice> notices = ns.selectAll();
		for(int i=0; i<notices.size(); i++) {
			System.out.println(notices.get(i));
		}
		
		System.out.println("====== 정렬 후 ======");
		Collections.sort(notices, (o1, o2) -> -o1.getRegisterTime().compareTo(o2.getRegisterTime()));
		for(int i=0; i<notices.size(); i++) {
			System.out.println(notices.get(i));
		}
		
		request.setAttribute("notices", notices);
		request.getRequestDispatcher("/notice.jsp").forward(request, response);
	}
	
	private void sortingWithNoticeHits(HttpServletRequest request, HttpServletResponse response) throws ServletException, SQLException, IOException {
		List<Notice> notices = ns.selectAll();
		for(int i=0; i<notices.size(); i++) {
			System.out.println(notices.get(i));
		}
		
		System.out.println("====== 정렬 후 ======");
		Collections.sort(notices, (o1, o2) -> -Integer.compare(o1.getHit(), o2.getHit()));
		for(int i=0; i<notices.size(); i++) {
			System.out.println(notices.get(i));
		}
		
		request.setAttribute("notices", notices);
		request.getRequestDispatcher("/notice.jsp").forward(request, response);
	}
	
	private void sortingWithNoticeName(HttpServletRequest request, HttpServletResponse response) throws ServletException, SQLException, IOException {
		List<Notice> notices = ns.selectAll();
		for(int i=0; i<notices.size(); i++) {
			System.out.println(notices.get(i));
		}
		
		System.out.println("====== 정렬 후 ======");
		Collections.sort(notices, (o1, o2) -> o1.getId().compareTo(o2.getId()));
		for(int i=0; i<notices.size(); i++) {
			System.out.println(notices.get(i));
		}
		
		request.setAttribute("notices", notices);
		request.getRequestDispatcher("/notice.jsp").forward(request, response);
	}
	
	
	
	private void sortingWithLatestArticle(HttpServletRequest request, HttpServletResponse response) throws ServletException, SQLException, IOException {
		List<Review> reviews = rs.selectAll();
		for(int i=0; i<reviews.size(); i++) {
			System.out.println(reviews.get(i));
		}
		
		System.out.println("====== 정렬 후 ======");
		Collections.sort(reviews, (o1, o2) -> -o1.getRegisterTime().compareTo(o2.getRegisterTime()));
		for(int i=0; i<reviews.size(); i++) {
			System.out.println(reviews.get(i));
		}
		
		request.setAttribute("reviews", reviews);
		request.getRequestDispatcher("/board.jsp").forward(request, response);
	}
	
	private void sortingWithHits(HttpServletRequest request, HttpServletResponse response) throws ServletException, SQLException, IOException {
		List<Review> reviews = rs.selectAll();
		for(int i=0; i<reviews.size(); i++) {
			System.out.println(reviews.get(i));
		}
		
		System.out.println("====== 정렬 후 ======");
		Collections.sort(reviews, (o1, o2) -> -Integer.compare(o1.getLike(), o2.getLike()));
		for(int i=0; i<reviews.size(); i++) {
			System.out.println(reviews.get(i));
		}
		
		request.setAttribute("reviews", reviews);
		request.getRequestDispatcher("/board.jsp").forward(request, response);
	}

	private void sortingWithName(HttpServletRequest request, HttpServletResponse response) throws ServletException, SQLException, IOException {
		List<Review> reviews = rs.selectAll();
		for(int i=0; i<reviews.size(); i++) {
			System.out.println(reviews.get(i));
		}
		
		System.out.println("====== 정렬 후 ======");
		Collections.sort(reviews, (o1, o2) -> o1.getId().compareTo(o2.getId()));
		for(int i=0; i<reviews.size(); i++) {
			System.out.println(reviews.get(i));
		}
		
		request.setAttribute("reviews", reviews);
		request.getRequestDispatcher("/board.jsp").forward(request, response);
	}

}
