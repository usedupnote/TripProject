<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${pageContext.request.requestURL == 'http://localhost:8080/tripback/index.jsp'}">
		<c:set var="subHeaderClass" value=""></c:set>
</c:if>
<c:if test="${pageContext.request.requestURL != 'http://localhost:8080/tripback/index.jsp'}">
		<c:set var="subHeaderClass" value="sub-header"></c:set>
</c:if>
<nav class="navbar navbar-expand-lg navbar-dark fixed-top ${subHeaderClass}" id="mainNav">
	<div class="container">
		<a class="navbar-brand" href="${root}/index.jsp">Enjoy Trip</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarResponsive" aria-controls="navbarResponsive"
			aria-expanded="false" aria-label="Toggle navigation">
			Menu <i class="fas fa-bars ms-1"></i>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
		<c:if test="${empty userinfo}">
			<ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0">
				<li class="nav-item"><a class="nav-link" href="${root}/main?action=noticeList">공지사항</a></li>
				<li class="nav-item"><a class="nav-link" href="${root}/main?action=reviewList">여행
						후기</a></li>
				<li class="nav-item"><a class="nav-link" href="#"
					data-bs-toggle="modal" data-bs-target="#registerModal">회원가입</a></li>
				<li class="nav-item"><a class="nav-link" href="#"
					data-bs-toggle="modal" data-bs-target="#loginModal">로그인</a></li>
			</ul>
		</c:if>
		<c:if test="${not empty userinfo}">
			<ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0">
				<li class="nav-item"><a class="nav-link" href="${root}/main?action=noticeList">공지사항</a></li>
				<li class="nav-item"><a class="nav-link" href="${root}/main?action=reviewList">여행
						후기</a></li>
				<li class="nav-item"><a class="nav-link" aria-current="page"
					href="${root}/main?action=logout">로그아웃</a></li>
				<li class="nav-item"><a class="nav-link" aria-current="page"
					href="mypage.jsp">마이페이지</a></li>
			</ul>
		</c:if>
		</div>
	</div>
</nav>
<div class="modal fade" id="loginModal" data-bs-backdrop="static"
	data-bs-keyboard="false" tabindex="-1"
	aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">
					<i class="bi bi-door-open text-info"> 로그인</i>
				</h4>
				<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			</div>
			<!-- Modal body -->
			<form action="${root}/main" method="post">
			<div class="modal-body">
					<input type="hidden" name="action" value="login">
					<div class="form-floating mb-3">
						<input type="id" class="form-control" id="loginId" name="id"
							placeholder="Id" /> <label for="loginId">ID</label>
					</div>
					<div class="form-floating mb-3">
						<input type="password" class="form-control" id="loginPassword" name="password"
							placeholder="Password" /> <label for="loginPassword">Password</label>
					</div>
					<div class="p-1 mt-3"></div>				
			</div>
			<!-- Modal footer -->
			<div class="modal-footer">
				<a href="#" data-bs-toggle="modal" data-bs-target="#findModal" class="btn btn-outline-danger">비밀번호 찾기</a>
				<button type="submit" class="btn btn-outline-primary" data-bs-dismiss="modal" aria-label="Close">로그인</button>
			</div>
			</form>
		</div>
	</div>
</div>
<!-- 로그인 modal end -->

<!-- 비밀번호찾기 modal start -->
<div class="modal fade" id="findModal" data-bs-backdrop="static"
	data-bs-keyboard="false" tabindex="-1"
	aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">
					<i class="bi bi-door-open text-info"> 비밀번호 찾기</i>
				</h4>
				<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			</div>
			<!-- Modal body -->
			<form action="${root}/main" class="was-validated" method="post">
			<input type="hidden" name="action" value="find">	
			<div class="modal-body">				
				<div class="form-floating mb-3">
					<input type="text" class="form-control" id="floatingInput" placeholder="Id" name="id" required /> <label for="floatingInput">아이디</label>
						<div class="invalid-feedback">아이디를 입력하세요</div>
					</div>
					<div class="form-floating mb-3">
						<input type="email" class="form-control" id="floatingPassword" placeholder="Email" name="email"required /> <label for="floatingPassword">이메일</label>
						<div class="invalid-feedback">이메일을 입력하세요</div>
					</div>
					<div class="p-1 mt-3"></div>				
			</div>
			<!-- Modal footer -->
			<div class="modal-footer">
				<div id="findAlert" class="w-100"></div>
				<input type="submit" class="btn btn-outline-primary" value="비밀번호 복구">
			</div>
			</form>
		</div>
	</div>
</div>
<!-- 비밀번호찾기 modal end -->

<!-- 회원가입 modal start -->
<div class="modal fade" id="registerModal" data-bs-backdrop="static"
	data-bs-keyboard="false" tabindex="-1"
	aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">
					<i class="bi bi-door-open text-info"> 회원가입</i>
				</h4>
				<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			</div>
			<!-- Modal body -->
			<form name="register-form" class="was-validated" action="${root}/main" method="post">
			<div class="modal-body">
				<div class="form-signin">
					<div>						
							<input type="hidden" name="action" value="regist"/>
							<div class="form-floating mb-3">
								<input type="text" class="form-control" id="registerName"
									placeholder="이름" name="name" required /> <label for="registerName">이름</label>
								<div class="invalid-feedback">이름을 입력하세요</div>
							</div>
							<div class="form-floating mb-3">
								<input type="text" class="form-control" id="registerId"
									placeholder="아이디" name="id" required /> <label for="registerId">아이디</label>
								<div class="invalid-feedback">아이디를 입력하세요</div>
							</div>
							<div class="form-floating mb-3">
								<input type="password" class="form-control"
									id="registerPassword" name="password" placeholder="비밀번호" required /> <label
									for="registerPassword">비밀번호</label>
								<div class="invalid-feedback">비밀번호를 입력하세요</div>
							</div>
							<div class="form-floating mb-3">
								<input type="password" class="form-control"
									id="registerCheckPassword" name="checkPassword" placeholder="비밀번호" required />
								<label for="registerCheckPassword">비밀번호 확인</label>
								<div class="invalid-feedback">비밀번호를 입력하세요</div>
							</div>
							<div class="form-floating mb-3">
								<input type="email" class="form-control" id="registerEmail"
									placeholder="이메일" name="email" required /> <label for="registerEmail">이메일</label>
								<div class="invalid-feedback">이메일을 입력하세요</div>
							</div>
							<div class="form-floating mb-3">
								<input type="age" class="form-control" id="registerAge"
									placeholder="나이" name="age" required /> <label for="registerAge">나이</label>
								<div class="invalid-feedback">나이를 입력하세요</div>
							</div>
						
					</div>
				</div>
			</div>
			<!-- Modal footer -->
			<div class="modal-footer float-end">
				<input type="submit"
					class="btn btn-outline-primary w-20" value="회원가입">
			</div>
			</form>
		</div>
	</div>
</div>
<!-- 회원가입 modal end -->
