<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <%@ include file="/include/header.jsp" %>
  </head>
  <body>
    <%@ include file="/include/nav.jsp" %> 
    <section class="page-section container">
      <div class="text-center">
        <span class="mt-3 h3 d-inline-block" id="tripListTitle">게시글 작성</span>
      </div>
      <form class="was-validated" method="post" action="${root}/main">
      	<input type="hidden" name="action" value="executeReview"/>
      	<input type="hidden" name="articleNo" value="${updatereview.articleNo}" />
      	<input type="hidden" name="id" value="${updatereview.id}" />
      	<input type="hidden" name="like" value="${updatereview.like}" />
      	<input type="hidden" name="registerTime" value="${updatereview.registerTime}" />
        <div class="mb-4" id="write-title-div">
          <label for="title" class="h5">제목</label>
          <input type="text" class="form-control" id="writeTitle" name="title" placeholder="${updatereview.title}" required />
          <div class="invalid-feedback">제목을 입력하세요</div>
        </div>
        <div class="mb-4" id="write-content-div">
          <label for="content" class="h5">내용</label>
          <textarea
            class="form-control"
            id="writeContent"
            placeholder="${updatereview.desc}"
            rows="10"
            name="desc" 
            required
          ></textarea>
          <div class="invalid-feedback">내용을 입력하세요</div>
        </div>
        <div class="mb-4">
          <label for="file" class="h5">사진 첨부</label>
          <input type="file" class="form-control" id="file" required/>
          <div class="invalid-feedback">사진을 첨부하세요</div>
        </div>
        <div class="mt-5 text-center">
          <button id="writeDone" type="submit" class="btn btn-outline-warning">수정 완료</button>
        </div>
      </form>
    </section>
    <%@ include file="/include/footer.jsp" %>
  </body>
</html>
