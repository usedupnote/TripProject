package com.tripback.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tripback.dto.User;
import com.tripback.service.UserService;
import com.tripback.service.UserServiceImpl;

@WebServlet("/main")
public class MainServlet extends HttpServlet {
	private UserService us = UserServiceImpl.getInstance();
	
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		process(request,response);
	}

	private void process(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String action=request.getParameter("action");
		
		System.out.println(action);
		
		try {
			switch (action) {
				case "login" 		: 	login(request,response); 		break;
				case "logout"		: 	logout(request,response); 		break;
				case "regist"		: 	regist(request,response); 		break;
				case "delete" 		: 	delete(request,response); 		break;
				case "modify" 		: 	modify(request,response); 		break;
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect(request.getContextPath()+"/error/500.jsp");
		}
	}

	private void modify(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String name		= request.getParameter("name");
			String email	= request.getParameter("email");
			
			System.out.println("name:" + name + " email:" + email);
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("userinfo");
			
			System.out.println("user:" + user);
			if(user != null) {
				System.out.println("user:수정되었습니다");
				user.setName(name);
				user.setEmail(email);
				us.update(user);
				request.setAttribute("msg", "수정되었습니다.");
				request.getRequestDispatcher("/index.jsp").forward(request, response);
			} else {
				System.out.println("user:수정할 아이디가 존재하지 않습니다.");
				request.setAttribute("msg", "수정할 아이디가 존재하지 않습니다.");
				request.getRequestDispatcher("/index.jsp").forward(request, response);
			}
		}catch (Exception e) {
			System.out.println("user:문제가 발생했습니다.");
			request.setAttribute("msg", "수정 중 문제가 발생했습니다.");
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		}
	}

	private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("userinfo");
			System.out.println("user : " + user);
			if(user != null) {
				us.delete(user.getId());
				session.invalidate();
				request.setAttribute("msg", "아이디가 삭제되었습니다.");
				request.getRequestDispatcher("/index.jsp").forward(request, response);
			} else {
				request.setAttribute("msg", "삭제할 아이디가 존재하지 않습니다.");
				request.getRequestDispatcher("/index.jsp").forward(request, response);
			}
		}catch (Exception e) {
			request.setAttribute("msg", "아이디 삭제 중 문제가 발생했습니다.");
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		}
	}

	private void regist(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
		String name			= request.getParameter("joinMemberName");
		String id			= request.getParameter("joinid");
		String passWord		= request.getParameter("joinPassWord");
		String checkpassWord= request.getParameter("joinCheckPassWord");
		String email		= request.getParameter("joinEmail");
		int age				= Integer.parseInt(request.getParameter("joinage"));
		
		User user = new User(name, id, passWord, email, age, "");
		if(passWord.equals(checkpassWord)) {
			try {
				us.insert(user);
				Cookie c = new Cookie("currentUser", id);
				c.setMaxAge(60*60*30*12);
				response.addCookie(c);
				
				System.out.println(c);
				request.setAttribute("user", user);
				request.getRequestDispatcher("/index.jsp").forward(request, response);
			} catch (SQLIntegrityConstraintViolationException e) {
				request.setAttribute("msg", "회원가입 실패 " + id + "이(가) 이미 사용중입니다.");
				request.getRequestDispatcher("/index.jsp").forward(request, response);
			}
		} else {
			request.setAttribute("msg", "회원가입 실패 비밀번호가 일치하지 않습니다.");
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		}
	}

	private void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		session.invalidate();
		response.sendRedirect(request.getContextPath()+"/index.jsp");
	}

	private void login(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
		String id 		= request.getParameter("id");
		String password	= request.getParameter("password");
		System.out.println("id:" + id + ", pass:" + password);
		User user = us.select(id);
		System.out.println("user: " + user);
		
		System.out.println(user.getPass());
		
		if(user!=null && user.getPass().equals(password)) {
			HttpSession session=request.getSession();
			session.setAttribute("userinfo", user);
			response.sendRedirect(request.getContextPath()+"/index.jsp");
		}else{
			request.setAttribute("msg", "아이디 또는 비밀번호 확인해주세요");
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		}
	}

}
