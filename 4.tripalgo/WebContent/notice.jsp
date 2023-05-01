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
    <section class="page-section container text-center">
      <h2 class="section-heading text-uppercase my-5">ENJOY TRIP</h2>
      <a class="btn btn-outline-warning float-end d-inline mb-3" href="noticeWrite.jsp">글쓰기</a>
      <!-- 정렬 dropdown ui start -->
	  <div class="dropdown float-end d-inline mb-3 me-3">
		<button class="btn btn-outline-warning dropdown-toggle" type="button"
			data-bs-toggle="dropdown" aria-expanded="false">정렬</button>
		<ul class="dropdown-menu">
			<li><a class="dropdown-item" href="${root}/sort?sort=noticeName">작성자</a></li>
			<li><a class="dropdown-item" href="${root}/sort?sort=noticeHits">조회수</a></li>
			<li><a class="dropdown-item" href="${root}/sort?sort=noticeLatestArticle">최신 작성글</a></li>
		</ul>
	 </div>
	 <!-- 정렬 dropdown ui end -->
      	  <div id="noticeListBox" style="clear: both">
	        <table class="table">
	          <thead>
	            <tr>
	              <th scope="col">번호</th>
	              <th scope="col">제목</th>
	              <th scope="col">작성자</th>
	              <th scope="col">조회수</th>
	              <th scope="col">작성일</th>
	            </tr>
	          </thead>
	          <tbody>
	           <c:if test="${not empty notices}">
		          	<c:forEach items="${notices}" var="notice" varStatus="vs">
		            <tr>
		              <th scope="row">${vs.count}</th>
		              <td><a href="${root}/main?action=noticeView&articleNo=${notice.articleNo}">${notice.title}</a></td>
		              <td>${notice.id}</td>
		              <td>${notice.hit}</td>
		              <td>${notice.registerTime}</td>
		            </tr>
		          	</c:forEach>
	           </c:if>
	          <c:if test="${empty notices}">
		      	<tr>
		          <td colspan="5">등록된 게시물이 없습니다</td>
		        </tr>
		      </c:if>
	          </tbody>
	        </table>
	      </div>
    </section>
    <%@ include file="/include/footer.jsp" %>
  </body>
</html>