<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="assets/css/postWrite.css">
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
<title>상세 페이지</title>
</head>

<body>
	<!-- ======= Header ======= -->
	<%@ include file="/include/header.jsp"%>
	<!-- End Header -->
	<c:if test="${not empty att}">
		<table border="1" style="border-collapse: collapse;">
			<tr>
				<th>항목</th>
				<th>내용</th>
			</tr>
			<tr>
				<td>이름</td>
				<td>${att.title}</td>
			</tr>
			<tr>
				<td>이미지</td>
				<td><img src="${att.firstImage2}"/></td>
			</tr>
			<tr>
				<td>latitude</td>
				<td>${att.latitude}</td>
			</tr>
			<tr>
				<td>longitude</td>
				<td>${att.longitude}</td>
			</tr>
			<tr>
				<td>설명</td>
				<td>${att.overview}</td>
			</tr>
		</table>
	</c:if>
	<c:if test="${empty att}">
		<p>조회된 관광지가 없습니다.</p>
	</c:if>
	<a href="${root}/tripsearch.jsp">검색화면으로</a>
	<!-- ======= Footer ======= -->
	<%@ include file="/include/footer.jsp"%>
	<!-- End Footer -->

	<!-- ======= Start modal ======= -->
	<%@ include file="/include/modal.jsp"%>
	<!-- End modal -->


	<!-- Template Main JS File -->
	<script src="assets/js/main.js"></script>
	<script src="assets/js/memberCTRL.js"></script>
</body>

</html>