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
      <div id="titleBox">
        <span class="text-center mt-5 h3 d-inline-block">${review.title}</span>
        <div class="dropdown">
             <i id="threeDot" class="bi bi-three-dots fs-3" data-bs-toggle="dropdown" aria-expanded="false"></i>
             <ul class="dropdown-menu">
                 <li><a class="dropdown-item" href="${root}/main?action=reviewUpdate&articleNo=${review.articleNo}">수정</a></li>
                 <li><a class="dropdown-item" href="${root}/main?action=reviewDelete&articleNo=${review.articleNo}">삭제</a></li>
             </ul>
        </div>
        <i id="like" class="bi fs-4 ${cookie.setLikeClass.value}" style="color:#${cookie.setLikeColor.value};"></i>
      </div>
      <h3 class="section-subheading text-muted">${review.registerTime} ${review.id}</h3>
      <img class="w-100" src="./assets/img/reveiw3.jpg" alt="" />
      <div id="view" class="textBox text-start mt-3">
        <p>
         ${review.desc}
        </p>
      </div>
      <div class="text-end">
      	<a class="btn" href="${root}/main?action=reviewList">목록 보기</a>
      </div>
    </section> 
    <script>
	    const likeBtn = document.getElementById("like");
	    let isLike = ("${cookie.setLikeColor.value}"=="black")? false : true;
	    likeBtn.addEventListener("click", () => {
	      if(!isLike){
	    	  location.href="${root}/main?action=reviewAddLike&articleNo=${review.articleNo}";
	      }
	      else {
	    	  location.href="${root}/main?action=reviewRemoveLike&articleNo=${review.articleNo}";
	      }
	    });
    </script>
    <%@ include file="/include/footer.jsp" %>
  </body>
</html>
