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
      <span class="text-center mt-5 h3" id="tripListTitle">우리 지역 여행지 검색</span>
      <!-- 관광지 검색 start -->
      <form class="my-5 row w-100 justify-content-center" role="search" action="${root}/main" method="get">
      	<input type="hidden" name="action" value="search" />
        <select id="search-area" class="form-select me-2 rounded-4 col-3" name="sidoCode">
          <option value="0" selected>검색 할 지역 선택</option>
          <option value="1">서울</option>
          <option value="2">인천</option>
          <option value="3">대전</option>
          <option value="4">대구</option>
          <option value="5">광주</option>
          <option value="6">부산</option>
          <option value="7">울산</option>
          <option value="8">세종특별자치시</option>
          <option value="31">경기도</option>
          <option value="32">강원도</option>
          <option value="33">충청북도</option>
          <option value="34">충청남도</option>
          <option value="35">경상북도</option>
          <option value="36">경상남도</option>
          <option value="37">음식점</option>
          <option value="38">음식점</option>
          <option value="39">음식점</option>
        </select>
        <select id="search-content-id" class="form-select me-2 rounded-4 col-3" name="cotentTypeId">
          <option value="0" selected>관광지 유형</option>
          <option value="12">관광지</option>
          <option value="14">문화시설</option>
          <option value="15">축제공연행사</option>
          <option value="25">여행코스</option>
          <option value="28">레포츠</option>
          <option value="32">숙박</option>
          <option value="38">쇼핑</option>
          <option value="39">음식점</option>
        </select>
        <input
          id="search-keyword"
          class="form-control me-2 rounded-4 col-4"
          type="search"
          name="keyword"
          placeholder="검색어"
          aria-label="검색어"
        />
        <button id="btn-search" class="btn btn-outline-warning col-1" type="submit">검색</button>
      </form>
      <!-- kakao map start -->
      <div id="map" class="mt-3" style="width: 100%; height: 400px"></div>
      <!-- kakao map end -->

      <!-- 관광지 검색 결과 창-->
      <div class="row mt-5">
        <div id="resultBox" class="row">
        	<c:if test="${not empty trips}">
        		<c:forEach items="${trips}" var="area">
			       	 <div class="card mb-3" onclick="moveCenter(${area.latitude}, ${area.longitude});">
			            <div class="row g-0">
			              <div class="col-md-4">
			                <img src="${area.firstImage}" class="img-fluid rounded-start" alt="${area.title}">
			              </div>
			              <div class="col-md-8">
			                <div class="card-body">
			                  <h5 class="card-title">${area.title}</h5>
			                  <p class="card-text">
			                  	<small class="text-muted">${area.addr1} ${area.addr2}</small>
			                  	<p>${area.overview}</p>
			                  </p>
			                </div>
			              </div>
			            </div>
			         </div>
        		</c:forEach>
        	</c:if>
        </div>
      </div>
    </section>
    <script
      type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=015c257de1297eba16854058edc4f4c6&libraries=services,clusterer,drawing"
    >
    </script>
    <script>
    	var positions=[]; // marker 배열
    </script>
   	<c:forEach items="${trips}" var="area">
		<script>
			  let markerInfo = {
	            title: "${area.title}",
	            latlng: new kakao.maps.LatLng("${area.latitude}", "${area.longitude}"),
	          };

			positions.push(markerInfo);
		</script>
    </c:forEach>
    <script>
    	
	 	// 카카오지도
	    var mapContainer = document.getElementById("map"), // 지도를 표시할 div
	      mapOption = {
	        center: new kakao.maps.LatLng(37.500613, 127.036431), // 지도의 중심좌표
	        level: 5, // 지도의 확대 레벨
	      };
	
	    // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	    var map = new kakao.maps.Map(mapContainer, mapOption);
	
	    function displayMarker() {
	      // 마커 이미지의 이미지 주소입니다
	      var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
	
	      // 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
	      var bounds = new kakao.maps.LatLngBounds();
	
	      for (var i = 0; i < positions.length; i++) {
	        // 마커 이미지의 이미지 크기 입니다
	        var imageSize = new kakao.maps.Size(24, 35);
	
	        // 마커 이미지를 생성합니다
	        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
	
	        // 마커를 생성합니다
	        var marker = new kakao.maps.Marker({
	          map: map, // 마커를 표시할 지도
	          position: positions[i].latlng, // 마커를 표시할 위치
	          title: positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
	          image: markerImage, // 마커 이미지
	        });
	
	        // LatLngBounds 객체에 좌표를 추가합니다
	        bounds.extend(positions[i].latlng);
	      }
	
	      // LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
	      // 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
	      map.setBounds(bounds);
	
	      // 첫번째 검색 정보를 이용하여 지도 중심을 이동 시킵니다
	      //map.setCenter(positions[0].latlng);
	    }
	
	    function moveCenter(lat, lng) {
	      map.setCenter(new kakao.maps.LatLng(lat, lng));
	    }
    </script>
    <c:if test="${not empty trips}">
    	<script>
    		displayMarker();
    	</script>
    </c:if>
    <%@ include file="/include/footer.jsp" %>
  </body>
</html>
