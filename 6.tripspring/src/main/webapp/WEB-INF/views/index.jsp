<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html lang="en">

  <head>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />

    <title>main</title>
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
      rel="stylesheet" />

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
    <%@ include file="include/header.jsp" %>
      <!-- End Header -->

      <!-- ======= Hero Section ======= -->
      <section id="hero" class="hero">
        <div class="container position-relative">
          <div class="row gy-5" data-aos="fade-in">
            <div
              class="col-lg-6 order-2 order-lg-1 d-flex flex-column justify-content-center text-center text-lg-start">
              <h2><span>EnjoyTrip</span></h2>
              <p>이곳에서 여러분이 꿈꾸는 여행을 찾으세요!</p>
              <div class="d-flex justify-content-center justify-content-lg-start">
                <a href="#about" class="btn-get-started">Get Started</a>
              </div>
            </div>
            <div class="col-lg-6 order-1 order-lg-2">
              <img src="assets/img/icon/aeroplane.png" class="img-icon" alt="" data-aos="zoom-out"
                data-aos-delay="100" />
            </div>
          </div>
        </div>

        <div class="icon-boxes position-relative">
          <div class="container position-relative">
            <div class="row gy-4 mt-5">
              <div class="col-xl-3 col-md-6" data-aos="fade-up" data-aos-delay="100">
                <div class="icon-box">
                  <div class="icon"><i class="bi bi-easel"></i></div>
                  <h4 class="title"><a href="${root}/tripsearch" class="stretched-link"> 지역별여행지</a></h4>
                </div>
              </div>
              <!--End Icon Box -->

              <div class="col-xl-3 col-md-6" data-aos="fade-up" data-aos-delay="200">
                <div class="icon-box">
                  <div class="icon"><i class="bi bi-gem"></i></div>
                  <h4 class="title"><a href="${root}/my_trip" class="stretched-link">나의여행계획</a></h4>
                </div>
              </div>
              <!--End Icon Box -->

              <div class="col-xl-3 col-md-6" data-aos="fade-up" data-aos-delay="300">
                <div class="icon-box">
                  <div class="icon"><i class="bi bi-geo-alt"></i></div>
                  <h4 class="title"><a href="${root}/sample-inner-page" class="stretched-link">핫플자랑하기</a></h4>
                </div>
              </div>
              <!--End Icon Box -->

              <div class="col-xl-3 col-md-6" data-aos="fade-up" data-aos-delay="500">
                <div class="icon-box">
                  <div class="icon"><i class="bi bi-command"></i></div>
                  <h4 class="title"><a href="${root}/postWrite" class="stretched-link">여행정보공유</a></h4>
                </div>
              </div>
              <!--End Icon Box -->
            </div>
          </div>
        </div>
      </section>
      <!-- End Hero Section -->

      <main id="main">
        <!-- ======= About Us Section ======= -->
        <section id="about" class="about">
          <div class="container" data-aos="fade-up">
            <div class="section-header">
              <h2>Enjoy Trip!!!</h2>
              <p>여러분은 어떤 여행을 꿈꾸시나요?</p>
              <p>지금 <b>Enjoy Trip</b>과 함께 우리지역의 관광지를 알아보고 나만의 여행 계획을 만들어보세요!!!</p>
            </div>

            <div class="row gy-4">
              <div class="col-lg-6">
                <h3>신나는 여행 계획을 세우고 공유해 보세요.</h3>
                <img src="assets/img/trip/seoul/seoul1.png" class="img-fluid rounded-4 mb-4" alt="" />
                <p>
                  서울은 낮보다 밤이 더 아름다운 도시입니다. 인구도 많고 크기도 크죠. 이 거대한 서울은 야간에는 다양한
                  건물에서 화려한 빛을 냅니다. 이 화려한 야경이 감싸는 서울의 야경은 뉴욕 못지않게 아름다운 야경을
                  제공하죠.
                </p>
                <p>
                  번화한 도시일수록 더욱 아름다운 것이 야경이죠. 특히 서울은 세계적으로도 잠들지 않는 도시로 유명해요.
                  그런 서울에서도 특별히 야경이 아름다운 곳이 있어요. 밤이 화려한 도시 서울에서 로맨틱한 야경을 감상할 수
                  있는 곳은 어디일까요? 밤에만 경험할 수 있는 색다른 체험들도 함께 소개할게요. 서울을 충실하게 즐길 수
                  있는 방법은 바로 서울의 밤을 즐기는 것이랍니다.
                </p>
              </div>
              <div class="col-lg-6">
                <div class="content ps-0 ps-lg-5">
                  <p>
                    제주를 여행한다면 수많은 관광 명소 중 어디를 가야할 지 행복한 고민을 하게 되죠. 산과 오름, 해변, 폭포,
                    용암동굴, 주변 섬 등 어디를 가나 천혜의 아름다운 자연 경관을 만날 수 있어요. 걷기를 좋아한다면 올레,
                    숲길, 휴양림 등의 다양한 형태의 명소들을 찾을 수 있어요.
                  </p>
                  <p>
                    해발 1,950m로 우리나라에서 가장 높은 산인 한라산은 제주 여행에 있어 빼놓을 수 없는 곳이에요. 신비로운
                    백록담과 계절마다 색다른 아름다움을 간직한 한라산 탐방은 오랫동안 잊지 못할 추억이 될 거예요. 한라산
                    탐방 코스는 백록담 정상까지 오르는 관음사, 성판악 코스와 윗세오름 및 남벽분기점까지 오르는 영실,
                    어리목, 돈내코 코스가 있어요. 탐방로마다 난이도와 소요시간이 다르므로 각자의 체력에 맞게 코스를
                    선택해보세요.
                  </p>

                  <div class="position-relative mt-4">
                    <img src="assets/img/trip/jeju/jejudo2.jpg" class="img-fluid rounded-4" alt="" />
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
        <!-- End About Us Section -->



        <!-- ======= Our Services Section ======= -->
        <section id="services" class="services sections-bg">
          <div class="container" data-aos="fade-up">
            <div class="section-header">
              <h2>Our Services</h2>
              <p>
                우리는 언제나 당신의 색다른 여행, 최선의 경험을 위해서 다양한 서비스를 제공합니다. <br />
                우리가 제공하는 서비스와 다양한 사람들의 이야기를 통해서 당신의 여행을 꾸며보세요!
              </p>
            </div>

            <div class="row gy-4" data-aos="fade-up" data-aos-delay="100">
              <div class="col-lg-4 col-md-6">
                <div class="service-item position-relative">
                  <div class="icon">
                    <i class="bi bi-activity"></i>
                  </div>
                  <h3>Connect</h3>
                  <p>
                    당신이 관심사는 당신이 어디로 가야할지 알려줄지도 모르겠네요. 많은 사람들이 당신에게 도움을 주고싶어하고 있을지도요?
                  </p>
                  <a href="#" class="readmore stretched-link">Read more <i class="bi bi-arrow-right"></i></a>
                </div>
              </div>
              <!-- End Service Item -->

              <div class="col-lg-4 col-md-6">
                <div class="service-item position-relative">
                  <div class="icon">
                    <i class="bi bi-broadcast"></i>
                  </div>
                  <h3>Influence Others</h3>
                  <p>
                    당신이 다녀온 지역에, 당신이 살고있는 지역에 방문하려는 사람들을 위해 경험을 공유하세요!
                  </p>
                  <a href="#" class="readmore stretched-link">Read more <i class="bi bi-arrow-right"></i></a>
                </div>
              </div>
              <!-- End Service Item -->

              <div class="col-lg-4 col-md-6">
                <div class="service-item position-relative">
                  <div class="icon">
                    <i class="bi bi-easel"></i>
                  </div>
                  <h3>Get Ready With US</h3>
                  <p>
                    당신의 짐이 빠지지는 않았는지, 여행계획에 부족한 점은 없는지, 놓치고 오는 부분은 없는지 저희와 함께 체크하세요!
                  </p>
                  <a href="#" class="readmore stretched-link">Read more <i class="bi bi-arrow-right"></i></a>
                </div>
              </div>
              <!-- End Service Item -->

              <div class="col-lg-4 col-md-6">
                <div class="service-item position-relative">
                  <div class="icon">
                    <i class="bi bi-bounding-box-circles"></i>
                  </div>
                  <h3>Social Community</h3>
                  <p>
                    여행과 함께 하는 동네생활! 우리 동네와 관련한 다양한 이야기를 이웃과 함께 나누어요.
                  </p>
                  <a href="#" class="readmore stretched-link">Read more <i class="bi bi-arrow-right"></i></a>
                </div>
              </div>
              <!-- End Service Item -->

              <div class="col-lg-4 col-md-6">
                <div class="service-item position-relative">
                  <div class="icon">
                    <i class="bi bi-calendar4-week"></i>
                  </div>
                  <h3>Schedule Management</h3>
                  <p>
                    업무와 일상생활로 바쁜 당신을 위해 여행 스케줄 관리를 도와드립니다.
                  </p>
                  <a href="#" class="readmore stretched-link">Read more <i class="bi bi-arrow-right"></i></a>
                </div>
              </div>
              <!-- End Service Item -->

              <div class="col-lg-4 col-md-6">
                <div class="service-item position-relative">
                  <div class="icon">
                    <i class="bi bi-chat-square-text"></i>
                  </div>
                  <h3>Quality Assurance</h3>
                  <p>
                    사용자 가치를 최우선으로 생각해요. 언제나 여러분의 소식을 듣고 반응하는 사람들이 기다리고 있습니다.
                  </p>
                  <a href="#" class="readmore stretched-link">Read more <i class="bi bi-arrow-right"></i></a>
                </div>
              </div>
              <!-- End Service Item -->
            </div>
          </div>
        </section>
        <!-- End Our Services Section -->


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

  </html>