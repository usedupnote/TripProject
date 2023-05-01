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
      	<input type="hidden" name="name" value="${userinfo.name}">
      	<input type="hidden" name="id" value="${userinfo.id}">
      	<input type="hidden" name="email" value="${userinfo.email}">
      	<input type="hidden" name="age" value="${userinfo.age}">    
        <div class="mb-3">
          <p class="fs-3 fw-bold">아이디</p>
          <div id="myId" class="fs-5">${userinfo.id}</div>
        </div>
        <hr>
        <div class="mb-3">
          <p class="fs-3 fw-bold">비밀번호</p>
          <input type="password" class="form-control" name="password">
        </div>
        <hr>
        <div class="mb-3">
          <p class="fs-3 fw-bold">이메일</p>
          <div id="myEmail" class="fs-5">${userinfo.email}</div>
        </div>
        <hr>
        <input type="submit" class="btn btn-outline-primary w-20 float-end" value="수정 완료">
        </form>
      </div>
    </div>
    <%@ include file="/include/footer.jsp" %>
  </body>
</html>
