<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Trip Searcher</title>
<link rel="shortcut icon" href="./assets/img/favicon.ico" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css" />
<script src="./assets/js/key.js"></script>
<!-- Favicons -->
<link href="assets/img/favicon.png" rel="icon" />
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon" />

<!-- Google Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,600;1,700&family=Montserrat:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&family=Raleway:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
	rel="stylesheet" />

<!-- Vendor CSS Files -->
<link href="assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" />
<link href="assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet" />
<link href="assets/vendor/aos/aos.css" rel="stylesheet" />
<link href="assets/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet" />
<link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet" />

<!-- Template Main CSS File -->
<link href="assets/css/main.css" rel="stylesheet" />
</head>

<body>

	<!-- ======= Header ======= -->
	<%@ include file="/include/header.jsp"%>
	<!-- End Header -->

	<!-- 중앙 content start -->
	<div class="container">
		<div style="height: 70px"></div>
		<!-- 중앙 left content end -->
		<!-- 중앙 center content end -->
		<div class="col-md-12" style="margin-bottom: 200px;">
			<div class="alert alert-success mt-3 text-center fw-bold"
				role="alert">전국 관광지 정보</div>
			<!-- 관광지 검색 start -->
			<form action="${root}/att" method="get" class="d-flex my-3"
				role="search">
				<input type="hidden" name="action" value="search"> <select
					id="search-area" class="form-select me-2" name="sido">
					<option value="0" selected>검색 할 지역 선택</option>
				</select> <select id="search-content-id" class="form-select me-2" name="type">
					<option value="0" selected>관광지 유형</option>
					<option value="12">관광지</option>
					<option value="14">문화시설</option>
					<option value="15">축제공연행사</option>
					<option value="25">여행코스</option>
					<option value="28">레포츠</option>
					<option value="32">숙박</option>
					<option value="38">쇼핑</option>
					<option value="39">음식점</option>
				</select> <input name="word" id="search-keyword" class="form-control me-2"
					type="search" placeholder="검색어" aria-label="검색어" /> <input
					type="submit" value="검색">
				<!--           <button id="btn-search" class="btn btn-outline-success" type="button">검색</button> -->
			</form>
			<!-- kakao map start -->
			<!-- <div id="map" class="mt-3" style="width: 100%; height: 400px"></div> -->
			<!-- kakao map end -->
			<div class="row">
				<table class="table table-striped">
					<thead>
						<tr>
							<th>번호</th>
							<th>대표이미지</th>
							<th>관광지명</th>
							<th>주소</th>
						</tr>
					</thead>
					<tbody id="trip-list">
						<c:forEach var="att" items="${atts}" varStatus="vs">
							<tr>
								<td>${vs.count}</td>
								<td><img src="${att.firstImage}" width="200px"/></td>
								<td><a href="${root}/att?action=view&contentId=${att.contentId}">${att.title}</a></td>
								<td>${att.addr1}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<!-- 관광지 검색 end -->
		</div>
	</div>
	<!-- 중앙 content end -->

	<!-- ======= Footer ======= -->
	<%@ include file="/include/footer.jsp"%>
	<!-- End Footer -->

	<!-- ======= Start modal ======= -->
	<%@ include file="/include/modal.jsp"%>
	<!-- End modal -->

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
	<script src="./assets/js/main.js"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1b265ad9d10de3cf07a51f8729b68f95&libraries=services,clusterer,drawing"></script>
	<script>
      // index page 로딩 후 전국의 시도 설정.
      let areaUrl =
        "https://apis.data.go.kr/B551011/KorService1/areaCode1?serviceKey=" +
        serviceKey +
        "&numOfRows=20&pageNo=1&MobileOS=ETC&MobileApp=AppTest&_type=json";

      // fetch(areaUrl, { method: "GET" }).then(function (response) { return response.json() }).then(function (data) { makeOption(data); });
      fetch(areaUrl, { method: "GET" })
        .then((response) => response.json())
        .then((data) => makeOption(data));

      function makeOption(data) {
        let areas = data.response.body.items.item;
        // console.log(areas);
        let sel = document.getElementById("search-area");
        areas.forEach((area) => {
          let opt = document.createElement("option");
          opt.setAttribute("value", area.code);
          opt.appendChild(document.createTextNode(area.name));

          sel.appendChild(opt);
        });
      }

      // 검색 버튼을 누르면..
      // 지역, 유형, 검색어 얻기.
      // 위 데이터를 가지고 공공데이터에 요청.
      // 받은 데이터를 이용하여 화면 구성.
      /* document.getElementById("btn-search").addEventListener("click", () => {
        let searchUrl = `https://apis.data.go.kr/B551011/KorService1/searchKeyword1?serviceKey=${serviceKey}&numOfRows=10&pageNo=1&MobileOS=ETC&MobileApp=AppTest&_type=json&listYN=Y&arrange=A`;

        let areaCode = document.getElementById("search-area").value;
        let contentTypeId = document.getElementById("search-content-id").value;
        let keyword = document.getElementById("search-keyword").value;

        if (parseInt(areaCode)) searchUrl += `&areaCode=${areaCode}`;
        if (parseInt(contentTypeId)) searchUrl += `&contentTypeId=${contentTypeId}`;
        if (!keyword) {
          alert("검색어 입력 필수!!!");
          return;
        } else searchUrl += `&keyword=${keyword}`;

        fetch(searchUrl)
          .then((response) => response.json())
          .then((data) => makeList(data));
      }); */

      /* var positions; // marker 배열.
      function makeList(data) {
        document.querySelector("table").setAttribute("style", "display: ;");
        let trips = data.response.body.items.item;
        let tripList = ``;
        positions = [];
        trips.forEach((area) => {
          tripList += `
            <tr onclick="moveCenter(${area.mapy}, ${area.mapx});">
              <td><img src="${area.firstimage}" width="100px"></td>
              <td>${area.title}</td>
              <td>${area.addr1} ${area.addr2}</td>
              <td>${area.mapy}</td>
              <td>${area.mapx}</td>
            </tr>
          `;

          let markerInfo = {
            title: area.title,
            latlng: new kakao.maps.LatLng(area.mapy, area.mapx),
          };
          positions.push(markerInfo);
        });
        document.getElementById("trip-list").innerHTML = tripList;
        displayMarker();
      }

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
        }

        // 첫번째 검색 정보를 이용하여 지도 중심을 이동 시킵니다
        map.setCenter(positions[0].latlng);
      }

      function moveCenter(lat, lng) {
        map.setCenter(new kakao.maps.LatLng(lat, lng));
      } */
    </script>
	<!-- Template Main JS File -->
	<script src="assets/js/main.js"></script>
	<script src="assets/js/memberCTRL.js"></script>
</body>
</html>