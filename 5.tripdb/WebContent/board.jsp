<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <%@ include file="/include/header.jsp" %>
  </head>
  <body>
    <%@ include file="/include/nav.jsp" %> 
     <!--main-->
     <!--main-->
    <section class="page-section container text-center">
      <h2 class="section-heading text-uppercase my-5">나에게 딱 맞는 여행! 여기서 찾아보세요!</h2>
      <a class="btn btn-outline-warning float-end d-inline mb-3" href="write.jsp">글쓰기</a>
      <div id="postListBox" style="clear: both">
      	<c:if test="${not empty reviews}">
      		<c:forEach items="${reviews}" var="review">
      			<div class="card mb-3 text-start">
		          <div class="row g-0">
		            <div class="col-md-4">
		              <img src="./assets/img/reveiw1.jpg" class="img-fluid rounded-start" alt="..." />
		            </div>
		            <div class="col-md-8">
		              <div class="card-body">
		                <div class="d-flex justify-content-between align-items-center">
		                  <a class="card-title m-0 h5" href="${root}/main?action=reviewView&articleNo=${review.articleNo}">${review.title}</a>
		                   <div><i id="like" class="bi bi-heart fs-4"></i> <span>${review.like}</span></div>
		                </div>
		                <p class="card-text">
		                  ${review.desc}
		                </p>
		                <p class="card-text"><small class="text-muted">${review.registerTime}</small></p>
		              </div>
		            </div>
		          </div>
		        </div>
      		</c:forEach>
      	</c:if>
      	<c:if test="${empty reviews}">
      		<p>등록된 게시물이 없습니다</p>
      	</c:if>
      </div>
    </section>
    <%@ include file="/include/footer.jsp" %>
  </body>
</html>
