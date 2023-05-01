<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <%@ include file="/include/header.jsp" %>
  </head>
  <body>
    <%@ include file="/include/nav.jsp" %> 
    <div class="container mt-5 justify-content-center">
      <div style="height: 70px"></div>
      <div class="row">
      <form action="${root}/main" method="post">
      	<input type="hidden" name="action" value="update">
        <div class="mb-3">
          <p class="fs-3 fw-bold">이름</p>
          <input type="text" class="form-control" name="name" value="${userinfo.name}">
        </div>
        <hr>
        <div class="mb-3">
          <p class="fs-3 fw-bold">아이디</p>
          <div id="myId" class="fs-5">${userinfo.id}</div>
          <input type="hidden" name="id" value="${userinfo.id}">
        </div>
        <hr>
        <div class="mb-3">
          <p class="fs-3 fw-bold">비밀번호</p>
          <input type="password" class="form-control" name="password" value="${userinfo.password}">
        </div>
        <hr>
        <div class="mb-3">
          <p class="fs-3 fw-bold">이메일</p>
          <input type="text" class="form-control" name="email" value="${userinfo.email}">
        </div>
        <hr>
        <div class="mb-3">
          <p class="fs-3 fw-bold">나이</p>
          <input type="text" class="form-control" name="age" value="${userinfo.age}">
        </div>
        <hr>
        <input type="submit" class="btn btn-outline-primary w-20 float-end" value="수정 완료">
        </form>
        <form action="${root}/main" method="post" class="mt-3">
        	<input type="hidden" name="action" value="delete">
        	<input type="hidden" name="id" value="${userinfo.id}">
        	<input type="submit" class="btn btn-outline-danger w-20 float-end" value="탈퇴">
        </form>
      </div>
    </div>
    <%@ include file="/include/footer.jsp" %>
  </body>
</html>
