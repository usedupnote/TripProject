package servlet;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthSpinnerUI;

import com.mysql.cj.Session;

import hashing.hashImpl;
import model.dto.Notice;
import model.dto.Review;
import model.dto.Trip;
import model.dto.User;
import service.NoticeService;
import service.NoticeServiceImpl;
import service.ReviewService;
import service.ReviewServiceImpl;
import service.TripService;
import service.TripServiceImpl;
import service.UserService;
import service.UserServiceImpl;


@WebServlet("/main")
public class MainServlet extends HttpServlet {
	
	hashImpl sha256 = new hashImpl();

	private UserService us = UserServiceImpl.getInstance();
	private TripService ts = TripServiceImpl.getInstance();
	private NoticeService ns = NoticeServiceImpl.getInstance();
	private ReviewService rs = ReviewServiceImpl.getInstance();
	
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}
	
	protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		System.out.println("action=["+action+"]");
		try {
			switch(action) {
				case "loginfm"			:	response.sendRedirect(request.getContextPath()+"/login.jsp");	break;
				case "login"			:	login(request, response);										break;
				case "logout"			:	logout(request, response);										break;
				case "regist" 			:	regist(request, response);										break;
				case "update" 			:	update(request, response);										break;
				case "delete" 			:	delete(request, response);										break;
				case "search" 			:	search(request, response);										break;
				case "noticeRegist" 	:	noticeRegist(request, response);								break;
				case "noticeList" 		:	noticeList(request, response);									break;
				case "noticeView"		:	noticeView(request, response);									break;
				case "noticeDelete"		:	noticeDelete(request, response);								break;
				case "reviewRegist"		:	reviewRegist(request, response);								break;
				case "reviewList" 		:	reviewList(request, response);									break;
				case "reviewView" 		:	reviewView(request, response);									break;
				case "reviewDelete" 	:	reviewDelete(request, response);								break;
				case "reviewAddLike" 	:	reviewAddLike(request, response);								break;
				case "reviewRemoveLike" :	reviewRemoveLike(request, response);							break;
				case "find"				:	find(request, response);										break;
				case "noticeUpdate" 	:	noticeUpdate(request, response);								break;
				case "reviewUpdate" 	:	reviewUpdate(request, response);								break;
				case "executeNotice" 	:	executeNoticeUpdate(request, response);							break;
				case "executeReview" 	:	executeReviewUpdate(request, response);							break;
 			}
		} catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect(request.getContextPath()+"/error/error.jsp");
		}
	}
	
	private void reviewRemoveLike(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
		int articleNo = Integer.parseInt(request.getParameter("articleNo"));
		Review review = rs.selectArticle(articleNo);
		rs.removeLike(articleNo);
		request.setAttribute("review", review);
		Cookie likeClass = new Cookie("setLikeClass", "bi-heart");
		likeClass.setMaxAge(60*60*24);
		response.addCookie(likeClass);
		
		Cookie likeColor = new Cookie("setLikeColor", "black");
		likeColor.setMaxAge(60*60*24);
		response.addCookie(likeColor);
		request.getRequestDispatcher("/view.jsp").forward(request, response);
		
	}

	private void reviewAddLike(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
		int articleNo = Integer.parseInt(request.getParameter("articleNo"));
		Review review = rs.selectArticle(articleNo);
		rs.updateLike(articleNo);
		request.setAttribute("review", review);
		
		Cookie likeClass = new Cookie("setLikeClass", "bi-heart-fill");
		likeClass.setMaxAge(60*60*24);
		response.addCookie(likeClass);
		
		Cookie likeColor = new Cookie("setLikeColor", "eb2a2a");
		likeColor.setMaxAge(60*60*24);
		response.addCookie(likeColor);
		request.getRequestDispatcher("/view.jsp").forward(request, response);
	}

	private void reviewDelete(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		int articleNo = Integer.parseInt(request.getParameter("articleNo"));
		rs.deleteArticle(articleNo);
		response.sendRedirect(request.getContextPath()+"/main?action=reviewList");
	}
	
	private void reviewView(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
		int articleNo = Integer.parseInt(request.getParameter("articleNo"));
		Review review = rs.selectArticle(articleNo);
		request.setAttribute("review", review);
		
		Cookie likeClass = new Cookie("setLikeClass", "bi-heart");
		likeClass.setMaxAge(60*60*24);
		response.addCookie(likeClass);
		
		Cookie likeColor = new Cookie("setLikeColor", "black");
		likeColor.setMaxAge(60*60*24);
		response.addCookie(likeColor);
		request.getRequestDispatcher("/view.jsp").forward(request, response);
	}
	
	private void reviewRegist(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("userinfo");
		if(user != null) {
			String id = user.getId();
			String title = request.getParameter("title");
			String desc = request.getParameter("desc");
			
			Review review = new Review();
			review.setId(id);
			review.setTitle(title);
			review.setDesc(desc);
			
			System.out.println(review);
			
			rs.writeArticle(review);
			response.sendRedirect(request.getContextPath()+"/main?action=reviewList");
		}
		else {
			request.setAttribute("msg", "로그인 후 사용해 주세요");
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		}
	}
	
	private void reviewList(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
		List<Review> reviews = rs.selectAll();
		request.setAttribute("reviews", reviews);
		request.getRequestDispatcher("/board.jsp").forward(request, response);
	}
	
	private void noticeDelete(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		int articleNo = Integer.parseInt(request.getParameter("articleNo"));
		ns.deleteArticle(articleNo);
		response.sendRedirect(request.getContextPath()+"/main?action=noticeList");
	}

	private void noticeView(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
		int articleNo = Integer.parseInt(request.getParameter("articleNo"));
		Notice notice = ns.selectArticle(articleNo);
		ns.updateHit(articleNo);
		request.setAttribute("notice", notice);
		request.getRequestDispatcher("/viewNotice.jsp").forward(request, response);
	}

	private void noticeRegist(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("userinfo");
		if(user != null) {
			String id = user.getId();
			String title = request.getParameter("title");
			String desc = request.getParameter("desc");
			
			Notice notice = new Notice();
			notice.setId(id);
			notice.setTitle(title);
			notice.setDesc(desc);
			
			System.out.println(notice);
			
			ns.writeArticle(notice);
			response.sendRedirect(request.getContextPath()+"/main?action=noticeList");
		}
	}
	
	private void noticeList(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
		List<Notice> notices = ns.selectAll();
		request.setAttribute("notices", notices);
		request.getRequestDispatcher("/notice.jsp").forward(request, response);
	}
	
	protected void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException, NoSuchAlgorithmException {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		String hashPassword = sha256.encrypt(id+password);
		
		
		User user = us.select(id);
		
		System.out.println(hashPassword);
		
		if(user!=null && user.getPassword().equals(hashPassword) && user.getId().equals(id)) {
			HttpSession session = request.getSession();
			session.setAttribute("userinfo", user);
			response.sendRedirect(request.getContextPath()+"/index.jsp");
		}
		else {
			request.setAttribute("msg", "로그인 실패");
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		}
	}

	protected void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.invalidate();
		request.getRequestDispatcher("/index.jsp").forward(request, response);
	}

	protected void regist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException, NoSuchAlgorithmException {
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		int age = Integer.parseInt(request.getParameter("age"));

		String hashPassword = sha256.encrypt(id+password);

		
		System.out.println(hashPassword);
		User user = new User(name, id, hashPassword, email, age);
		
		try {
			us.insert(user);
			request.setAttribute("msg", "회원가입 성공!");
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		} catch(SQLIntegrityConstraintViolationException e) {
			request.setAttribute("msg", "회원가입 실패 : "+ id +"이 이미 사용 중입니다.");			
			e.printStackTrace();
		}
	}
	
	protected void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, NoSuchAlgorithmException {
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		int age = Integer.parseInt(request.getParameter("age"));

		String hashPassword = sha256.encrypt(id+password);
		
		User user = new User(name, id, hashPassword, email, age);

		try {
			us.update(user);
			request.setAttribute("msg", "회원 정보 수정 성공!");
			HttpSession session = request.getSession();
			session.setAttribute("userinfo", user);
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		} catch(SQLException e) {
			request.setAttribute("msg", "수정 실패");	
			e.printStackTrace();
		}
		
	}
	
	protected void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		try {
			us.delete(id);
			request.setAttribute("msg", "회원 탈퇴 성공!");
			logout(request, response);
		} catch(SQLException e) {
			request.setAttribute("msg", "탈퇴 실패");		
			e.printStackTrace();
		}
	}

	protected void search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		int sidoCode = Integer.parseInt(request.getParameter("sidoCode"));
		int cotentTypeId = Integer.parseInt(request.getParameter("cotentTypeId"));
		String keyword = request.getParameter("keyword");
		
		List<Trip> trips = ts.selectAll(sidoCode, cotentTypeId, keyword);
		request.setAttribute("trips", trips);
		request.getRequestDispatcher("/tripList.jsp").forward(request, response);
		
	}

	
	protected void find(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		User user = null;
		try {
			user = us.select(id);
			if(user != null && user.getEmail().equals(email) && user.getId().equals(id)) {
				HttpSession session = request.getSession();
				session.setAttribute("userinfo", user);
				response.sendRedirect(request.getContextPath()+"/findPass.jsp");
			} else {
				request.setAttribute("msg", "아이디나 이메일이 틀렸습니다!");
				request.getRequestDispatcher("/index.jsp").forward(request, response);
			}
		} catch(SQLException e) {
			request.setAttribute("msg", "아이디나 이메일이 틀렸습니다!");	
			e.printStackTrace();
		}
	}
	
	protected void noticeUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		HttpSession session = request.getSession();
		int articleNo = Integer.parseInt(request.getParameter("articleNo"));
		Notice notice = ns.selectArticle(articleNo);
		session.setAttribute("updatenotice", notice);	
		response.sendRedirect(request.getContextPath()+"/updateNotice.jsp");
	}
	
	protected void executeNoticeUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int articleNo = Integer.parseInt(request.getParameter("articleNo"));
		String id = request.getParameter("id");
		String title = request.getParameter("title");
		String desc = request.getParameter("desc");
		int hit = Integer.parseInt(request.getParameter("hit"));
		String registerTime = request.getParameter("registerTime");
		Notice notice = new Notice(articleNo, id, title, desc, hit, registerTime);
		System.out.println(notice);
		try {
			ns.modifyArticle(notice);
			HttpSession session = request.getSession();
			session.removeAttribute("updatenotice");
			response.sendRedirect(request.getContextPath()+"/main?action=noticeList");
		} catch(SQLException e) {
			request.setAttribute("msg", "수정 실패");	
			e.printStackTrace();
		}
	}
	
	protected void reviewUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		HttpSession session = request.getSession();
		int articleNo = Integer.parseInt(request.getParameter("articleNo"));
		Review review = rs.selectArticle(articleNo);
		session.setAttribute("updatereview", review);	
		response.sendRedirect(request.getContextPath()+"/updateReview.jsp");
	}
	
	protected void executeReviewUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int articleNo = Integer.parseInt(request.getParameter("articleNo"));
		String id = request.getParameter("id");
		String title = request.getParameter("title");
		String desc = request.getParameter("desc");
		String img = "";
		int like = Integer.parseInt(request.getParameter("like"));
		String registerTime = request.getParameter("registerTime");
		Review review = new Review(articleNo, id, title, desc, img, like, registerTime);
		try {
			rs.modifyArticle(review);
			request.setAttribute("msg", "리뷰 수정 성공!");
			HttpSession session = request.getSession();
			session.removeAttribute("updatereview");
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		} catch(SQLException e) {
			request.setAttribute("msg", "수정 실패");	
			e.printStackTrace();
		}
	}
}
