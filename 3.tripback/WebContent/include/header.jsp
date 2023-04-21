<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!-- ======= Header ======= -->
<header id="header" class="header d-flex align-items-center">
  <div class="container-fluid container-xl d-flex align-items-center justify-content-between">
    <a href="${root}/index.jsp" class="logo d-flex align-items-center">
      <!-- Uncomment the line below if you also wish to use an image logo -->
      <!-- <img src="assets/img/logo.png" alt=""> -->
      <h1 id="logo">Enjoy<span>Trip</span></h1>
    </a>
    <nav id="navbar" class="navbar">
      <ul>
        <li><a href="${root}/tripsearch.jsp">지역별여행지</a></li>
        <li><a href="${root}/my_trip.jsp">나의여행계획</a></li>
        <li><a href="${root}/sample-inner-page.jsp">핫플자랑하기</a></li>
        <li><a href="${root}/postWrite.jsp">여행정보공유</a></li>
       	
		<c:if test="${empty userinfo}">
		  <li class="dropdown" id="header_nav_confirm_on" style="display: block">
          <a href="#"><span>Log in</span>
            <i class="bi bi-chevron-down dropdown-indicator"></i
          ></a>
          
          <ul>
           	<li><a href="#" class="btn" data-bs-toggle="modal" data-bs-target="#loginModal">로그인 </a></li>
	        <li><a href="#" class="btn" data-bs-toggle="modal" data-bs-target="#JoinModal"> 회원가입</a></li>
          </ul>
        </li>
		</c:if>
		
		<c:if test="${not empty userinfo}">
			<li class="dropdown" id="header_nav_confirm_off" style="display: block">
	          <a href="#"><span><img src="./assets/img/icon/people-icon.png" alt="person_icon" /></span>
	            <i class="bi bi-chevron-down dropdown-indicator"></i
	          ></a>
	          
	          <ul>
		        <li><a>${userinfo.name} 님 반갑습니다.</a></li>
	            <li><a href="${root}/member_profile.jsp">회원정보</a></li>
	            <li><a href="${root}/main?action=logout" class="btn">로그아웃</a></li>
	          </ul>
	        </li>
		</c:if>
      </ul>
    </nav>
    <!-- .navbar -->

    <i class="mobile-nav-toggle mobile-nav-show bi bi-list"></i>
    <i class="mobile-nav-toggle mobile-nav-hide d-none bi bi-x"></i>
  </div>
</header>
<!-- End Header -->
	    
<script>
let msg="${msg}";
if(msg) alert(msg);
</script>