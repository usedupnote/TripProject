<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />

    <title>Impact Bootstrap Template - Blog</title>
    <meta content="" name="description" />
    <meta content="" name="keywords" />

    <!-- Favicons -->
    <link href="assets/img/favicon.png" rel="icon" />
    <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon" />

    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,600;1,700&family=Montserrat:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&family=Raleway:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
      rel="stylesheet"
    />

    <!-- Vendor CSS Files -->
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet" />
    <link href="assets/vendor/aos/aos.css" rel="stylesheet" />
    <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet" />
    <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet" />

    <!-- Template Main CSS File -->
    <link href="assets/css/main.css" rel="stylesheet" />

  </head>

  <body>
    <!-- ======= Header ======= -->
  <%@ include file="/include/header.jsp" %>
    <!-- End Header -->

    <main id="main">
      <!-- ======= Breadcrumbs ======= -->
      <div class="breadcrumbs">
        <div class="page-header d-flex align-items-center" style="background-image: url('')">
          <div class="container position-relative">
            <div class="row d-flex justify-content-center">
              <div class="col-lg-6 text-center">
                <h2>나만의 여행 계획!</h2>
                <p>나만의 멋진 여행 계획을 세우고 저장해보세요!</p>
              </div>
            </div>
          </div>
        </div>
        <nav>
          <div class="container">
            <ol>
              <li><a href="index.html">Home</a></li>
              <li>나의 계획</li>
            </ol>
          </div>
        </nav>
      </div>
      <!-- End Breadcrumbs -->

      <!-- ======= Blog Section ======= -->
      <section id="blog" class="blog">
        <div class="container" data-aos="fade-up">
          <div class="row gy-4 posts-list">
            <div class="col-xl-4 col-md-6">
              <article>
                <div class="post-img">
                  <img src="assets/img/my_trip/busan.jpg" alt="" width="400px" />
                </div>

                <p class="post-category">부산</p>

                <h2 class="title">
                  <a href="#">사계절의 매력을 담고 있는 부산 알짜배기 가이드북</a>
                </h2>

                <div class="d-flex align-items-center">
                  <img
                    src="https://img.icons8.com/bubbles/100/000000/user.png"
                    alt=""
                    class="post-author-img flex-shrink-0"
                  />
                  <div class="post-meta">
                    <p class="post-author-list">김싸피</p>
                    <p class="post-date">
                      <time datetime="2022-01-01">Jan 1, 2022</time>
                    </p>
                  </div>
                </div>
              </article>
            </div>
            <!-- End post list item -->

            <div class="col-xl-4 col-md-6">
              <article>
                <div class="post-img">
                  <img src="assets/img/my_trip/yeosu.jpg" alt="" width="400px" />
                </div>

                <p class="post-category">여수</p>

                <h2 class="title">
                  <a href="#">낭만도시 여수여행</a>
                </h2>

                <div class="d-flex align-items-center">
                  <img
                    src="https://img.icons8.com/bubbles/100/000000/user.png"
                    alt=""
                    class="post-author-img flex-shrink-0"
                  />
                  <div class="post-meta">
                    <p class="post-author-list">김싸피</p>
                    <p class="post-date">
                      <time datetime="2022-01-01">Jun 5, 2022</time>
                    </p>
                  </div>
                </div>
              </article>
            </div>
            <!-- End post list item -->

            <div class="col-xl-4 col-md-6">
              <article>
                <div class="post-img">
                  <img src="assets/img/my_trip/kangwon.png" alt="" width="400px" />
                </div>

                <p class="post-category">강원도</p>

                <h2 class="title">
                  <a href="#">강원도로 가자!</a>
                </h2>

                <div class="d-flex align-items-center">
                  <img
                    src="https://img.icons8.com/bubbles/100/000000/user.png"
                    alt=""
                    class="post-author-img flex-shrink-0"
                  />
                  <div class="post-meta">
                    <p class="post-author-list">김싸피</p>
                    <p class="post-date">
                      <time datetime="2022-01-01">Jun 22, 2022</time>
                    </p>
                  </div>
                </div>
              </article>
            </div>
            <!-- End post list item -->
          </div>
          <!-- End blog posts list -->

          <div class="blog-pagination">
            <ul class="justify-content-center">
              <li><a href="#">1</a></li>
              <li class="active"><a href="#">2</a></li>
              <li><a href="#">3</a></li>
            </ul>
          </div>
          <!-- End blog pagination -->
        </div>
      </section>
      <!-- End Blog Section -->
    </main>
    <!-- End #main -->

    <!-- ======= Footer ======= -->
  <%@ include file="/include/footer.jsp" %>
    <!-- End Footer -->

    <!-- ======= Start modal ======= -->
  <%@ include file="/include/modal.jsp" %>
    <!-- End modal -->
    <a href="#" class="scroll-top d-flex align-items-center justify-content-center"
      ><i class="bi bi-arrow-up-short"></i
    ></a>

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
    <script src="assets/js/memberCTRL.js"></script>
  </body>
</html>