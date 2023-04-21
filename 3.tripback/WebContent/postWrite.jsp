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
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet" />
    <link href="assets/vendor/aos/aos.css" rel="stylesheet" />
    <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet" />
    <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet" />

    <!-- Template Main CSS File -->
    <link href="assets/css/main.css" rel="stylesheet" />
    <title>Docum ent</title>
</head>

<body>
        <!-- ======= Header ======= -->
  <%@ include file="/include/header.jsp" %>
    <!-- End Header -->

  <main id="main">
    <nav id="wr">
        <h1>여행 정보 공유</h1>
    </nav>
    <form id="newQuote">
        <label for="author">제목</label>
        <input type="text" id="author" />
        <label for="comment">내용</label>
        <textarea name="comment" id="comment" cols="20" rows="10"></textarea>
        <div id="writeButton">
          <div><input type="submit" value="글쓰기" id="submit" /></div>
          <div><input type="reset" value="내용 지우기" id="reset"></div>
        </div>
        
    </form>

    <div class="listed-comments">

    </div>
</main>
    <!-- ======= Footer ======= -->
  <%@ include file="/include/footer.jsp" %>
    <!-- End Footer -->

    <!-- ======= Start modal ======= -->
  <%@ include file="/include/modal.jsp" %>
    <!-- End modal -->


    <!-- Template Main JS File -->
    <script src="assets/js/main.js"></script>
    <script src="assets/js/memberCTRL.js"></script>
</body>

</html>