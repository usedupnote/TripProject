<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html lang="en">

  <head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>핫플 자랑하기</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <!-- Favicons -->
    <link href="assets/img/favicon.png" rel="icon">
    <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
      href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,600;1,700&family=Montserrat:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&family=Raleway:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
      rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="assets/vendor/aos/aos.css" rel="stylesheet">
    <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
    <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="assets/css/main.css" rel="stylesheet">
  </head>

  <body>
    <!-- ======= Header ======= -->
    <%@ include file="include/header.jsp" %>
      <!-- End Header -->

      <main id="main">
        <!-- ======= Breadcrumbs ======= -->
        <div class="breadcrumbs">
          <div class="page-header d-flex align-items-center" style="background-image: url('');">
            <div class="container position-relative">
              <div class="row d-flex justify-content-center">
                <div class="col-lg-6 text-center">
                  <h2>공유된 핫플</h2>
                  <p></p>
                </div>
              </div>
            </div>
          </div>
          <nav>
            <div class="container">
              <ol>
                <li><a href="index.html">Home</a></li>
                <li>공유된 핫플</li>
              </ol>
            </div>
          </nav>
        </div>
        <!-- End Breadcrumbs -->

        <div class="sample-page">
          <div class="container" data-aos="fade-up">
            <div class="row justify-content-center">
              <div class="col-lg-12 col-md-10 col-sm-12" style="margin-top: 5%; margin-bottom: 5%;">
                <div class="row align-self-center mb-2">
                  <div class="col-md-2 text-start">
                    <a href="http://localhost:8080/postWrite" type="button" id="btn-mv-register"
                      class="btn btn-outline-primary btn-sm">
                      글쓰기
                    </a>
                  </div>
                  <div class="col-md-7 offset-3">
                    <form class="d-flex" id="form-search" action="">
                      <input type="hidden" name="pgno" value="1" />
                      <select name="key" id="key" class="form-select form-select-sm ms-5 me-1 w-50" aria-label="검색조건">
                        <option selected>검색조건</option>
                        <option value="subject">제목</option>
                        <option value="userid">작성자</option>
                      </select>
                      <div class="input-group input-group-sm">
                        <input type="text" name="word" id="word" class="form-control" placeholder="검색어..." />
                        <button id="btn-search" class="btn btn-dark" type="button">검색</button>
                      </div>
                    </form>
                  </div>
                </div>
                <table class="table table-hover">
                  <thead>
                    <tr class="text-center">
                      <th scope="col">글번호</th>
                      <th scope="col">제목</th>
                      <th scope="col">작성자</th>
                      <th scope="col">조회수</th>
                      <th scope="col">작성일</th>
                    </tr>
                  </thead>
                  <tbody id="content-table-body">
                  </tbody>
                </table>
              </div>
              <div class="row">
                ${navigation.navigator}
              </div>
            </div>
          </div>
          <form id="form-param" method="get" action="">
            <input type="hidden" name="pgno" id="pgno" value="${pgno}">
            <input type="hidden" name="key" value="${key}">
            <input type="hidden" name="word" value="${word}">
          </form>
          <form id="form-no-param" method="get" action="${root}/article/view">
            <input type="hidden" name="pgno" value="${pgno}">
            <input type="hidden" name="key" value="${key}">
            <input type="hidden" name="word" value="${word}">
            <input type="hidden" id="articleno" name="articleno" value="">
          </form>
        </div>
        </section>

      </main><!-- End #main -->

      <!-- ======= Footer ======= -->
      <%@ include file="include/footer.jsp" %>
        <!-- End Footer -->

        <!-- ======= Start modal ======= -->
        <%@ include file="include/modal.jsp" %>
          <!-- End modal -->

          <a href="#" class="scroll-top d-flex align-items-center justify-content-center"><i
              class="bi bi-arrow-up-short"></i></a>

          <div id="preloader"></div>

          <!-- Vendor JS Files -->
          <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
          <script src="assets/vendor/aos/aos.js"></script>
          <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
          <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
          <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
          <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
          <script src="assets/vendor/php-email-form/validate.js"></script>

          <!-- Template Main JS File -->
          <script src="assets/js/main.js"></script>
  </body>

  <script>
    function modalData(id) {
      fetch(`${root}/board/\${id}`)
        .then((response) => {
          return response.json()
        })
        .then((data) => {
          let boardId = document.getElementById("boardModalId");
          boardId.value = data.id;
          let boardModalTitle = document.getElementById("boardModalTitle");
          boardModalTitle.innerHTML = data.title;
          let boardModalContent = document.getElementById("boardModalContent");
          boardModalContent.value = data.content;
        })
    }
    window.addEventListener("load", function () {
      let contentTableBody = document.getElementById("content-table-body");
      fetch('${root}/board')
        .then((response) => {
          if (response.status != 200) {
          }
          return response.json();
        })
        .then((data) => {
          data.forEach(element => {
            let tr = document.createElement("tr");
            tr.setAttribute("class", "text-center");
            tr.innerHTML = `
            <th scope="row">\${element.id}</th>
	                <td class="text-start">
	                  <a
                      data-bs-toggle="modal"
                      data-bs-target="#boardModal"
	                    href="#"
	                    class="article-title link-dark"
	                    data-no="\${element.id}"
	                    style="text-decoration: none"
                      onclick=modalData(\${element.id})
	                  >
                    \${element.title}
	                </td>
	                <td>\${element.userEmail}</td>
	                <td>\${element.viewCount}</td>
	                <td>\${element.createTime}</td>`
            contentTableBody.appendChild(tr);
          });
        });
    });
  </script>

  </html>